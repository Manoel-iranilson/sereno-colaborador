// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;

Future gerarPDF(String nome, String data, String horario) async {
  final pdf = pw.Document();
  final image = await networkImage(
      "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/desenvolvimento-j-ob-rhlbne/assets/epbqisspb6t9/logo.png");

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'COMPROVANTE DE REGISTRO DE PONTO DO TRABALHADOR',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
              textAlign: pw.TextAlign.center,
            ),
            pw.SizedBox(height: 10),
            pw.Text('JOB ROUPAS PROFISSIONAIS'),
            pw.Text('CNPJ: 04070230000188  NSR: 000064116'),
            pw.Text('CEI: 000000000000'),
            pw.Text('RUA DA CONCEIÇÃO, 399'),
            pw.Text('CENTRO'),
            pw.Text('JUAZEIRO DO NORTE'),
            pw.SizedBox(height: 10),
            pw.Text('$nome'),
            pw.Text('$data $horario'),
            pw.SizedBox(height: 10),
            pw.Text('A1BDA765EE9D86C21A0230700A226C642AD'),
            pw.Text('069681A22BC72A852FFE225DAFAADA1551D'),
            pw.Text('78F16A78530134726A5EAF7EB38B064A2DC'),
            pw.Text('C3D9E4D204FAC3C5A3D697'),
          ],
        );
      },
    ),
  );
  await Printing.sharePdf(
      bytes: await pdf.save(), filename: 'Comprovante_Ponto.pdf');
  final pdfSaved = await pdf.save();
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfSaved);
}
