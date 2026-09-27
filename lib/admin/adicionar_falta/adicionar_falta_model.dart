import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'adicionar_falta_widget.dart' show AdicionarFaltaWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdicionarFaltaModel extends FlutterFlowModel<AdicionarFaltaWidget> {
  ///  Local state fields for this page.

  int cont = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SwitchListTileperido widget.
  bool? switchListTileperidoValue;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for SwitchDia widget.
  bool? switchDiaValue;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for SwitchJustificada widget.
  bool? switchJustificadaValue;
  // State field(s) for SwitchAtestado widget.
  bool? switchAtestadoValue;
  bool isDataUploading_uploadDataRtg = false;
  FFUploadedFile uploadedLocalFile_uploadDataRtg =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExpedientesRow>? expedientes;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EmpresaRow>? empresa;
  bool isDataUploading_uploadData85v = false;
  FFUploadedFile uploadedLocalFile_uploadData85v =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData85v = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
