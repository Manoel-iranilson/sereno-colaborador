import '/admin/modal/add_ponto/add_ponto_widget.dart';
import '/admin/modal/adicionar_dadoscolaborador/adicionar_dadoscolaborador_widget.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/faltas/faltas_widget.dart';
import '/components/foto_componente/foto_componente_widget.dart';
import '/components/ocorrencias/ocorrencias_widget.dart';
import '/components/opcoes_colaborador/opcoes_colaborador_widget.dart';
import '/components/pontos/pontos_widget.dart';
import '/components/pontos_negativos/pontos_negativos_widget.dart';
import '/components/registrodepontos/registrodepontos_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData = false;
  FFUploadedFile uploadedLocalFile_uploadData =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData = '';

  Completer<List<ColaboradoresRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in RegistrosHeatmapWidget widget.
  List<ColaboRegistroPontoRow>? queryRegistro;
  // Model for pontos component.
  late PontosModel pontosModel;
  // Model for pontosNegativos component.
  late PontosNegativosModel pontosNegativosModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for ocorrencias component.
  late OcorrenciasModel ocorrenciasModel;
  // Model for faltas component.
  late FaltasModel faltasModel;
  // Model for registrodepontos component.
  late RegistrodepontosModel registrodepontosModel;

  @override
  void initState(BuildContext context) {
    pontosModel = createModel(context, () => PontosModel());
    pontosNegativosModel = createModel(context, () => PontosNegativosModel());
    ocorrenciasModel = createModel(context, () => OcorrenciasModel());
    faltasModel = createModel(context, () => FaltasModel());
    registrodepontosModel = createModel(context, () => RegistrodepontosModel());
  }

  @override
  void dispose() {
    pontosModel.dispose();
    pontosNegativosModel.dispose();
    tabBarController?.dispose();
    ocorrenciasModel.dispose();
    faltasModel.dispose();
    registrodepontosModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
