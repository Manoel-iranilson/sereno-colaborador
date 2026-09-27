import '../database.dart';

class OcorrenciasTable extends SupabaseTable<OcorrenciasRow> {
  @override
  String get tableName => 'ocorrencias';

  @override
  OcorrenciasRow createRow(Map<String, dynamic> data) => OcorrenciasRow(data);
}

class OcorrenciasRow extends SupabaseDataRow {
  OcorrenciasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OcorrenciasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  String? get desc => getField<String>('desc');
  set desc(String? value) => setField<String>('desc', value);

  double? get pontos => getField<double>('pontos');
  set pontos(double? value) => setField<double>('pontos', value);

  String? get idEmpresa => getField<String>('id_empresa');
  set idEmpresa(String? value) => setField<String>('id_empresa', value);
}
