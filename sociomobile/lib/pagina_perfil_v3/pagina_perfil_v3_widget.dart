import 'package:qido_colaboradores/bitacoravariables.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../registro_bitacora_v2/registro_bitacora_v2_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../pagina_perfil_v3/pagina_perfil_v3_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../usertoken.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:qido_colaboradores/utils/fire_auth.dart';
import 'package:qido_colaboradores/utils/validator.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../lista_pacientes_v2/lista_pacientes_v2_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../usertoken.dart';

class PaginaPerfilV3Widget extends StatefulWidget {
  const PaginaPerfilV3Widget({Key key, this.id, this.list}) : super(key: key);

  final int id;
  final List list;
  @override
  _PaginaPerfilV3WidgetState createState() => _PaginaPerfilV3WidgetState();
}

class _PaginaPerfilV3WidgetState extends State<PaginaPerfilV3Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

    bool _isSendingVerification = false;
  bool _isSigningOut = false;

  // User? _currentUser = widget.user;

    Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "token": token,
  };

    String stringResponse = '';
  List listResponse = [];
  List listResponse1 = [];
  List idClientes = [];
  Map mapResponse = {};
  Map mapResponse1 = {};
  String listLen = "";
  String nombreMedico = "";
  String telefonoContacto = "";
  Future fetchData() async {
    http.Response response;
    response = await http.post(Uri.parse('http://10.0.2.2/public/colaborador/colaboradorById?idCliente=${widget.list[widget.id]['cliente']}'), headers: {"Token": FireAuth.token,});
    print(response.statusCode);
    if (response.statusCode==200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
        
        listLen = listResponse.length.toString();
        nombreMedico = listResponse[0]['nombreMedico'];
        if (nombreMedico == null) {
          nombreMedico = "NA";
        }

        telefonoContacto = listResponse[0]['telefonoContacto'];
        if (telefonoContacto == null) {
          telefonoContacto = listResponse[0]['telefono'];
          if (telefonoContacto == null) {
            telefonoContacto = "NA";
          }
        }

        print('listResponseLista123: $listResponse');
        // for (var i = 0; i < listResponse.length; i++) {
        //   listResponse1.add(mapResponse['data'][i]['nombrecompleto'].toString());
        //   idClientes.add(mapResponse['data'][i]['cliente'].toString());
        //   print('listResponseListaN: $listResponse1');
        // }
      });
    }
  }

    @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    idServicioBitacora = int.parse(widget.list[widget.id]['idServicio']);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () async {
            // Navigator.pop(context);
            await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListaPacientesV2Widget(),
                        // idPaciente: widget.list[widget.id]['cliente'], nombrePaciente: widget.list[widget.id]['nombrecompleto']
                      ),
                    );
          },
        ),
        title: Text(
          'Paciente - ID ${widget.list[widget.id]['cliente']}',
          textAlign: TextAlign.justify,
          style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x230F1113),
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Nombre',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              widget.list[widget.id]['nombrecompleto'],
                              // 'Rosario Armenta',
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Doctor',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        nombreMedico,
                        // 'Francisco Garza',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Teléfono',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      telefonoContacto,
                      // '+52 81-1111-1111',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Text(
                          'Recomendaciones',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if(widget.list[widget.id]['procedimientos'] == null)
                    Expanded(
                      child: Text(
                        "Sin datos",
                        // 'La persona que se quede a cuidar a doña Rosario debe saber cocinar, es muy puntual para sus horarios de comidas, le gusta platicar y hacer bromas, debe ser paciente ya que ella a veces es un poco terca. Se debe ser limpio ya que a doña Rosario no le gusta el desorden.',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    if(widget.list[widget.id]['procedimientos'] != null)
                    Expanded(
                      child: Text(
                        widget.list[widget.id]['procedimientos'],
                        // 'La persona que se quede a cuidar a doña Rosario debe saber cocinar, es muy puntual para sus horarios de comidas, le gusta platicar y hacer bromas, debe ser paciente ya que ella a veces es un poco terca. Se debe ser limpio ya que a doña Rosario no le gusta el desorden.',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Bitácoras',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).gray200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Consultar bitácoras',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistroBitacoraV2Widget(idPaciente: widget.list[widget.id]['cliente'], nombrePaciente: widget.list[widget.id]['nombrecompleto'], listTemp: widget.list, idTemp: widget.id),
                        // idPaciente: widget.list[widget.id]['cliente'], nombrePaciente: widget.list[widget.id]['nombrecompleto']
                      ),
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Agregar bitácora',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
