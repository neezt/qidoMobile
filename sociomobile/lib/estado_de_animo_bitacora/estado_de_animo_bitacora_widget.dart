import '../bitacoravariables.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../registro_bitacora_v2/registro_bitacora_v2_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EstadoDeAnimoBitacoraWidget extends StatefulWidget {
  const EstadoDeAnimoBitacoraWidget({
    Key key,
    this.progreso, this.idPaciente1, this.nombrePaciente1, this.idTemp, this.listTemp,
  }) : super(key: key);

  final double progreso;

  final String idPaciente1, nombrePaciente1;
  final int idTemp;
  final List listTemp;

  @override
  _EstadoDeAnimoBitacoraWidgetState createState() =>
      _EstadoDeAnimoBitacoraWidgetState();
}

class _EstadoDeAnimoBitacoraWidgetState
    extends State<EstadoDeAnimoBitacoraWidget> {
  List<String> estadosDeAnimo;

  bool Feliz = false;
  bool Alegre = false;
  bool Amoroso = false;
  bool Triste = false;
  bool Decaido = false;
  bool Deprimido = false;
  bool Miedo = false;
  bool Enojado = false;
  bool Nostalgico = false;
  bool Aburrido = false;
  bool Tranquilo = false;
  bool Ansioso = false;
  bool Asco = false;
  bool Dolor = false;
  
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        title: Text(
          'Estado de ánimo',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Outfit',
                color: Color(0xFF0F1113),
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 50,
              fillColor: Color(0xFFF1F4F8),
              icon: Icon(
                Icons.close_rounded,
                color: Color(0xFF57636C),
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistroBitacoraV2Widget(idPaciente: widget.idPaciente1, nombrePaciente: widget.nombrePaciente1, idTemp: widget.idTemp, listTemp: widget.listTemp),
                  ),
                );
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                        child: Text(
                          'Seleccione el estado de ánimo que más describa al paciente este día.',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(feliz == true) {
                                    feliz = !feliz;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 1;
                                    feliz = !feliz;
                                    buenHumor = false;
                                    amoroso = false;
                                    triste = false;
                                    decaido = false;
                                    deprimido = false;
                                    asustado = false;
                                    enojado = false;
                                    nostalgico = false;
                                    aburrido = false;
                                    tranquilo = false;
                                    ansioso = false;
                                    asco = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: 
                              BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: feliz? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Feliz',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/lol--v1.png',
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
                        new GestureDetector(
                          onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(buenHumor == true) {
                                    buenHumor = !buenHumor;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 2;
                                    buenHumor = !buenHumor;
                                    feliz = false;
                                    amoroso = false;
                                    triste = false;
                                    decaido = false;
                                    deprimido = false;
                                    asustado = false;
                                    enojado = false;
                                    nostalgico = false;
                                    aburrido = false;
                                    tranquilo = false;
                                    ansioso = false;
                                    asco = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: buenHumor? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Buen Humor',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/smiling.png',
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
                        new GestureDetector(
                          onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(amoroso == true) {
                                    amoroso = !amoroso;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 3;
                                    amoroso = !amoroso;
                                    feliz = false;
                                    buenHumor = false;
                                    triste = false;
                                    decaido = false;
                                    deprimido = false;
                                    asustado = false;
                                    enojado = false;
                                    nostalgico = false;
                                    aburrido = false;
                                    tranquilo = false;
                                    ansioso = false;
                                    asco = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: amoroso? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Amoroso',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/kiss.png',
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(triste == true) {
                                    triste = !triste;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 4;
                                    triste = !triste;
                                    feliz = false;
                                    buenHumor = false;
                                    amoroso = false;
                                    decaido = false;
                                    deprimido = false;
                                    asustado = false;
                                    enojado = false;
                                    nostalgico = false;
                                    aburrido = false;
                                    tranquilo = false;
                                    ansioso = false;
                                    asco = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: triste? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Triste',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/boring--v1.png',
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
                        new GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(decaido == true) {
                                    decaido = !decaido;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 5;
                                    decaido = !decaido;
                                    feliz = false;
                                    buenHumor = false;
                                    amoroso = false;
                                    triste = false;
                                    deprimido = false;
                                    asustado = false;
                                    enojado = false;
                                    nostalgico = false;
                                    aburrido = false;
                                    tranquilo = false;
                                    ansioso = false;
                                    asco = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: decaido? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Decaído',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/sad--v1.png',
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
                        new GestureDetector(
                          onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(deprimido == true) {
                                    deprimido = !deprimido;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 6;
                                    deprimido = !deprimido;
                                    feliz = false;
                                    buenHumor = false;
                                    amoroso = false;
                                    triste = false;
                                    decaido = false;
                                    asustado = false;
                                    enojado = false;
                                    nostalgico = false;
                                    aburrido = false;
                                    tranquilo = false;
                                    ansioso = false;
                                    asco = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: deprimido? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Deprimido',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/crying--v1.png',
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(asustado == true) {
                                    asustado = !asustado;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 7;
                                    asustado = !asustado;
                                    feliz = false;
                                    buenHumor = false;
                                    amoroso = false;
                                    triste = false;
                                    decaido = false;
                                    deprimido = false;
                                    enojado = false;
                                    nostalgico = false;
                                    aburrido = false;
                                    tranquilo = false;
                                    ansioso = false;
                                    asco = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: asustado? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Asustado',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/surprised.png',
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
                        new GestureDetector(
                          onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(enojado == true) {
                                    enojado = !enojado;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 8;
                                    enojado = !enojado;
                                    feliz = false;
                                    buenHumor = false;
                                    amoroso = false;
                                    triste = false;
                                    decaido = false;
                                    deprimido = false;
                                    asustado = false;
                                    nostalgico = false;
                                    aburrido = false;
                                    tranquilo = false;
                                    ansioso = false;
                                    asco = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: enojado? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Enojado',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/angry.png',
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
                        new GestureDetector(
                          onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(nostalgico == true) {
                                    nostalgico = !nostalgico;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 9;
                                    nostalgico = !nostalgico;
                                    feliz = false;
                                    buenHumor = false;
                                    amoroso = false;
                                    triste = false;
                                    decaido = false;
                                    deprimido = false;
                                    asustado = false;
                                    enojado = false;
                                    aburrido = false;
                                    tranquilo = false;
                                    ansioso = false;
                                    asco = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: nostalgico? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Nostálgico',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/sad--v1.png',
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    children: [
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
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(30, 30, 0, 0),
                                                child: Image.network(
                                                  'https://img.icons8.com/color/344/old-fashioned-family-photo.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(aburrido == true) {
                                    aburrido = !aburrido;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 10;
                                    aburrido = !aburrido;
                                    feliz = false;
                                    buenHumor = false;
                                    amoroso = false;
                                    triste = false;
                                    decaido = false;
                                    deprimido = false;
                                    asustado = false;
                                    enojado = false;
                                    nostalgico = false;
                                    tranquilo = false;
                                    ansioso = false;
                                    asco = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: aburrido? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Aburrido',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/bored.png',
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
                        new GestureDetector(
                          onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(tranquilo == true) {
                                    tranquilo = !tranquilo;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 11;
                                    tranquilo = !tranquilo;
                                    feliz = false;
                                    buenHumor = false;
                                    amoroso = false;
                                    triste = false;
                                    decaido = false;
                                    deprimido = false;
                                    asustado = false;
                                    enojado = false;
                                    nostalgico = false;
                                    aburrido = false;
                                    ansioso = false;
                                    asco = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: tranquilo? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Tranquilo',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/sleeping--v1.png',
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
                        new GestureDetector(
                          onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(ansioso == true) {
                                    ansioso = !ansioso;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 12;
                                    ansioso = !ansioso;
                                    feliz = false;
                                    buenHumor = false;
                                    amoroso = false;
                                    triste = false;
                                    decaido = false;
                                    deprimido = false;
                                    asustado = false;
                                    enojado = false;
                                    nostalgico = false;
                                    aburrido = false;
                                    tranquilo = false;
                                    asco = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: ansioso? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Ansioso',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/question--v1.png',
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(asco == true) {
                                    asco = !asco;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 13;
                                    asco = !asco;
                                    feliz = false;
                                    buenHumor = false;
                                    amoroso = false;
                                    triste = false;
                                    decaido = false;
                                    deprimido = false;
                                    asustado = false;
                                    enojado = false;
                                    nostalgico = false;
                                    aburrido = false;
                                    tranquilo = false;
                                    ansioso = false;
                                    dolor = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: asco? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Con Asco',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/vomited--v1.png',
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
                        new GestureDetector(
                          onTap: () {
                                setState(() {
                                  // Toggle light when tapped.
                                  if(dolor == true) {
                                    dolor = !dolor;
                                    estadoAnimoBitacora = null;
                                  } else {
                                    estadoAnimoBitacora = 14;
                                    dolor = !dolor;
                                    feliz = false;
                                    buenHumor = false;
                                    amoroso = false;
                                    triste = false;
                                    decaido = false;
                                    deprimido = false;
                                    asustado = false;
                                    enojado = false;
                                    nostalgico = false;
                                    aburrido = false;
                                    tranquilo = false;
                                    ansioso = false;
                                    asco = false;
                                  }
                                   
                                });
                              },
                              child:
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: dolor? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.21),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 35, 0, 0),
                                            child: Text(
                                              'Con Dolor',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.network(
                                            'https://img.icons8.com/color/344/boring--v1.png',
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    children: [
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
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 20, 30),
                                                child: Image.network(
                                                  'https://img.icons8.com/color/344/bandage.png',
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
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
                                width: 300,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
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
            ],
          ),
        ),
      ),
    );
  }
}
bool feliz = false;
bool buenHumor = false;
bool amoroso = false;
bool triste = false;
bool decaido = false;
bool deprimido = false;
bool asustado = false;
bool enojado = false;
bool nostalgico = false;
bool aburrido = false;
bool tranquilo = false;
bool ansioso = false;
bool asco = false;
bool dolor = false;
