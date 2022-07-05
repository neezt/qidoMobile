import '../cena_bitacora/cena_bitacora_widget.dart';
import '../comida_bitacora/comida_bitacora_widget.dart';
import '../desayuno_bitacora/desayuno_bitacora_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../model/usuario.dart';
import '../registro_bitacora_v2/registro_bitacora_v2_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../bitacoravariables.dart';

class AlimentacionBitacoraWidget extends StatefulWidget {
  const AlimentacionBitacoraWidget({Key key, this.idPaciente1, this.nombrePaciente1, this.idTemp, this.listTemp, this.usuario}) : super(key: key);

  final int idTemp;
  final List listTemp;
  final String idPaciente1;
  final String nombrePaciente1;
  final Usuario usuario;
  @override
  _AlimentacionBitacoraWidgetState createState() =>
      _AlimentacionBitacoraWidgetState();
}

class _AlimentacionBitacoraWidgetState
    extends State<AlimentacionBitacoraWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Alimentación',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 50,
              fillColor: FlutterFlowTheme.of(context).primaryBackground,
              icon: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.topToBottom,
                    duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    child: RegistroBitacoraV2Widget(idPaciente: widget.idPaciente1, nombrePaciente: widget.nombrePaciente1, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario,),
                  ),
                );
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                          // child: Text(
                          //   'Pregunta 0/3',
                          //   style: FlutterFlowTheme.of(context).bodyText2,
                          // ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 0),
                      //   child: LinearPercentIndicator(
                      //     percent: 0.01,
                      //     width: MediaQuery.of(context).size.width * 0.94,
                      //     lineHeight: 12,
                      //     animation: true,
                      //     progressColor:
                      //         FlutterFlowTheme.of(context).primaryColor,
                      //     backgroundColor:
                      //         FlutterFlowTheme.of(context).lineColor,
                      //     barRadius: Radius.circular(24),
                      //     padding: EdgeInsets.zero,
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 160, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '¿Qué se va a capturar?',
                              style: FlutterFlowTheme.of(context).title2,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DesayunoBitacoraWidget(idPaciente1: widget.idPaciente1, nombrePaciente1: widget.nombrePaciente1, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario,),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, -0.21),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 25, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 35, 0, 0),
                                              child: Text(
                                                'Desayuno',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black600,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Image.network(
                                              'https://img.icons8.com/external-fauzidea-flat-fauzidea/344/external-breakfast-back-to-school-fauzidea-flat-fauzidea.png',
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ComidaBitacoraWidget(idPaciente2: widget.idPaciente1, nombrePaciente2: widget.nombrePaciente1, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, -0.21),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 25, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 35, 0, 0),
                                              child: Text(
                                                'Comida',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black600,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Image.network(
                                              'https://img.icons8.com/external-icongeek26-flat-icongeek26/344/external-salad-healthy-lifestyle-icongeek26-flat-icongeek26.png',
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CenaBitacoraWidget(idPaciente3: widget.idPaciente1, nombrePaciente3: widget.nombrePaciente1, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, -0.21),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 25, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 35, 0, 0),
                                              child: Text(
                                                'Cena',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black600,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Image.network(
                                              'https://img.icons8.com/color/344/food-bar.png',
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Row(
              //   mainAxisSize: MainAxisSize.max,
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Padding(
              //       padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
              //       child: FFButtonWidget(
              //         onPressed: () {
              //           print('Button pressed ...');
              //         },
              //         text: 'Atrás',
              //         options: FFButtonOptions(
              //           width: 150,
              //           height: 50,
              //           color: FlutterFlowTheme.of(context).grayIcon,
              //           textStyle:
              //               FlutterFlowTheme.of(context).subtitle2.override(
              //                     fontFamily: 'Lexend Deca',
              //                     color: Colors.white,
              //                   ),
              //           elevation: 3,
              //           borderSide: BorderSide(
              //             color: Colors.transparent,
              //             width: 1,
              //           ),
              //           borderRadius: 40,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
