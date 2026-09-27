import '../database.dart';

class NotificaAusenciasTable extends SupabaseTable<NotificaAusenciasRow> {
  @override
  String get tableName => 'notifica_ausencias';

  @override
  NotificaAusenciasRow createRow(Map<String, dynamic> data) =>
      NotificaAusenciasRow(data);
}

class NotificaAusenciasRow extends SupabaseDataRow {
  NotificaAusenciasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificaAusenciasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get idColaborador => getField<String>('id_colaborador');
  set idColaborador(String? value) => setField<String>('id_colaborador', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  String? get motivoAusencia => getField<String>('motivo_ausencia');
  set motivoAusencia(String? value) =>
      setField<String>('motivo_ausencia', value);
}
