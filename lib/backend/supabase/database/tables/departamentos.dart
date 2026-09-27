import '../database.dart';

class DepartamentosTable extends SupabaseTable<DepartamentosRow> {
  @override
  String get tableName => 'departamentos';

  @override
  DepartamentosRow createRow(Map<String, dynamic> data) =>
      DepartamentosRow(data);
}

class DepartamentosRow extends SupabaseDataRow {
  DepartamentosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DepartamentosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get idEmpresa => getField<String>('id_empresa');
  set idEmpresa(String? value) => setField<String>('id_empresa', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);
}
