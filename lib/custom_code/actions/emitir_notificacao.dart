// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/elegant_notification.dart';

Future emitirNotificacao(
    BuildContext context,
    String? titulo,
    String? mensagem,
    Future Function()? click,
    Color? cor,
    double? largura,
    double? altura) async {
  if (mensagem == null || mensagem.isEmpty) {
    mensagem = 'Sem conteúdo';
  }

  if (titulo == null || titulo.isEmpty) {
    titulo = 'Notificação';
  }

  ElegantNotification(
          title: Text(titulo, style: TextStyle(fontWeight: FontWeight.bold)),
          description: Text(mensagem),
          onNotificationPressed: click,
          icon: Icon(
            Icons.check_circle,
            color: cor ?? Colors.green,
          ),
          progressIndicatorColor: cor ?? Colors.green,
          animation: AnimationType.fromRight,
          position: Alignment.topRight,
          width: largura ?? 600,
          height: altura ?? 70)
      .show(context);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
