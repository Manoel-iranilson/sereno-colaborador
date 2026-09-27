import '../database.dart';

class ExpedientesTable extends SupabaseTable<ExpedientesRow> {
  @override
  String get tableName => 'expedientes';

  @override
  ExpedientesRow createRow(Map<String, dynamic> data) => ExpedientesRow(data);
}

class ExpedientesRow extends SupabaseDataRow {
  ExpedientesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ExpedientesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get idEmpresa => getField<String>('id_empresa');
  set idEmpresa(String? value) => setField<String>('id_empresa', value);

  PostgresTime? get horarioInicio => getField<PostgresTime>('horario_inicio');
  set horarioInicio(PostgresTime? value) =>
      setField<PostgresTime>('horario_inicio', value);

  PostgresTime? get horarioFim => getField<PostgresTime>('horario_fim');
  set horarioFim(PostgresTime? value) =>
      setField<PostgresTime>('horario_fim', value);

  PostgresTime? get inicioIntervalo =>
      getField<PostgresTime>('inicio_intervalo');
  set inicioIntervalo(PostgresTime? value) =>
      setField<PostgresTime>('inicio_intervalo', value);

  PostgresTime? get fimIntervalo => getField<PostgresTime>('fim_intervalo');
  set fimIntervalo(PostgresTime? value) =>
      setField<PostgresTime>('fim_intervalo', value);

  double? get tempoExpediente => getField<double>('tempo_expediente');
  set tempoExpediente(double? value) =>
      setField<double>('tempo_expediente', value);

  List<dynamic> get diasUteis => getListField<dynamic>('dias_uteis');
  set diasUteis(List<dynamic>? value) =>
      setListField<dynamic>('dias_uteis', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);
}
