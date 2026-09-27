import '../database.dart';

class CargosTable extends SupabaseTable<CargosRow> {
  @override
  String get tableName => 'cargos';

  @override
  CargosRow createRow(Map<String, dynamic> data) => CargosRow(data);
}

class CargosRow extends SupabaseDataRow {
  CargosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CargosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get idEmpresa => getField<String>('id_empresa');
  set idEmpresa(String? value) => setField<String>('id_empresa', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  int? get idDepartamento => getField<int>('id_departamento');
  set idDepartamento(int? value) => setField<int>('id_departamento', value);
}
