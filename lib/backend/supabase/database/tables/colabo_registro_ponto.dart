import '../database.dart';

class ColaboRegistroPontoTable extends SupabaseTable<ColaboRegistroPontoRow> {
  @override
  String get tableName => 'colabo_registro_ponto';

  @override
  ColaboRegistroPontoRow createRow(Map<String, dynamic> data) =>
      ColaboRegistroPontoRow(data);
}

class ColaboRegistroPontoRow extends SupabaseDataRow {
  ColaboRegistroPontoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ColaboRegistroPontoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get dataPonto => getField<DateTime>('data_ponto');
  set dataPonto(DateTime? value) => setField<DateTime>('data_ponto', value);

  String? get tipoPonto => getField<String>('tipo_ponto');
  set tipoPonto(String? value) => setField<String>('tipo_ponto', value);

  String? get nomeColaborador => getField<String>('nome_colaborador');
  set nomeColaborador(String? value) =>
      setField<String>('nome_colaborador', value);

  String? get idEmpresa => getField<String>('id_empresa');
  set idEmpresa(String? value) => setField<String>('id_empresa', value);

  String? get urlFoto => getField<String>('url_foto');
  set urlFoto(String? value) => setField<String>('url_foto', value);

  bool? get externo => getField<bool>('externo');
  set externo(bool? value) => setField<bool>('externo', value);

  String? get idColaborador => getField<String>('id_colaborador');
  set idColaborador(String? value) => setField<String>('id_colaborador', value);

  String? get localizacao => getField<String>('localizacao');
  set localizacao(String? value) => setField<String>('localizacao', value);

  bool? get ajustadoSistema => getField<bool>('ajustado_sistema');
  set ajustadoSistema(bool? value) => setField<bool>('ajustado_sistema', value);
}
