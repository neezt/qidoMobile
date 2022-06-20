import '../alimentacion_bitacora/alimentacion_bitacora_widget.dart';
import '../comida_bitacora/comida_bitacora_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../registro_bitacora_v2/registro_bitacora_v2_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../bitacoravariables.dart';

class DesayunoBitacoraWidget extends StatefulWidget {
  const DesayunoBitacoraWidget({Key key, this.idPaciente1, this.nombrePaciente1, this.idTemp, this.listTemp}) : super(key: key);

  final int idTemp;
  final List listTemp;
  final String idPaciente1;
  final String nombrePaciente1;

  @override
  _DesayunoBitacoraWidgetState createState() => _DesayunoBitacoraWidgetState();
}

class _DesayunoBitacoraWidgetState extends State<DesayunoBitacoraWidget> {
  double sliderValue;
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
                    child: RegistroBitacoraV2Widget(idPaciente: widget.idPaciente1, nombrePaciente: widget.nombrePaciente1, idTemp: widget.idTemp, listTemp: widget.listTemp),
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
                      //       'Pregunta 1/3',
                      //       style: FlutterFlowTheme.of(context).bodyText2,
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 0),
                      //   child: LinearPercentIndicator(
                      //     percent: 0.3,
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
                          'Desayuno',
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
                      if(desayunoBitacora == 0)
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
                          onChanged: (newValue) {  setState(() => sliderValue = newValue);
                            cambiarTexto(sliderValue);
                          },
                        ),
                      ),
                      if(desayunoBitacora > 0)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                        child: Slider.adaptive(
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          inactiveColor: FlutterFlowTheme.of(context).lineColor,
                          min: 0,
                          max: 4,
                          value: sliderValue ??= desayunoBitacora.toDouble()-1,
                          divisions: 4,
                          onChanged: (newValue) {  setState(() => sliderValue = newValue);
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
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                  //   child: FFButtonWidget(
                  //     onPressed: () {
                  //       print('Button pressed ...');
                  //     },
                  //     text: 'Registrar Otra',
                  //     options: FFButtonOptions(
                  //       width: 150,
                  //       height: 50,
                  //       color: FlutterFlowTheme.of(context).grayIcon,
                  //       textStyle:
                  //           FlutterFlowTheme.of(context).subtitle2.override(
                  //                 fontFamily: 'Lexend Deca',
                  //                 color: Colors.white,
                  //               ),
                  //       elevation: 3,
                  //       borderSide: BorderSide(
                  //         color: Colors.transparent,
                  //         width: 1,
                  //       ),
                  //       borderRadius: 40,
                  //     ),
                  //   ),
                  // ),
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
                            child: AlimentacionBitacoraWidget(idPaciente1: widget.idPaciente1, nombrePaciente1: widget.nombrePaciente1, idTemp: widget.idTemp, listTemp: widget.listTemp),
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
                            child: RegistroBitacoraV2Widget(idPaciente: widget.idPaciente1, nombrePaciente: widget.nombrePaciente1, idTemp: widget.idTemp, listTemp: widget.listTemp),
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
    desayunoBitacora = 1;
  }
  if(sliderValue == 1){
    textoAlimento = "2: Poco";
    desayunoBitacora = 2;
  }
  if(sliderValue == 2){
    textoAlimento = "3: Normal";
    desayunoBitacora = 3;
  }
  if(sliderValue == 3){
    textoAlimento = "4: Más de lo normal";
    desayunoBitacora = 4;
  }
  if(sliderValue == 4){
    textoAlimento = "5: Mucho";
    desayunoBitacora = 5;
  }

}
