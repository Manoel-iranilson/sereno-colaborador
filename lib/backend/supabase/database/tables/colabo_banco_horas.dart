import '../database.dart';

class ColaboBancoHorasTable extends SupabaseTable<ColaboBancoHorasRow> {
  @override
  String get tableName => 'colabo_banco_horas';

  @override
  ColaboBancoHorasRow createRow(Map<String, dynamic> data) =>
      ColaboBancoHorasRow(data);
}

class ColaboBancoHorasRow extends SupabaseDataRow {
  ColaboBancoHorasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ColaboBancoHorasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get dataField => getField<DateTime>('data')!;
  set dataField(DateTime value) => setField<DateTime>('data', value);

  String? get desc => getField<String>('desc');
  set desc(String? value) => setField<String>('desc', value);

  bool? get acrescimo => getField<bool>('acrescimo');
  set acrescimo(bool? value) => setField<bool>('acrescimo', value);

  double? get minutos => getField<double>('minutos');
  set minutos(double? value) => setField<double>('minutos', value);

  String? get nomeColaborador => getField<String>('nome_colaborador');
  set nomeColaborador(String? value) =>
      setField<String>('nome_colaborador', value);

  String? get empresa => getField<String>('empresa');
  set empresa(String? value) => setField<String>('empresa', value);

  String? get idColaborador => getField<String>('id_colaborador');
  set idColaborador(String? value) => setField<String>('id_colaborador', value);
}
