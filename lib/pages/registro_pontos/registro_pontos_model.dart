import '/admin/modal/add_ponto/add_ponto_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'registro_pontos_widget.dart' show RegistroPontosWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class RegistroPontosModel extends FlutterFlowModel<RegistroPontosWidget> {
  ///  Local state fields for this page.

  List<ColaboRegistroPontoRow> pontos = [];
  void addToPontos(ColaboRegistroPontoRow item) => pontos.add(item);
  void removeFromPontos(ColaboRegistroPontoRow item) => pontos.remove(item);
  void removeAtIndexFromPontos(int index) => pontos.removeAt(index);
  void insertAtIndexInPontos(int index, ColaboRegistroPontoRow item) =>
      pontos.insert(index, item);
  void updatePontosAtIndex(
          int index, Function(ColaboRegistroPontoRow) updateFn) =>
      pontos[index] = updateFn(pontos[index]);

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in registroPontos widget.
  List<ColaboradoresRow>? colaboUser;
  // Stores action output result for [Backend Call - Query Rows] action in registroPontos widget.
  List<ColaboRegistroPontoRow>? colaboData;
  // Stores action output result for [Backend Call - Query Rows] action in registroPontos widget.
  List<ColaboRegistroPontoRow>? colabo;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ColaboRegistroPontoRow>? diaFiltrado;
  // Stores action output result for [Backend Call - Query Rows] action in FloatingActionButton widget.
  List<ColaboRegistroPontoRow>? colaboRefresh;
  // Stores action output result for [Backend Call - Query Rows] action in FloatingActionButton widget.
  List<ColaboRegistroPontoRow>? colaboDataRefresh;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
