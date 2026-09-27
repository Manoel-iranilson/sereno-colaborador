import '../database.dart';

class ColaboradoresTable extends SupabaseTable<ColaboradoresRow> {
  @override
  String get tableName => 'colaboradores';

  @override
  ColaboradoresRow createRow(Map<String, dynamic> data) =>
      ColaboradoresRow(data);
}

class ColaboradoresRow extends SupabaseDataRow {
  ColaboradoresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ColaboradoresTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get numeroContato => getField<String>('numero_contato');
  set numeroContato(String? value) => setField<String>('numero_contato', value);

  String? get endereco => getField<String>('endereco');
  set endereco(String? value) => setField<String>('endereco', value);

  String? get cargo => getField<String>('cargo');
  set cargo(String? value) => setField<String>('cargo', value);

  String? get departamento => getField<String>('departamento');
  set departamento(String? value) => setField<String>('departamento', value);

  String? get rg => getField<String>('rg');
  set rg(String? value) => setField<String>('rg', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  String? get contratoTrabalho => getField<String>('contrato_trabalho');
  set contratoTrabalho(String? value) =>
      setField<String>('contrato_trabalho', value);

  String? get carteiraTrabalho => getField<String>('carteira_trabalho');
  set carteiraTrabalho(String? value) =>
      setField<String>('carteira_trabalho', value);

  bool? get experiencia => getField<bool>('experiencia');
  set experiencia(bool? value) => setField<bool>('experiencia', value);

  int? get ausencias => getField<int>('ausencias');
  set ausencias(int? value) => setField<int>('ausencias', value);

  DateTime? get dataAdmisao => getField<DateTime>('data_admisao');
  set dataAdmisao(DateTime? value) => setField<DateTime>('data_admisao', value);

  double? get pis => getField<double>('pis');
  set pis(double? value) => setField<double>('pis', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get urlFoto => getField<String>('url_foto');
  set urlFoto(String? value) => setField<String>('url_foto', value);

  double? get bancoHoras => getField<double>('banco_horas');
  set bancoHoras(double? value) => setField<double>('banco_horas', value);

  bool? get ativado => getField<bool>('ativado');
  set ativado(bool? value) => setField<bool>('ativado', value);

  String? get empresa => getField<String>('empresa');
  set empresa(String? value) => setField<String>('empresa', value);

  String? get numeroCarteiraTrabalho =>
      getField<String>('numero_carteira_trabalho');
  set numeroCarteiraTrabalho(String? value) =>
      setField<String>('numero_carteira_trabalho', value);

  double? get pontos => getField<double>('pontos');
  set pontos(double? value) => setField<double>('pontos', value);

  List<String> get reconhecimento => getListField<String>('reconhecimento');
  set reconhecimento(List<String>? value) =>
      setListField<String>('reconhecimento', value);

  DateTime? get dataDesligamento => getField<DateTime>('data_desligamento');
  set dataDesligamento(DateTime? value) =>
      setField<DateTime>('data_desligamento', value);

  String? get escolaridade => getField<String>('escolaridade');
  set escolaridade(String? value) => setField<String>('escolaridade', value);

  DateTime? get dataNascimento => getField<DateTime>('data_nascimento');
  set dataNascimento(DateTime? value) =>
      setField<DateTime>('data_nascimento', value);

  bool? get aprovadoSistema => getField<bool>('aprovado_sistema');
  set aprovadoSistema(bool? value) => setField<bool>('aprovado_sistema', value);

  bool? get reconhecimentoSinc => getField<bool>('reconhecimento_sinc');
  set reconhecimentoSinc(bool? value) =>
      setField<bool>('reconhecimento_sinc', value);

  int? get idCargo => getField<int>('id_cargo');
  set idCargo(int? value) => setField<int>('id_cargo', value);

  int? get idExpediente => getField<int>('id_expediente');
  set idExpediente(int? value) => setField<int>('id_expediente', value);

  bool? get ferias => getField<bool>('ferias');
  set ferias(bool? value) => setField<bool>('ferias', value);
}
