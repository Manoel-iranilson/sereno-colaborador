import '../database.dart';

class AtestadosTable extends SupabaseTable<AtestadosRow> {
  @override
  String get tableName => 'atestados';

  @override
  AtestadosRow createRow(Map<String, dynamic> data) => AtestadosRow(data);
}

class AtestadosRow extends SupabaseDataRow {
  AtestadosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AtestadosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get idColaborador => getField<String>('id_colaborador');
  set idColaborador(String? value) => setField<String>('id_colaborador', value);

  String? get photoAtestado => getField<String>('photo_atestado');
  set photoAtestado(String? value) => setField<String>('photo_atestado', value);

  String? get idEmpresa => getField<String>('id_empresa');
  set idEmpresa(String? value) => setField<String>('id_empresa', value);

  String? get nomeColaborador => getField<String>('nome_colaborador');
  set nomeColaborador(String? value) =>
      setField<String>('nome_colaborador', value);

  bool? get pendente => getField<bool>('pendente');
  set pendente(bool? value) => setField<bool>('pendente', value);
}
