import '../database.dart';

class ViewOcorrenciaTable extends SupabaseTable<ViewOcorrenciaRow> {
  @override
  String get tableName => 'view_ocorrencia';

  @override
  ViewOcorrenciaRow createRow(Map<String, dynamic> data) =>
      ViewOcorrenciaRow(data);
}

class ViewOcorrenciaRow extends SupabaseDataRow {
  ViewOcorrenciaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewOcorrenciaTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get anulada => getField<bool>('anulada');
  set anulada(bool? value) => setField<bool>('anulada', value);

  int? get idOcorrencia => getField<int>('id_ocorrencia');
  set idOcorrencia(int? value) => setField<int>('id_ocorrencia', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  double? get pontos => getField<double>('pontos');
  set pontos(double? value) => setField<double>('pontos', value);

  String? get desc => getField<String>('desc');
  set desc(String? value) => setField<String>('desc', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);

  String? get idColaborador => getField<String>('id_colaborador');
  set idColaborador(String? value) => setField<String>('id_colaborador', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get empresa => getField<String>('empresa');
  set empresa(String? value) => setField<String>('empresa', value);

  double? get pontosColaborador => getField<double>('pontos_colaborador');
  set pontosColaborador(double? value) =>
      setField<double>('pontos_colaborador', value);
}
