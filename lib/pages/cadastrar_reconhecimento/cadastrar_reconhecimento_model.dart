import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'cadastrar_reconhecimento_widget.dart'
    show CadastrarReconhecimentoWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastrarReconhecimentoModel
    extends FlutterFlowModel<CadastrarReconhecimentoWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> imagens = [];
  void addToImagens(FFUploadedFile item) => imagens.add(item);
  void removeFromImagens(FFUploadedFile item) => imagens.remove(item);
  void removeAtIndexFromImagens(int index) => imagens.removeAt(index);
  void insertAtIndexInImagens(int index, FFUploadedFile item) =>
      imagens.insert(index, item);
  void updateImagensAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      imagens[index] = updateFn(imagens[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  bool isDataUploading_uploadDataXct = false;
  FFUploadedFile uploadedLocalFile_uploadDataXct =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData6y9 = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadData6y9 = [];
  List<String> uploadedFileUrls_uploadData6y9 = [];

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ColaboradoresRow>? colab;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
