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
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ponto_model.dart';
export 'ponto_model.dart';

class PontoWidget extends StatefulWidget {
  const PontoWidget({
    super.key,
    required this.colaborador,
    required this.pontosAtuais,
  });

  final ColaboradoresRow? colaborador;
  final double? pontosAtuais;

  static String routeName = 'ponto';
  static String routePath = '/ponto';

  @override
  State<PontoWidget> createState() => _PontoWidgetState();
}

class _PontoWidgetState extends State<PontoWidget>
    with TickerProviderStateMixin {
  late PontoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PontoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      live_cam_8t99qi_app_state.FFAppState().makePhoto = true;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<live_cam_8t99qi_app_state.FFAppState>();

    return FutureBuilder<List<EmpresaRow>>(
      future: EmpresaTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget!.colaborador?.empresa,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<EmpresaRow> pontoEmpresaRowList = snapshot.data!;

        final pontoEmpresaRow =
            pontoEmpresaRowList.isNotEmpty ? pontoEmpresaRowList.first : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'ponto',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.readexPro(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Builder(
                builder: (context) {
                  if (widget!.colaborador?.reconhecimentoSinc ?? false) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 612.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) => Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: live_cam_8t99qi_custom_widgets
                                      .CameraPhoto(
                                    width: double.infinity,
                                    height: double.infinity,
                                    defaultCameraPosition: 'front',
                                    tirarfoto: () async {
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  LatLng(0.0, 0.0));
                                      _model.apiResult817 =
                                          await ReconhecimentoCall.call(
                                        file: live_cam_8t99qi_functions
                                            .convertBase64ToFFUploadedFile(
                                                live_cam_8t99qi_app_state
                                                        .FFAppState()
                                                    .fileBase64,
                                                'imagem'),
                                        porta: pontoEmpresaRow?.portaBanco,
                                      );

                                      if ((_model.apiResult817?.succeeded ??
                                          true)) {
                                        if (currentUserUid ==
                                            getJsonField(
                                              (_model.apiResult817?.jsonBody ??
                                                  ''),
                                              r'''$.matches[0].id''',
                                            ).toString()) {
                                          {
                                            safeSetState(() => _model
                                                    .isDataUploading_uploadDataXie =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedFiles =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles =
                                                  live_cam_8t99qi_functions
                                                          .convertBase64ToFFUploadedFile(
                                                              live_cam_8t99qi_app_state
                                                                      .FFAppState()
                                                                  .fileBase64,
                                                              'imagem')!
                                                          .bytes!
                                                          .isNotEmpty
                                                      ? [
                                                          live_cam_8t99qi_functions
                                                              .convertBase64ToFFUploadedFile(
                                                                  live_cam_8t99qi_app_state
                                                                          .FFAppState()
                                                                      .fileBase64,
                                                                  'imagem')!
                                                        ]
                                                      : <FFUploadedFile>[];
                                              selectedFiles =
                                                  selectedFilesFromUploadedFiles(
                                                selectedUploadedFiles,
                                                storageFolderPath: 'registros',
                                              );
                                              downloadUrls =
                                                  await uploadSupabaseStorageFiles(
                                                bucketName: 'rh',
                                                selectedFiles: selectedFiles,
                                              );
                                            } finally {
                                              _model.isDataUploading_uploadDataXie =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedFiles.length &&
                                                downloadUrls.length ==
                                                    selectedFiles.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_uploadDataXie =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl_uploadDataXie =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          _model.registrosAnteriores =
                                              await ColaboRegistroPontoTable()
                                                  .queryRows(
                                            queryFn: (q) => q
                                                .eqOrNull(
                                                  'id_colaborador',
                                                  currentUserUid,
                                                )
                                                .gtOrNull(
                                                  'created_at',
                                                  supaSerialize<DateTime>(
                                                      functions.inicioDoDia(
                                                          getCurrentTimestamp,
                                                          'inicio')),
                                                ),
                                          );
                                          _model.exp = await ExpedientesTable()
                                              .queryRows(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              widget!.colaborador?.idExpediente,
                                            ),
                                          );
                                          _model.registro =
                                              await ColaboRegistroPontoTable()
                                                  .insert({
                                            'data_ponto':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                            'externo': true,
                                            'tipo_ponto':
                                                functions.verificarHorario(
                                                    getCurrentTimestamp,
                                                    _model.exp?.firstOrNull
                                                        ?.horarioInicio?.time,
                                                    _model.exp?.firstOrNull
                                                        ?.horarioFim?.time,
                                                    _model.exp?.firstOrNull
                                                        ?.inicioIntervalo?.time,
                                                    _model.exp?.firstOrNull
                                                        ?.fimIntervalo?.time,
                                                    _model.registrosAnteriores!
                                                        .map((e) => e.tipoPonto)
                                                        .withoutNulls
                                                        .toList()),
                                            'id_empresa':
                                                widget!.colaborador?.empresa,
                                            'id_colaborador': currentUserUid,
                                            'localizacao':
                                                currentUserLocationValue
                                                    ?.toString(),
                                            'nome_colaborador': getJsonField(
                                              (_model.apiResult817?.jsonBody ??
                                                  ''),
                                              r'''$.matches[0].nome''',
                                            ).toString(),
                                            'url_foto': _model
                                                .uploadedFileUrl_uploadDataXie,
                                          });
                                        } else {
                                          context.pushNamed(
                                              HomePageWidget.routeName);

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Pessoa não autorizada',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        }

                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: PontoRealizadoWidget(
                                                  data: dateTimeFormat(
                                                    "d/M/y",
                                                    getCurrentTimestamp,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  hora: dateTimeFormat(
                                                    "Hm",
                                                    getCurrentTimestamp,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  tipo: 'Entrada',
                                                  nome: getJsonField(
                                                    (_model.apiResult817
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.matches[0].nome''',
                                                  ).toString(),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Error',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.safePop();
                                  },
                                  text: 'Voltar',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height: 73.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.report,
                            color: FlutterFlowTheme.of(context).error,
                            size: 100.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation']!),
                          Text(
                            'Seu rosto não está sincronizado!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          if (widget!.colaborador?.reconhecimento != null &&
                              (widget!.colaborador?.reconhecimento)!.isNotEmpty)
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  CadastrarReconhecimentoWidget.routeName,
                                  queryParameters: {
                                    'idColaborador': serializeParam(
                                      widget!.colaborador?.id,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Cadastrar rosto',
                              options: FFButtonOptions(
                                height: 63.05,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
