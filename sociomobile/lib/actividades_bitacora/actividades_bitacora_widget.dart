import 'package:qido_colaboradores/bitacoravariables.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../registro_bitacora_v2/registro_bitacora_v2_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActividadesBitacoraWidget extends StatefulWidget {
  const ActividadesBitacoraWidget({
    Key key,
    this.progreso, this.idPaciente1, this.idTemp, this.listTemp, this.nombrePaciente1,
  }) : super(key: key);

  final double progreso;

  final String idPaciente1,nombrePaciente1;
  final List listTemp;
  final int idTemp;

  @override
  _ActividadesBitacoraWidgetState createState() =>
      _ActividadesBitacoraWidgetState();
}

class _ActividadesBitacoraWidgetState extends State<ActividadesBitacoraWidget> {
  List<String> actvidades;


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        title: Text(
          'Cuidados/Actividades',
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
                    builder: (context) => RegistroBitacoraV2Widget(idPaciente: widget.idPaciente1, nombrePaciente: widget.nombrePaciente1, idTemp: widget.idTemp, listTemp: widget.listTemp),                  ),
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
                          'Seleccione las actividades y/o cuidados que fueron propiciados. Puede seleccionar más de uno.',
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
                                  dormir = !dormir;
                                  if(dormir == true){
                                    actividadesBitacora.add(0);
                                  } else {
                                    actividadesBitacora.remove(0);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  dormir ? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Se Durmió',
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
                                  caminar = !caminar;
                                  if(caminar == true){
                                    actividadesBitacora.add(1);
                                  } else {
                                    actividadesBitacora.remove(1);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  caminar ? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Caminó',
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
                                              'https://img.icons8.com/color/344/walking--v1.png',
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
                                  verTV = !verTV;
                                  if(verTV == true){
                                    actividadesBitacora.add(2);
                                  } else {
                                    actividadesBitacora.remove(2);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  verTV ? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),

                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, -0.21),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 32, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Vió TV',
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
                                              'https://img.icons8.com/color/344/tv.png',
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
                                  tomarElSol = !tomarElSol;
                                  if(tomarElSol == true){
                                    actividadesBitacora.add(3);
                                  } else {
                                    actividadesBitacora.remove(3);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  tomarElSol ? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, -0.21),
                                      child:
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 25, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Tomó el Sol',
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
                                              'https://img.icons8.com/color/344/sun.png',
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
                                  banoSolo = !banoSolo;
                                  if(banoSolo == true){
                                    actividadesBitacora.add(4);
                                  } else {
                                    actividadesBitacora.remove(4);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  banoSolo ? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Se bañó',
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
                                              'https://img.icons8.com/color/344/shower.png',
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
                                  banoAsistido = !banoAsistido;
                                  if(banoAsistido == true){
                                    actividadesBitacora.add(5);
                                  } else {
                                    actividadesBitacora.remove(5);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  banoAsistido ? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Baño asistido',
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
                                              'https://img.icons8.com/color/344/shower.png',
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
                                                    'https://img.icons8.com/color/344/plus-math.png',
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
                                  ejercicioSolo = !ejercicioSolo;
                                  if(ejercicioSolo == true){
                                    actividadesBitacora.add(6);
                                  } else {
                                    actividadesBitacora.remove(6);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  ejercicioSolo? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Se ejercitó',
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
                                              'https://img.icons8.com/color/344/stepper.png',
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
                                  juegosMentales = !juegosMentales;
                                  if(juegosMentales == true){
                                    actividadesBitacora.add(7);
                                  } else {
                                    actividadesBitacora.remove(7);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  juegosMentales? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Estimulación',
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
                                              'https://img.icons8.com/color/344/brainstorm-skill.png',
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
                                  cambioDePosicion = !cambioDePosicion;
                                  if(cambioDePosicion == true){
                                    actividadesBitacora.add(8);
                                  } else {
                                    actividadesBitacora.remove(8);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  cambioDePosicion ? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Se rotó',
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
                                              'https://img.icons8.com/color/344/examination.png',
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
                                  orinar = !orinar;
                                  if(orinar == true){
                                    actividadesBitacora.add(9);
                                  } else {
                                    actividadesBitacora.remove(9);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  orinar ? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Orinó',
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
                                              'https://img.icons8.com/color/344/wc.png',
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
                                  defecar = !defecar;
                                  if(defecar == true){
                                    actividadesBitacora.add(10);
                                  } else {
                                    actividadesBitacora.remove(10);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  defecar? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Defecó',
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
                                              'https://img.icons8.com/color/344/wc.png',
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
                                  cambioPanal = !cambioPanal;
                                  if(cambioPanal == true){
                                    actividadesBitacora.add(11);
                                  } else {
                                    actividadesBitacora.remove(11);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  cambioPanal? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Cambiar Pañal',
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
                                              'https://img.icons8.com/color/344/nappy.png',
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
                                  vomitar = !vomitar;
                                  if(vomitar == true){
                                    actividadesBitacora.add(12);
                                  } else {
                                    actividadesBitacora.remove(12);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  vomitar? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Vomitó',
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
                                  visitaFamiliar = !visitaFamiliar;
                                  if(visitaFamiliar == true){
                                    actividadesBitacora.add(13);
                                  } else {
                                    actividadesBitacora.remove(13);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  visitaFamiliar? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Visita familiar',
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
                                              'https://img.icons8.com/color/344/defend-family--v2.png',
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
                                  salidaFamiliar = !salidaFamiliar;
                                  if(salidaFamiliar == true){
                                    actividadesBitacora.add(14);
                                  } else {
                                    actividadesBitacora.remove(14);
                                  }
                                });
                              },
                              child:
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  border:  salidaFamiliar? Border.all(color:Colors.green, width: 1) : Border.all(color:Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                              child: Text(
                                                'Salida familiar',
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
                                              'https://img.icons8.com/color/344/leave-house.png',
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
                                     child:  RegistroBitacoraV2Widget(idPaciente: widget.idPaciente1, nombrePaciente: widget.nombrePaciente1, idTemp: widget.idTemp, listTemp: widget.listTemp),
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
bool dormir = false;
bool caminar = false;
bool verTV = false;
bool tomarElSol = false;
bool banoSolo = false;
bool banoAsistido = false;
bool ejercicioSolo = false;
bool juegosMentales = false;
bool cambioDePosicion = false;
bool defecar = false;
bool orinar = false;
bool cambioPanal = false;
bool vomitar = false;
bool visitaFamiliar = false;
bool salidaFamiliar = false;