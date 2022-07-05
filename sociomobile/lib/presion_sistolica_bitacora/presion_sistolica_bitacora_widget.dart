import 'package:qido_colaboradores/model/usuario.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../presion_diastolica_bitacora/presion_diastolica_bitacora_widget.dart';
import '../registro_bitacora_v2/registro_bitacora_v2_widget.dart';
import '../temperatura_bitacora/temperatura_bitacora_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../bitacoravariables.dart';

class PresionSistolicaBitacoraWidget extends StatefulWidget {
  const PresionSistolicaBitacoraWidget({Key key, this.idPaciente, this.nombrePaciente, this.idTemp, this.listTemp, this.usuario}) : super(key: key);

    final String idPaciente, nombrePaciente;
    final int idTemp;
    final List listTemp;
    final Usuario usuario;
  @override
  _PresionSistolicaBitacoraWidgetState createState() =>
      _PresionSistolicaBitacoraWidgetState();
}

class _PresionSistolicaBitacoraWidgetState
    extends State<PresionSistolicaBitacoraWidget> {
  double sliderValue;
  String radioButtonValue;
  bool sistolicaAlta = false;
  bool sistolicaBaja = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

          @override
  void initState() {
    super.initState();
    if(flagResetSistolica == true) {
      presionSistolica = 120;
      flagResetSistolica = false;
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
          'Mediciones',
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
                    child: RegistroBitacoraV2Widget(idPaciente: widget.idPaciente, nombrePaciente: widget.nombrePaciente, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario),
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
                          child: Text(
                            'Métrica 2/5',
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 0),
                        child: LinearPercentIndicator(
                          percent: 0.4,
                          width: MediaQuery.of(context).size.width * 0.94,
                          lineHeight: 12,
                          animation: true,
                          progressColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          backgroundColor:
                              FlutterFlowTheme.of(context).lineColor,
                          barRadius: Radius.circular(24),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 90, 0, 0),
                        child: Text(
                          'Presión sistólica: $presionSistolica',
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          'https://img.icons8.com/color/344/medical-heart.png',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 25, 0, 0),
                                            child: Image.asset(
                                              'assets/images/icons8-activity.gif',
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: FFButtonWidget(
                                onPressed: () {

                                  //decrecerTemperatura();
                                  setState(() {
                                    presionSistolica = presionSistolica - 1;
                                    presionSistolicaBitacora = presionSistolica;
                                    if (presionSistolica >= 120.0) {
                                      sistolicaAlta = true;
                                      sistolicaBaja = false;
                                    }
                                    if (presionSistolica <= 90) {
                                      sistolicaAlta = false;
                                      sistolicaBaja = true;
                                    }
                                    if (presionSistolica < 120.0 && presionSistolica > 90) {
                                      sistolicaAlta = false;
                                      sistolicaBaja = false;
                                    }
                                  });
                                },
                                text: '-',
                                options: FFButtonOptions(
                                  width: 80,
                                  height: 80,
                                  color:
                                  FlutterFlowTheme.of(context).background,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 60,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 45,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  //print('Button pressed ...');
                                  // aumentarTemperatura();
                                  setState(() {
                                    presionSistolica = presionSistolica + 1;
                                    presionSistolicaBitacora = presionSistolica;
                                    if (presionSistolica >= 120.0) {
                                      sistolicaAlta = true;
                                      sistolicaBaja = false;
                                    }
                                    if (presionSistolica <= 90) {
                                      sistolicaAlta = false;
                                      sistolicaBaja = true;
                                    }
                                    if (presionSistolica < 120.0 && presionSistolica > 90) {
                                      sistolicaAlta = false;
                                      sistolicaBaja = false;
                                    }
                                  });

                                },
                                text: '+',
                                options: FFButtonOptions(
                                  width: 80,
                                  height: 80,
                                  color: FlutterFlowTheme.of(context).background,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 60,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (sistolicaAlta == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: 100,
            height: 24,
            decoration: BoxDecoration(
              color: Color(0xFFFF0000),
            ),
            child: Text(
              'Presión Sistólica Alta',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ],
    ),
                      ),
                      if (sistolicaBaja == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: 100,
            height: 24,
            decoration: BoxDecoration(
              color: Color(0xFFFF0000),
            ),
            child: Text(
              'Presión Sistólica Baja',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ],
    ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlutterFlowRadioButton(
                              options: ['No aplica'].toList(),
                              onChanged: (value) {
                                setState(() => radioButtonValue = value);
                              },
                              optionHeight: 25,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.black,
                              ),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.vertical,
                              radioButtonColor: Colors.blue,
                              inactiveRadioButtonColor: Color(0x8A000000),
                              toggleable: true,
                              horizontalAlignment: WrapAlignment.start,
                              verticalAlignment: WrapCrossAlignment.start,
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
                            child: TemperaturaBitacoraWidget(idPaciente1: widget.idPaciente, nombrePaciente1: widget.nombrePaciente, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario),
                          ),
                        );
                      },
                      text: 'Atrás',
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
                            child: PresionDiastolicaBitacoraWidget(idPaciente: widget.idPaciente, nombrePaciente: widget.nombrePaciente, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario),
                          ),
                        );
                      },
                      text: 'Siguiente',
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
int presionSistolica = 120;
cambiarPresionSistolica(sis){
  presionSistolica = sis;
  presionSistolicaBitacora = presionSistolica.toInt();
}