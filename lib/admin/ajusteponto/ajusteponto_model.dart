import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/foto_componente/foto_componente_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'ajusteponto_widget.dart' show AjustepontoWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class AjustepontoModel extends FlutterFlowModel<AjustepontoWidget> {
  ///  Local state fields for this page.

  List<ColaboRegistroPontoRow> registrosFiltrados = [];
  void addToRegistrosFiltrados(ColaboRegistroPontoRow item) =>
      registrosFiltrados.add(item);
  void removeFromRegistrosFiltrados(ColaboRegistroPontoRow item) =>
      registrosFiltrados.remove(item);
  void removeAtIndexFromRegistrosFiltrados(int index) =>
      registrosFiltrados.removeAt(index);
  void insertAtIndexInRegistrosFiltrados(
          int index, ColaboRegistroPontoRow item) =>
      registrosFiltrados.insert(index, item);
  void updateRegistrosFiltradosAtIndex(
          int index, Function(ColaboRegistroPontoRow) updateFn) =>
      registrosFiltrados[index] = updateFn(registrosFiltrados[index]);

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

  List<ColaboradoresRow> todosColaboradores = [];
  void addToTodosColaboradores(ColaboradoresRow item) =>
      todosColaboradores.add(item);
  void removeFromTodosColaboradores(ColaboradoresRow item) =>
      todosColaboradores.remove(item);
  void removeAtIndexFromTodosColaboradores(int index) =>
      todosColaboradores.removeAt(index);
  void insertAtIndexInTodosColaboradores(int index, ColaboradoresRow item) =>
      todosColaboradores.insert(index, item);
  void updateTodosColaboradoresAtIndex(
          int index, Function(ColaboradoresRow) updateFn) =>
      todosColaboradores[index] = updateFn(todosColaboradores[index]);

  List<ColaboradoresRow> colaboradoresFiltrados = [];
  void addToColaboradoresFiltrados(ColaboradoresRow item) =>
      colaboradoresFiltrados.add(item);
  void removeFromColaboradoresFiltrados(ColaboradoresRow item) =>
      colaboradoresFiltrados.remove(item);
  void removeAtIndexFromColaboradoresFiltrados(int index) =>
      colaboradoresFiltrados.removeAt(index);
  void insertAtIndexInColaboradoresFiltrados(
          int index, ColaboradoresRow item) =>
      colaboradoresFiltrados.insert(index, item);
  void updateColaboradoresFiltradosAtIndex(
          int index, Function(ColaboradoresRow) updateFn) =>
      colaboradoresFiltrados[index] = updateFn(colaboradoresFiltrados[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ajusteponto widget.
  List<ColaboRegistroPontoRow>? colaboradoresregistros;
  // Stores action output result for [Backend Call - Query Rows] action in ajusteponto widget.
  List<ColaboradoresRow>? colabo;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ColaboRegistroPontoRow>? colaboradoresregistrosupdate;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
