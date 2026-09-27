import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'upload_atestado_widget.dart' show UploadAtestadoWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadAtestadoModel extends FlutterFlowModel<UploadAtestadoWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? atestado;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadData22a = false;
  FFUploadedFile uploadedLocalFile_uploadData22a =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadDataTls = false;
  FFUploadedFile uploadedLocalFile_uploadDataTls =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataTls = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
