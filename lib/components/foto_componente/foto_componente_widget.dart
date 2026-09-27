import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'foto_componente_model.dart';
export 'foto_componente_model.dart';

/// componete para visualizar a foto grande
class FotoComponenteWidget extends StatefulWidget {
  const FotoComponenteWidget({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  State<FotoComponenteWidget> createState() => _FotoComponenteWidgetState();
}

class _FotoComponenteWidgetState extends State<FotoComponenteWidget> {
  late FotoComponenteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FotoComponenteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        width: double.infinity,
        height: 340.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                widget!.url!,
                width: double.infinity,
                height: 340.0,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
