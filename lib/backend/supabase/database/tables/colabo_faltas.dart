import '../database.dart';

class ColaboFaltasTable extends SupabaseTable<ColaboFaltasRow> {
  @override
  String get tableName => 'colabo_faltas';

  @override
  ColaboFaltasRow createRow(Map<String, dynamic> data) => ColaboFaltasRow(data);
}

class ColaboFaltasRow extends SupabaseDataRow {
  ColaboFaltasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ColaboFaltasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get dataFalta => getField<DateTime>('data_falta')!;
  set dataFalta(DateTime value) => setField<DateTime>('data_falta', value);

  String? get nomeColaborador => getField<String>('nome_colaborador');
  set nomeColaborador(String? value) =>
      setField<String>('nome_colaborador', value);

  bool? get atestado => getField<bool>('atestado');
  set atestado(bool? value) => setField<bool>('atestado', value);

  String? get documentoAtestado => getField<String>('documento_atestado');
  set documentoAtestado(String? value) =>
      setField<String>('documento_atestado', value);

  bool get justificada => getField<bool>('justificada')!;
  set justificada(bool value) => setField<bool>('justificada', value);

  String? get obs => getField<String>('obs');
  set obs(String? value) => setField<String>('obs', value);

  String? get idEmpresa => getField<String>('id_empresa');
  set idEmpresa(String? value) => setField<String>('id_empresa', value);

  PostgresTime? get horarioInicio => getField<PostgresTime>('horario_inicio');
  set horarioInicio(PostgresTime? value) =>
      setField<PostgresTime>('horario_inicio', value);

  PostgresTime? get horariofim => getField<PostgresTime>('horariofim');
  set horariofim(PostgresTime? value) =>
      setField<PostgresTime>('horariofim', value);

  double? get minutosEquivalente => getField<double>('minutos_equivalente');
  set minutosEquivalente(double? value) =>
      setField<double>('minutos_equivalente', value);

  String? get idColaborador => getField<String>('id_colaborador');
  set idColaborador(String? value) => setField<String>('id_colaborador', value);

  bool? get diaTodo => getField<bool>('dia_todo');
  set diaTodo(bool? value) => setField<bool>('dia_todo', value);
}
