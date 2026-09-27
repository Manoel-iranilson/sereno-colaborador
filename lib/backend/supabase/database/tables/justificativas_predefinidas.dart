import '../database.dart';

class JustificativasPredefinidasTable
    extends SupabaseTable<JustificativasPredefinidasRow> {
  @override
  String get tableName => 'justificativas_predefinidas';

  @override
  JustificativasPredefinidasRow createRow(Map<String, dynamic> data) =>
      JustificativasPredefinidasRow(data);
}

class JustificativasPredefinidasRow extends SupabaseDataRow {
  JustificativasPredefinidasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => JustificativasPredefinidasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get texto => getField<String>('texto');
  set texto(String? value) => setField<String>('texto', value);

  String? get idEmpresa => getField<String>('id_empresa');
  set idEmpresa(String? value) => setField<String>('id_empresa', value);
}
