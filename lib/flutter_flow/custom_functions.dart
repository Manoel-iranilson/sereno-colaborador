import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';
import 'package:live_cam_8t99qi/flutter_flow/custom_functions.dart'
    as live_cam_8t99qi_functions;

DateTime inicioDoDia(
  DateTime data,
  String tipo,
) {
  if (tipo == "inicio") {
    return DateTime(data.year, data.month, data.day); // Início do dia
  } else if (tipo == "final") {
    return DateTime(
        data.year, data.month, data.day, 23, 59, 59, 999); // Final do dia
  } else {
    throw ArgumentError("O parâmetro 'tipo' deve ser 'inicio' ou 'final'.");
  }
}

List<ColaboradoresRow> faltantes(
  List<ColaboradoresRow> colaboradores,
  List<ColaboRegistroPontoRow> registros,
) {
  // Obtenha uma lista de IDs de colaboradores presentes nos registros
  final idsNosRegistros =
      registros.map((registro) => registro.idColaborador).toSet();

  // Filtre os colaboradores cujo ID não está na lista de IDs dos registros
  final colaboradoresFaltantes = colaboradores
      .where(
        (colaborador) => !idsNosRegistros.contains(colaborador.id),
      )
      .toList();

  return colaboradoresFaltantes;
}

bool localizacaoJOB(LatLng localizacaoAtual) {
  /// Coordenadas da localização de referência
  const double latitudeRef = -7.225488342853787;
  const double longitudeRef = -39.34357399927141;

  // Converte graus para radianos
  double toRadians(double degree) => degree * (math.pi / 180);

  // Raio da Terra em metros
  const double raioTerra = 6371000;

  // Coordenadas em radianos
  final double lat1 = toRadians(localizacaoAtual.latitude);
  final double lon1 = toRadians(localizacaoAtual.longitude);
  final double lat2 = toRadians(latitudeRef);
  final double lon2 = toRadians(longitudeRef);

  // Diferenças entre coordenadas
  final double deltaLat = lat2 - lat1;
  final double deltaLon = lon2 - lon1;

  // Fórmula de Haversine
  final double a = math.sin(deltaLat / 2) * math.sin(deltaLat / 2) +
      math.cos(lat1) *
          math.cos(lat2) *
          math.sin(deltaLon / 2) *
          math.sin(deltaLon / 2);
  final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  // Distância em metros
  final double distancia = raioTerra * c;

  // Verifica se a distância está dentro do raio de 20 metros
  const double raioMetros = 20;
  return distancia <= raioMetros;
}

String verificarHorario(
  DateTime horario,
  DateTime? inicioExpediente,
  DateTime? fimExpediente,
  DateTime? inicioIntervalo,
  DateTime? fimIntervalo,
  List<String> batidasAnteriores,
) {
// Primeira batida do dia - ACEITA CHEGADA ANTES DO HORÁRIO
  if (batidasAnteriores.isEmpty) {
    if (horario.isAtSameMomentAs(inicioExpediente!) ||
        horario.isBefore(inicioExpediente!)) {
      return "entrada";
    } else {
      return "entrada atrasada";
    }
  }

// Verificar batidas anteriores
  bool temEntrada = batidasAnteriores.contains("entrada") ||
      batidasAnteriores.contains("entrada atrasada");
  bool temSaidaIntervalo = batidasAnteriores.contains("saida intervalo");
  bool temRetornoIntervalo = batidasAnteriores.contains("retorno intervalo");
  bool temSaida = batidasAnteriores.contains("saída");

// Saída para intervalo - FLEXÍVEL
  if (temEntrada && !temSaidaIntervalo && !temRetornoIntervalo && !temSaida) {
    // Pode sair para intervalo a qualquer hora após a entrada
    if (horario.isBefore(fimExpediente!)) {
      return "saida intervalo";
    }
  }

// Retorno do intervalo - ACEITA RETORNO ANTES DO HORÁRIO PREVISTO
  if (temSaidaIntervalo && !temRetornoIntervalo && !temSaida) {
    // Pode voltar a qualquer hora após ter saído para intervalo
    if (horario.isBefore(fimExpediente!)) {
      return "retorno intervalo";
    }
  }

// Saída final
  if (temRetornoIntervalo && !temSaida) {
    if (horario.isAtSameMomentAs(fimExpediente!) ||
        horario.isAfter(fimExpediente!)) {
      return "saída";
    }
  }

// Caso especial: funcionário que não fez intervalo
  if (temEntrada && !temSaidaIntervalo && !temRetornoIntervalo && !temSaida) {
    if (horario.isAtSameMomentAs(fimExpediente!) ||
        horario.isAfter(fimExpediente!)) {
      return "saída";
    }
  }

  return "fora do horário especificado";
}

