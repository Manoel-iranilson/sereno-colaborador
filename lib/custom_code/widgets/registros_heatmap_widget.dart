// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegistrosHeatmapWidget extends StatefulWidget {
  const RegistrosHeatmapWidget({
    super.key,
    this.width,
    this.height,
    this.idColaborador,
    this.actionJustificar,
    this.actionPonto,
    required this.permitirAcao,
    this.verDoc,
    this.actionBaixarComprovante,
    this.actionVerFoto,
  });

  final double? width;
  final double? height;
  final String? idColaborador;
  final Future Function(DateTime dia)? actionJustificar;
  final Future Function(DateTime dia)? actionPonto;
  final bool permitirAcao;
  final Future Function(String url)? verDoc;
  final Future Function(int idRegistro)? actionBaixarComprovante;
  final Future Function(String url)? actionVerFoto;

  @override
  State<RegistrosHeatmapWidget> createState() => _RegistrosHeatmapWidgetState();
}

class _RegistrosHeatmapWidgetState extends State<RegistrosHeatmapWidget> {
  Map<DateTime, List<Map<String, dynamic>>> registrosDetalhadosPorDia = {};
  Map<DateTime, Map<String, dynamic>> faltasPorDia = {};
  Map<DateTime, bool> feriasPorDia = {};

  DateTime mesSelecionado = DateTime.now();
  bool isLoading = true;
  String? errorMessage;

  static const _diasSemana = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'];

