import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/ponto_realizado_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:live_cam_8t99qi/app_state.dart' as live_cam_8t99qi_app_state;
import 'package:live_cam_8t99qi/custom_code/widgets/index.dart'
    as live_cam_8t99qi_custom_widgets;
import 'package:live_cam_8t99qi/flutter_flow/custom_functions.dart'
    as live_cam_8t99qi_functions;
import 'ponto_widget.dart' show PontoWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PontoModel extends FlutterFlowModel<PontoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (reconhecimento)] action in CameraPhoto widget.
  ApiCallResponse? apiResult817;
  bool isDataUploading_uploadDataXie = false;
  FFUploadedFile uploadedLocalFile_uploadDataXie =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataXie = '';

  // Stores action output result for [Backend Call - Query Rows] action in CameraPhoto widget.
  List<ColaboRegistroPontoRow>? registrosAnteriores;
  // Stores action output result for [Backend Call - Query Rows] action in CameraPhoto widget.
  List<ExpedientesRow>? exp;
  // Stores action output result for [Backend Call - Insert Row] action in CameraPhoto widget.
  ColaboRegistroPontoRow? registro;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
