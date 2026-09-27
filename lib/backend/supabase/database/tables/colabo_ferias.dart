import '../database.dart';

class ColaboFeriasTable extends SupabaseTable<ColaboFeriasRow> {
  @override
  String get tableName => 'colabo_ferias';

  @override
  ColaboFeriasRow createRow(Map<String, dynamic> data) => ColaboFeriasRow(data);
}

class ColaboFeriasRow extends SupabaseDataRow {
  ColaboFeriasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ColaboFeriasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get dia => getField<DateTime>('dia');
  set dia(DateTime? value) => setField<DateTime>('dia', value);

  String? get idColaborador => getField<String>('id_colaborador');
  set idColaborador(String? value) => setField<String>('id_colaborador', value);
}