double calcularPontosAtraso(DateTime horario) {
  // Define os horários de entrada
  final int horaEntradaManha = 7;
  final int minutoEntradaManha = 35;
  final int horaEntradaTarde = 13;
  final int minutoEntradaTarde = 21;

// Obtém a hora e o minuto do horário de chegada
  final int hora = horario.hour;
  final int minuto = horario.minute;
  int atrasoMinutos = 0;

// Verifica se o horário de chegada é após a hora de entrada da manhã ou tarde
  if (hora > horaEntradaManha ||
      (hora == horaEntradaManha && minuto > minutoEntradaManha)) {
    atrasoMinutos =
        (hora - horaEntradaManha) * 60 + minuto - minutoEntradaManha;
  } else if (hora > horaEntradaTarde ||
      (hora == horaEntradaTarde && minuto > minutoEntradaTarde)) {
    atrasoMinutos =
        (hora - horaEntradaTarde) * 60 + minuto - minutoEntradaTarde;
  }

// Calcula os pontos de atraso
  if (atrasoMinutos > 0 && atrasoMinutos <= 10) {
    return 0.25;
  } else if (atrasoMinutos > 10 && atrasoMinutos <= 15) {
    return 0.5;
  } else if (atrasoMinutos > 15 && atrasoMinutos <= 30) {
    return 1.0;
  } else if (atrasoMinutos > 30) {
    return 1.0;
  }

  return 0.0;
}

String calculodehoras(List<ColaboRegistroPontoRow> dados) {
  // Ordenar os registros por data e hora
  dados.sort((a, b) => a.createdAt.compareTo(b.createdAt));

  int totalMinutos = 0;

  // Iterar sobre os registros em pares (entrada -> saída)
  for (int i = 0; i < dados.length - 1; i += 2) {
    DateTime entrada = dados[i].createdAt;
    DateTime saida = dados[i + 1].createdAt;

    // Calcular a diferença em minutos
    totalMinutos += saida.difference(entrada).inMinutes;
  }

  // Converter minutos totais em horas e minutos
  int horas = totalMinutos ~/ 60;
  int minutos = totalMinutos % 60;

  // Retornar no formato "X h e Y m"
  return "${horas} h e ${minutos} m";
}

DateTime inicioFImMes(
  DateTime mes,
  bool retornoInicio,
) {
  // Início do mês
  /// Retorna o início ou o fim do mês com base na data fornecida e na condição

  // Início do mês
  DateTime inicioMes = DateTime(mes.year, mes.month, 1);

  // Fim do mês
  DateTime fimMes = DateTime(mes.year, mes.month + 1, 0);

  return retornoInicio ? inicioMes : fimMes;
}

double convertTimeToFloat(
  DateTime timeInicial,
  DateTime timefinal,
) {
  // Parse the time string in HH:mm:ss format
  Duration diferenca = timefinal.difference(timeInicial);
  double minutosTotais =
      diferenca.inMinutes + (diferenca.inSeconds.remainder(60) / 60);
  return minutosTotais;
}

DateTime corrigirHora(DateTime hora) {
  return hora.add(Duration(hours: 3));
}

String? converterBancoHoras(double? minutos) {
  if (minutos == null) return null;

  minutos = minutos.abs(); // Converte para positivo se for negativo

  int horas = minutos ~/ 60; // Obtém a parte inteira das horas
  int min = (minutos % 60).toInt(); // Obtém os minutos restantes

  return '${horas.toString().padLeft(2, '0')}:${min.toString().padLeft(2, '0')}';
}

double? calcularLista(List<double>? valores) {
  if (valores == null || valores.isEmpty) {
    return 0.00; // Retorna 'R$ 0.00' se a lista for nula ou vazia
  }

  double soma = 0;
  for (double elemento in valores) {
    soma += elemento; // Soma os valores diretamente como double
  }

  // Formata o valor como moeda no formato 'R$ 00.00'

  return soma;
}

List<ColaboradoresRow>? filtrarColaboradoresPorPresenca(
  List<ColaboRegistroPontoRow> registros,
  List<ColaboradoresRow> colaboradores,
  bool mostrarFaltantes,
) {
  final idsNosRegistros =
      registros.map((registro) => registro.idColaborador).toSet();

  // Se mostrarFaltantes == true, retorna quem NÃO está nos registros
  // Se mostrarFaltantes == false, retorna quem ESTÁ nos registros
  final resultado = colaboradores.where((colaborador) {
    final contem = idsNosRegistros.contains(colaborador.id);
    return mostrarFaltantes ? !contem : contem;
  }).toList();

  return resultado;
}

int calcularMinutosTrabalhados(
  String inicio,
  String fim,
  String inicioIntervalo,
  String fimIntervalo,
) {
// Função auxiliar para converter uma string "HH:mm" em DateTime
  DateTime parseHorario(String hora) {
    final partes = hora.split(':');
    return DateTime(0, 1, 1, int.parse(partes[0]), int.parse(partes[1]));
  }

  final inicioDt = parseHorario(inicio);
  final fimDt = parseHorario(fim);
  final inicioIntervaloDt = parseHorario(inicioIntervalo);
  final fimIntervaloDt = parseHorario(fimIntervalo);

  final duracaoTotal = fimDt.difference(inicioDt);
  final duracaoIntervalo = fimIntervaloDt.difference(inicioIntervaloDt);

  final duracaoTrabalhada = duracaoTotal - duracaoIntervalo;

  return duracaoTrabalhada.inMinutes;
}

int diferencaEntredias(
  DateTime inicio,
  DateTime fim,
) {
  DateTime i = DateTime(inicio.year, inicio.month, inicio.day);
  DateTime f = DateTime(fim.year, fim.month, fim.day);

  return f.difference(i).inDays;
}

DateTime incrementarDias(
  DateTime data,
  int dias,
) {
  // Normaliza a data (caso não queira levar hora em conta)
  DateTime base = DateTime(data.year, data.month, data.day);

  // Retorna a data somada com a quantidade de dias
  return base.add(Duration(days: dias));
}

String converterstringURL(String urlfoto) {
  return urlfoto;
}
