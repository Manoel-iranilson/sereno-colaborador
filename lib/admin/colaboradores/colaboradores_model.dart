import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/foto_componente/foto_componente_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'colaboradores_widget.dart' show ColaboradoresWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ColaboradoresModel extends FlutterFlowModel<ColaboradoresWidget> {
  ///  Local state fields for this page.

  List<ColaboradoresRow> colaboradoresFIltrados = [];
  void addToColaboradoresFIltrados(ColaboradoresRow item) =>
      colaboradoresFIltrados.add(item);
  void removeFromColaboradoresFIltrados(ColaboradoresRow item) =>
      colaboradoresFIltrados.remove(item);
  void removeAtIndexFromColaboradoresFIltrados(int index) =>
      colaboradoresFIltrados.removeAt(index);
  void insertAtIndexInColaboradoresFIltrados(
          int index, ColaboradoresRow item) =>
      colaboradoresFIltrados.insert(index, item);
  void updateColaboradoresFIltradosAtIndex(
          int index, Function(ColaboradoresRow) updateFn) =>
      colaboradoresFIltrados[index] = updateFn(colaboradoresFIltrados[index]);

  String filtro = 'Nome';

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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in colaboradores widget.
  List<ColaboradoresRow>? colaboradores;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
