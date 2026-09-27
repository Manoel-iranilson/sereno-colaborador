import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/foto_componente/foto_componente_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'pontosdia_widget.dart' show PontosdiaWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PontosdiaModel extends FlutterFlowModel<PontosdiaWidget> {
  ///  Local state fields for this page.

  List<ColaboRegistroPontoRow> registros = [];
  void addToRegistros(ColaboRegistroPontoRow item) => registros.add(item);
  void removeFromRegistros(ColaboRegistroPontoRow item) =>
      registros.remove(item);
  void removeAtIndexFromRegistros(int index) => registros.removeAt(index);
  void insertAtIndexInRegistros(int index, ColaboRegistroPontoRow item) =>
      registros.insert(index, item);
  void updateRegistrosAtIndex(
          int index, Function(ColaboRegistroPontoRow) updateFn) =>
      registros[index] = updateFn(registros[index]);

  List<String> listFaltas = [];
  void addToListFaltas(String item) => listFaltas.add(item);
  void removeFromListFaltas(String item) => listFaltas.remove(item);
  void removeAtIndexFromListFaltas(int index) => listFaltas.removeAt(index);
  void insertAtIndexInListFaltas(int index, String item) =>
      listFaltas.insert(index, item);
  void updateListFaltasAtIndex(int index, Function(String) updateFn) =>
      listFaltas[index] = updateFn(listFaltas[index]);

  DateTime? selectData;

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in pontosdia widget.
  List<ColaboRegistroPontoRow>? colaboradoresregistros;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ColaboRegistroPontoRow>? colaboradoresregistrosupdate;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
