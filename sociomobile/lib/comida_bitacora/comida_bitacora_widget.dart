import '../alimentacion_bitacora/alimentacion_bitacora_widget.dart';
import '../cena_bitacora/cena_bitacora_widget.dart';
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

class ComidaBitacoraWidget extends StatefulWidget {
  const ComidaBitacoraWidget({Key key, this.idPaciente2, this.nombrePaciente2, this.idTemp, this.listTemp, this.usuario}) : super(key: key);

  final int idTemp;
  final List listTemp;
  final String idPaciente2,nombrePaciente2;
  final Usuario usuario;
  @override
  _ComidaBitacoraWidgetState createState() => _ComidaBitacoraWidgetState();
}

class _ComidaBitacoraWidgetState extends State<ComidaBitacoraWidget> {
  double sliderValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

      @override
  void initState() {
    super.initState();
    if(flagResetComida == true) {
      textoAlimento = "";
      flagResetComida = false;
    }
  }

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
                    child: RegistroBitacoraV2Widget(idPaciente: widget.idPaciente2, nombrePaciente: widget.nombrePaciente2, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario,),
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
                      // Align(
                      //   alignment: AlignmentDirectional(-1, 0),
                      //   child: Padding(
                      //     padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                      //     child: Text(
                      //       'Pregunta 2/3',
                      //       style: FlutterFlowTheme.of(context).bodyText2,
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 0),
                      //   child: LinearPercentIndicator(
                      //     percent: 0.66,
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
                        padding: EdgeInsetsDirectional.fromSTEB(16, 100, 0, 0),
                        child: Text(
                          'Comida',
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                        child: Text(
                          'En la escala del 1 - 5 ¿Qué tanto comió?',
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 44, 2, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              'https://img.icons8.com/color/344/plate.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://img.icons8.com/color/344/tea-pair.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://img.icons8.com/color/344/sunny-side-up-eggs.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Nada',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            Text(
                              'Normal',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            Text(
                              'Mucho',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ],
                        ),
                      ),
                      if(comidaBitacora == 0)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                        child: Slider.adaptive(
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          inactiveColor: FlutterFlowTheme.of(context).lineColor,
                          min: 0,
                          max: 4,
                          value: sliderValue ??= 2,
                          divisions: 4,
                          onChanged: (newValue) {setState(() => sliderValue = newValue);
                          cambiarTexto(sliderValue);
                          },
                        ),
                      ),
                      if(comidaBitacora > 0)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                        child: Slider.adaptive(
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          inactiveColor: FlutterFlowTheme.of(context).lineColor,
                          min: 0,
                          max: 4,
                          value: sliderValue ??= comidaBitacora.toDouble()-1,
                          divisions: 4,
                          onChanged: (newValue) {setState(() => sliderValue = newValue);
                          cambiarTexto(sliderValue);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              textoAlimento,
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: AlimentacionBitacoraWidget(idPaciente1: widget.idPaciente2, nombrePaciente1: widget.nombrePaciente2, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario,),
                          ),
                        );
                      },
                      text: 'Registrar Otra',
                      options: FFButtonOptions(
                        width: 150,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: RegistroBitacoraV2Widget(idPaciente: widget.idPaciente2, nombrePaciente: widget.nombrePaciente2, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario,),
                          ),
                        );
                      },
                      text: 'Listo',
                      options: FFButtonOptions(
                        width: 150,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
var textoAlimento = "";
cambiarTexto(sliderValue){
  if(sliderValue == 0){
    textoAlimento = "1: Nada";
    comidaBitacora = 1;
  }
  if(sliderValue == 1){
    textoAlimento = "2: Poco";
    comidaBitacora = 2;
  }
  if(sliderValue == 2){
    textoAlimento = "3: Normal";
    comidaBitacora = 3;
  }
  if(sliderValue == 3){
    textoAlimento = "4: Más de lo normal";
    comidaBitacora = 4;
  }
  if(sliderValue == 4){
    textoAlimento = "5: Mucho";
    comidaBitacora = 5;
  }
  print("yessir: $comidaBitacora");
}