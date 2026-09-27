import '../database.dart';

class VersoesTable extends SupabaseTable<VersoesRow> {
  @override
  String get tableName => 'versoes';

  @override
  VersoesRow createRow(Map<String, dynamic> data) => VersoesRow(data);
}

class VersoesRow extends SupabaseDataRow {
  VersoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VersoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get versao => getField<String>('versao');
  set versao(String? value) => setField<String>('versao', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);
}