  // Offset fixo do banco (horário de Brasília, sem horário de verão)
  static const _offsetBancoHoras = -3;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  @override
  void didUpdateWidget(RegistrosHeatmapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.idColaborador != oldWidget.idColaborador) {
      _carregarDados();
    }
  }

  void _alterarMes(int direcao) {
    setState(() {
      mesSelecionado =
          DateTime(mesSelecionado.year, mesSelecionado.month + direcao, 1);
    });
    _carregarDados();
  }

  /// Faz o parse de uma data/hora vinda do Supabase forçando o fuso -03
  /// (horário de Brasília), independente do timezone do dispositivo.
  ///
  /// - Se a string vier com offset explícito (ex: "2025-07-18 07:26:00-03"),
  ///   o `DateTime.parse` converte automaticamente para UTC. Aqui desfazemos
  ///   essa conversão somando o offset de volta, mantendo os campos
  ///   (hora, dia, etc.) representando o horário local de -03.
  /// - Se a string vier sem offset/hora (ex: "2025-07-18", colunas `date`),
  ///   o parse já retorna os campos corretos e nenhum ajuste é necessário.
  static DateTime _parseDataBanco(String raw) {
    final dt = DateTime.parse(raw);
    if (dt.isUtc) {
      return dt.add(const Duration(hours: _offsetBancoHoras));
    }
    return dt;
  }

  Future<void> _carregarDados() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      final inicioMes = DateTime(mesSelecionado.year, mesSelecionado.month, 1);
      // Início do próximo mês: usado como limite exclusivo (lt) para não
      // cortar registros do último dia do mês selecionado.
      final inicioProximoMes =
          DateTime(mesSelecionado.year, mesSelecionado.month + 1, 1);

      // ================= REGISTROS =================

      final baseQuery = Supabase.instance.client
          .from('colabo_registro_ponto')
          .select(
            'id, data_ponto, tipo_ponto, url_foto, externo, localizacao, ajustado_sistema',
          )
          .gte('data_ponto', inicioMes.toIso8601String())
          .lt('data_ponto', inicioProximoMes.toIso8601String());

      final response = await (widget.idColaborador != null
          ? baseQuery
              .eq('id_colaborador', widget.idColaborador!)
              .order('data_ponto', ascending: true)
          : baseQuery.order('data_ponto', ascending: true));

      Map<DateTime, List<Map<String, dynamic>>> mapaRegistros = {};

      if (response is List) {
        for (var registro in response) {
          if (registro['data_ponto'] != null) {
            DateTime data = _parseDataBanco(registro['data_ponto']);
            DateTime normalizada = DateTime(data.year, data.month, data.day);

            mapaRegistros.putIfAbsent(normalizada, () => []);
            mapaRegistros[normalizada]!.add({
              'id': registro['id'],
              'data_ponto': data,
              'tipo_ponto': registro['tipo_ponto']?.toString() ?? '—',
              'url_foto': registro['url_foto'],
              'externo': registro['externo'] ?? false,
              'localizacao': registro['localizacao'],
              'ajustado_sistema': registro['ajustado_sistema'] ?? false,
            });
          }
        }
      }

      // ================= FALTAS =================

      final baseFaltas = Supabase.instance.client
          .from('colabo_faltas')
          .select('data_falta, obs, justificada, documento_atestado')
          .gte('data_falta', inicioMes.toIso8601String())
          .lt('data_falta', inicioProximoMes.toIso8601String());

      final responseFaltas = await (widget.idColaborador != null
          ? baseFaltas.eq('id_colaborador', widget.idColaborador!)
          : baseFaltas);

      Map<DateTime, Map<String, dynamic>> mapaFaltas = {};

      if (responseFaltas is List) {
        for (var falta in responseFaltas) {
          if (falta['data_falta'] != null) {
            DateTime data = _parseDataBanco(falta['data_falta']);
            DateTime normalizada = DateTime(data.year, data.month, data.day);

            mapaFaltas[normalizada] = {
              'descricao': falta['obs']?.toString() ?? 'Sem descrição',
              'abonada': falta['justificada'] ?? false,
              'atestado': falta['documento_atestado'],
            };
          }
        }
      }

      // ================= FÉRIAS =================

      final baseFerias = Supabase.instance.client
          .from('colabo_ferias')
          .select('dia')
          .gte('dia', inicioMes.toIso8601String())
          .lt('dia', inicioProximoMes.toIso8601String());

      final responseFerias = await (widget.idColaborador != null
          ? baseFerias.eq('id_colaborador', widget.idColaborador!)
          : baseFerias);

      Map<DateTime, bool> mapaFerias = {};

      if (responseFerias is List) {
        for (var ferias in responseFerias) {
          if (ferias['dia'] != null) {
            DateTime data = _parseDataBanco(ferias['dia']);
            DateTime normalizada = DateTime(data.year, data.month, data.day);
            mapaFerias[normalizada] = true;
          }
        }
      }

      if (!mounted) return;

      setState(() {
        registrosDetalhadosPorDia = mapaRegistros;
        faltasPorDia = mapaFaltas;
        feriasPorDia = mapaFerias;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Erro ao carregar dados: $e';
        isLoading = false;
      });
    }
  }

  // ─── Helpers ─────────────────────────────────────────────────────────────

  List<Map<String, dynamic>> _getRegistrosDoDia(DateTime dia) {
    final normalizada = DateTime(dia.year, dia.month, dia.day);
    return registrosDetalhadosPorDia[normalizada] ?? [];
  }

  Map<String, dynamic>? _getFaltaDoDia(DateTime dia) {
    final normalizada = DateTime(dia.year, dia.month, dia.day);
    return faltasPorDia[normalizada];
  }

  bool _isFerias(DateTime dia) {
    final normalizada = DateTime(dia.year, dia.month, dia.day);
    return feriasPorDia[normalizada] ?? false;
  }

  int _getTotalRegistrosMes() {
    return registrosDetalhadosPorDia.values
        .fold(0, (sum, lista) => sum + lista.length);
  }

  Color _getColorForCount(int count) {
    if (count == 0) return const Color(0xFFEEEEEE);
    if (count == 1) return const Color(0xFF9E9E9E);
    if (count == 2) return const Color(0xFF66BB6A);
    return const Color(0xFF43A047);
  }

  // ─── Dialog detalhado ────────────────────────────────────────────────────

  void _mostrarDetalhes(BuildContext context, DateTime data) {
    final registros = _getRegistrosDoDia(data);
    final falta = _getFaltaDoDia(data);
    final isFerias = _isFerias(data);
    final fmt = DateFormat('HH:mm', 'pt_BR');
    final fmtData = DateFormat('dd/MM/yyyy', 'pt_BR');

    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420, maxHeight: 600),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Cabeçalho ──────────────────────────────────────────────
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(dialogContext).colorScheme.primary,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        fmtData.format(data),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close,
                          color: Colors.white, size: 20),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => Navigator.pop(dialogContext),
                    ),
                  ],
                ),
              ),

              // ── Corpo ──────────────────────────────────────────────────
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Badges de status
                      if (isFerias || falta != null)
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: [
                            if (isFerias)
                              _StatusChip(
                                label: 'Férias',
                                color: const Color(0xFF1E88E5),
                                icon: Icons.beach_access,
                              ),
                            if (falta != null)
                              _StatusChip(
                                label: falta['abonada']
                                    ? 'Falta Justificada'
                                    : 'Falta Não Justificada',
                                color: falta['abonada']
                                    ? const Color(0xFFFDD835)
                                    : const Color(0xFFE53935),
                                icon: falta['abonada']
                                    ? Icons.check_circle_outline
                                    : Icons.cancel_outlined,
                                textColor: falta['abonada']
                                    ? Colors.black87
                                    : Colors.white,
                              ),
                          ],
                        ),

                      // Descrição da falta
                      if (falta != null) ...[
                        const SizedBox(height: 12),
                        _InfoRow(
                          icon: Icons.notes,
                          label: 'Observação',
                          value: falta['descricao'],
                        ),
                        if (falta['atestado'] != null &&
                            widget.verDoc != null) ...[
                          const SizedBox(height: 8),
                          OutlinedButton.icon(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                              widget.verDoc!(falta['atestado']);
                            },
                            icon: const Icon(Icons.attach_file, size: 16),
                            label: const Text('Ver atestado'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              textStyle: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                        const Divider(height: 28),
                      ] else if (isFerias) ...[
                        const SizedBox(height: 16),
                      ],

                      // ── Lista de registros ──────────────────────────
                      if (registros.isEmpty)
                        const _EmptyRegistros()
                      else ...[
                        Text(
                          '${registros.length} registro${registros.length > 1 ? 's' : ''} no dia',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...registros.map(
                          (reg) => _RegistroCard(
                            registro: reg,
                            fmt: fmt,
                            onBaixarComprovante:
                                widget.actionBaixarComprovante != null
                                    ? () {
                                        Navigator.pop(dialogContext);
                                        widget.actionBaixarComprovante!(
                                            reg['id'] as int);
                                      }
                                    : null,
                            onVerFoto: reg['url_foto'] != null &&
                                    widget.actionVerFoto != null
                                ? () {
                                    Navigator.pop(dialogContext);
                                    widget.actionVerFoto!(
                                        reg['url_foto'] as String);
                                  }
                                : null,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              // ── Rodapé de ações ────────────────────────────────────────
              if (widget.permitirAcao)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      if (widget.actionJustificar != null)
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                              widget.actionJustificar!(data);
                            },
                            icon: const Icon(Icons.edit_note, size: 16),
                            label: const Text('Justificar'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                      if (widget.actionJustificar != null &&
                          widget.actionPonto != null)
                        const SizedBox(width: 8),
                      if (widget.actionPonto != null)
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                              widget.actionPonto!(data);
                            },
                            icon:
                                const Icon(Icons.add_circle_outline, size: 16),
                            label: const Text('Lançar Ponto'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── BUILD ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    }

    final primeiroDia = DateTime(mesSelecionado.year, mesSelecionado.month, 1);
    final ultimoDia =
        DateTime(mesSelecionado.year, mesSelecionado.month + 1, 0);
    final diasNoMes = ultimoDia.day;

    int inicioSemana = primeiroDia.weekday == 7 ? 0 : primeiroDia.weekday;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Navegação de mês ──────────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () => _alterarMes(-1),
            ),
            Column(
              children: [
                Text(
                  DateFormat('MMMM yyyy', 'pt_BR').format(mesSelecionado),
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                Text(
                  '${_getTotalRegistrosMes()} registros no mês',
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _carregarDados,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => _alterarMes(1),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 8),

        // ── Cabeçalho dias da semana ──────────────────────────────────────
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 7,
          childAspectRatio: 1.8,
          children: _diasSemana
              .map(
                (d) => Center(
                  child: Text(
                    d,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              )
              .toList(),
        ),

        // ── Grid de dias ──────────────────────────────────────────────────
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemCount: inicioSemana + diasNoMes,
          itemBuilder: (context, index) {
            if (index < inicioSemana) return const SizedBox();

            final dia = index - inicioSemana + 1;
            final data =
                DateTime(mesSelecionado.year, mesSelecionado.month, dia);

            final registros = _getRegistrosDoDia(data);
            final falta = _getFaltaDoDia(data);
            final isFerias = _isFerias(data);
            final hoje = DateTime.now();
            final isHoje = data.year == hoje.year &&
                data.month == hoje.month &&
                data.day == hoje.day;

            Color cor;
            if (isFerias) {
              cor = const Color(0xFF1E88E5);
            } else if (falta != null) {
              cor = falta['abonada']
                  ? const Color(0xFFFDD835)
                  : const Color(0xFFE53935);
            } else {
              cor = _getColorForCount(registros.length);
            }

            return GestureDetector(
              onTap: () => _mostrarDetalhes(context, data),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: cor,
                  borderRadius: BorderRadius.circular(7),
                  border: isHoje
                      ? Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        )
                      : null,
                  boxShadow: isHoje
                      ? [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.3),
                            blurRadius: 4,
                          )
                        ]
                      : null,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      '$dia',
                      style: TextStyle(
                        color: _textColorFor(cor),
                        fontSize: 12,
                        fontWeight:
                            isHoje ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    if (registros.isNotEmpty)
                      Positioned(
                        bottom: 3,
                        right: 4,
                        child: Text(
                          '${registros.length}',
                          style: TextStyle(
                            fontSize: 8,
                            color: _textColorFor(cor).withOpacity(0.75),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 16),

        // ── Legenda ───────────────────────────────────────────────────────
        _Legenda(),
      ],
    );
  }

  Color _textColorFor(Color bg) {
    final luminance = bg.computeLuminance();
    return luminance > 0.5 ? Colors.black87 : Colors.white;
  }
}

// ─── Widgets auxiliares ────────────────────────────────────────────────────

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.color,
    required this.icon,
    this.textColor = Colors.white,
  });

  final String label;
  final Color color;
  final IconData icon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color,
      avatar: Icon(icon, size: 14, color: textColor),
      label: Text(
        label,
        style: TextStyle(
            color: textColor, fontSize: 12, fontWeight: FontWeight.w600),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.grey[500]),
        const SizedBox(width: 6),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 13),
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _EmptyRegistros extends StatelessWidget {
  const _EmptyRegistros();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Column(
        children: [
          Icon(Icons.inbox_outlined, size: 36, color: Colors.grey[400]),
          const SizedBox(height: 6),
          Text(
            'Sem registros neste dia',
            style: TextStyle(color: Colors.grey[500], fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _RegistroCard extends StatelessWidget {
  const _RegistroCard({
    required this.registro,
    required this.fmt,
    this.onBaixarComprovante,
    this.onVerFoto,
  });

  final Map<String, dynamic> registro;
  final DateFormat fmt;
  final VoidCallback? onBaixarComprovante;
  final VoidCallback? onVerFoto;

  @override
  Widget build(BuildContext context) {
    final hora = registro['data_ponto'] is DateTime
        ? fmt.format(registro['data_ponto'] as DateTime)
        : '—';
    final tipo = registro['tipo_ponto'] as String;
    final externo = registro['externo'] as bool;
    final ajustado = registro['ajustado_sistema'] as bool;
    final localizacao = registro['localizacao'] as String?;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.access_time, size: 15, color: Colors.blueGrey),
              const SizedBox(width: 4),
              Text(
                hora,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(width: 8),
              _TipoChip(tipo: tipo),
              const Spacer(),
              if (externo)
                _MiniTag(label: 'Externo', color: const Color(0xFF8E24AA)),
              if (ajustado)
                _MiniTag(label: 'Ajustado', color: const Color(0xFFF57C00)),
            ],
          ),
          if (localizacao != null && localizacao.isNotEmpty) ...[
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                    size: 13, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    localizacao,
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
          if (onVerFoto != null || onBaixarComprovante != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                if (onVerFoto != null)
                  _ActionButton(
                    icon: Icons.photo_outlined,
                    label: 'Ver foto',
                    onPressed: onVerFoto!,
                  ),
                if (onVerFoto != null && onBaixarComprovante != null)
                  const SizedBox(width: 8),
                if (onBaixarComprovante != null)
                  _ActionButton(
                    icon: Icons.download_outlined,
                    label: 'Comprovante',
                    onPressed: onBaixarComprovante!,
                    filled: true,
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _TipoChip extends StatelessWidget {
  const _TipoChip({required this.tipo});
  final String tipo;

  @override
  Widget build(BuildContext context) {
    Color cor;
    switch (tipo.toLowerCase()) {
      case 'entrada':
        cor = const Color(0xFF43A047);
        break;
      case 'saída':
      case 'saida':
        cor = const Color(0xFFE53935);
        break;
      case 'intervalo':
        cor = const Color(0xFFFB8C00);
        break;
      default:
        cor = Colors.blueGrey;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: cor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: cor.withOpacity(0.4)),
      ),
      child: Text(
        tipo,
        style: TextStyle(fontSize: 11, color: cor, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _MiniTag extends StatelessWidget {
  const _MiniTag({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style:
            TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.filled = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    if (filled) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 14),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          textStyle: const TextStyle(fontSize: 12),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      );
    }

    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 14, color: primary),
      label: Text(label, style: TextStyle(color: primary)),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        textStyle: const TextStyle(fontSize: 12),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(color: primary.withOpacity(0.5)),
      ),
    );
  }
}

class _Legenda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      (const Color(0xFFEEEEEE), 'Sem registro'),
      (const Color(0xFF9E9E9E), '1 registro'),
      (const Color(0xFF66BB6A), '2 registros'),
      (const Color(0xFF43A047), '3+ registros'),
      (const Color(0xFFE53935), 'Falta'),
      (const Color(0xFFFDD835), 'Falta justif.'),
      (const Color(0xFF1E88E5), 'Férias'),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 6,
      children: items.map((item) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: item.$1,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.black12),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              item.$2,
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            ),
          ],
        );
      }).toList(),
    );
  }
}
