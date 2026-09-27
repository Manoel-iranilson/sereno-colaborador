import '../database.dart';

class EmpresaTable extends SupabaseTable<EmpresaRow> {
  @override
  String get tableName => 'empresa';

  @override
  EmpresaRow createRow(Map<String, dynamic> data) => EmpresaRow(data);
}

class EmpresaRow extends SupabaseDataRow {
  EmpresaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EmpresaTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get cnpj => getField<String>('cnpj');
  set cnpj(String? value) => setField<String>('cnpj', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get inscricaoEstadual => getField<String>('inscrição_estadual');
  set inscricaoEstadual(String? value) =>
      setField<String>('inscrição_estadual', value);

  dynamic? get endereco => getField<dynamic>('endereco');
  set endereco(dynamic? value) => setField<dynamic>('endereco', value);

  bool? get bancoHoras => getField<bool>('banco_horas');
  set bancoHoras(bool? value) => setField<bool>('banco_horas', value);

  bool? get gamificacao => getField<bool>('gamificacao');
  set gamificacao(bool? value) => setField<bool>('gamificacao', value);

  bool? get pontoApenasEmpresa => getField<bool>('ponto_apenas_empresa');
  set pontoApenasEmpresa(bool? value) =>
      setField<bool>('ponto_apenas_empresa', value);

  String? get localizacaoEmpresa => getField<String>('localizacao_empresa');
  set localizacaoEmpresa(String? value) =>
      setField<String>('localizacao_empresa', value);

  String? get codigoEmpresa => getField<String>('codigo_empresa');
  set codigoEmpresa(String? value) => setField<String>('codigo_empresa', value);

  String? get logo => getField<String>('logo');
  set logo(String? value) => setField<String>('logo', value);

  bool? get cadastroCelular => getField<bool>('cadastroCelular');
  set cadastroCelular(bool? value) => setField<bool>('cadastroCelular', value);

  String? get manualColaborador => getField<String>('manual_colaborador');
  set manualColaborador(String? value) =>
      setField<String>('manual_colaborador', value);

  String? get portaBanco => getField<String>('porta_banco');
  set portaBanco(String? value) => setField<String>('porta_banco', value);

  bool? get bancoHorasAutomaticoFaltas =>
      getField<bool>('banco_horas_automatico_faltas');
  set bancoHorasAutomaticoFaltas(bool? value) =>
      setField<bool>('banco_horas_automatico_faltas', value);
}
