import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';

FFUploadedFile? base64tofile(String base64Img) {
  final bytes = base64Decode(base64Img);
  final file = FFUploadedFile(bytes: bytes);
  return file;
}

FFUploadedFile? convertBase64ToFFUploadedFile(
  String base64String,
  String fileName,
) {
  try {
    // Decodifica Base64 para bytes
    final bytes = base64Decode(base64String);

    // Cria um FFUploadedFile com os bytes
    return FFUploadedFile(
      bytes: bytes,
      name: '$fileName.png', // Nome do arquivo
    );
  } catch (e) {
    print('Erro ao converter Base64 para FFUploadedFile: $e');
    return null; // Retorna nulo em caso de erro
  }
}
