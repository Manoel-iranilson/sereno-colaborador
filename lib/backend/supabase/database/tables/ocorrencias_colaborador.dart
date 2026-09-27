import '../database.dart';

class OcorrenciasColaboradorTable
    extends SupabaseTable<OcorrenciasColaboradorRow> {
  @override
  String get tableName => 'ocorrencias_colaborador';

  @override
  OcorrenciasColaboradorRow createRow(Map<String, dynamic> data) =>
      OcorrenciasColaboradorRow(data);
}

class OcorrenciasColaboradorRow extends SupabaseDataRow {
  OcorrenciasColaboradorRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OcorrenciasColaboradorTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idOcorrencia => getField<int>('id_ocorrencia');
  set idOcorrencia(int? value) => setField<int>('id_ocorrencia', value);

  bool? get anulada => getField<bool>('anulada');
  set anulada(bool? value) => setField<bool>('anulada', value);

  String? get idColaborador => getField<String>('id_colaborador');
  set idColaborador(String? value) => setField<String>('id_colaborador', value);
}
