// import '../bitacora/bitacora_widget.dart';
// import '../flutter_flow/flutter_flow_icon_button.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socios_qido/views/bitacoraInfoWidget.dart';
import 'package:socios_qido/views/infoPaciente1Widget.dart';
import 'package:socios_qido/views/loginWidget.dart';
import 'package:socios_qido/views/pacientesAsignados.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socios_qido/views/menu_page.dart';
import 'package:socios_qido/main.dart';
import 'package:http/http.dart' as http;




import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socios_qido/views/infoPaciente1Widget.dart';
import 'package:socios_qido/views/loginWidget.dart';
import 'package:socios_qido/views/pacientesAsignados.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socios_qido/views/menu_page.dart';
import 'package:socios_qido/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socios_qido/utils/fire_auth.dart';
import 'package:socios_qido/utils/validator.dart';
import 'package:socios_qido/views/dashboard_page.dart';
// import 'package:socios_qido/views/listaPacientesWidget.dart';
import 'package:socios_qido/views/profile_page.dart';
import 'package:socios_qido/views/register_page.dart';

import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socios_qido/views/pacientesAsignados.dart';
import 'package:provider/provider.dart';
import 'package:socios_qido/views/menu_page.dart';
import 'package:socios_qido/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:socios_qido/views/usertoken.dart';
import './usertoken.dart';


import './bitacoraWidget.dart';

class InfoPaciente1Widget extends StatefulWidget {
  // const InfoPaciente1Widget({Key key}) : super(key: key);
    final User? user;
    final int id;
    final List list;
    final List procedimientos;
    const InfoPaciente1Widget({required this.user, required this.id, required this.list, required this.procedimientos});

  @override
  _InfoPaciente1WidgetState createState() => _InfoPaciente1WidgetState();
}

class _InfoPaciente1WidgetState extends State<InfoPaciente1Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User? _currentUser = widget.user;

    Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "token": token,
  };

  late int _currentId = widget.id;
  late List _currentList = widget.list;
  late List _currentProcedimientos = widget.procedimientos;
  late String _size = _currentList[_currentId].toString();

  //     String stringResponse = '';
  // List listResponse = [];
  // List listResponse1 = [];
  // List idClientes = [];
  // Map mapResponse = {};
  // Map mapResponse1 = {};
  // Future fetchData() async {
  //   http.Response response;
  //   var id = _currentList[_currentId]['idCliente'];
  //   response = await http.get(Uri.parse('http://10.0.2.2/public/cliente/colaboradoresByCliente?cliente=$id'), headers: {"Token": FireAuth.token,});
  //   if (response.statusCode==200) {
  //     setState(() {
  //       mapResponse = json.decode(response.body);
  //       listResponse = mapResponse['data'];
  //       for (var i = 0; i < listResponse.length; i++) {
  //         listResponse1.add(mapResponse['data'][i]['idServicio']);
  //       }

  //       // int listLen = 0;
  //       // listLen = listResponse[0].length;
  //       print('listResponseListaaa: $listResponse1');
  //     });
  //   }
  //   fetchData1();
  // }

  // String stringResponse1 = '';
  // List listResponse2 = [];
  // List listResponse3 = [];
  // List idClientes1 = [];
  // Map mapResponse2 = {};
  // Map mapResponse3 = {};
  // Future fetchData1() async {
  //   http.Response response;
  //   var idServicio = listResponse1[0];
  //   response = await http.get(Uri.parse('http://10.0.2.2/public/cliente/bitacorasByServicio?idServicio=$idServicio'), headers: {"Token": FireAuth.token,});
  //   if (response.statusCode==200) {
  //     setState(() {
  //       mapResponse2 = json.decode(response.body);
  //       listResponse2 = mapResponse2['data'];
  //       for (var i = 0; i < listResponse2.length; i++) {
  //         listResponse3.add(mapResponse2['data'][i]);
  //       }
  //       int listLen3 = 0;
  //       listLen3 = listResponse3.length;
  //       print('listResponseListaaa111: $listResponse3');
  //     });
  //   }
  // }

  //   @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    print("procedimeintops $_size");
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF00D8D6),
        automaticallyImplyLeading: false,
        leading: IconButton(
          // borderColor: Colors.transparent,
          // borderRadius: 30,
          // borderWidth: 1,
          // buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Información del Paciente',
          style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              decoration: BoxDecoration(
                color: Color(0xFF39D2C0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              // 'Adolfo Lozano',
                              _currentList[_currentId]['nombrecompleto'],
                              style:
                                  TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            // Padding(
                            //   padding:
                            //       EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            //   child: Text(
                            //     'Colaborador Asignado: Juan Perez',
                            //     style: TextStyle(
                            //           fontFamily: 'Lexend Deca',
                            //           color: Color(0xB4FFFFFF),
                            //           fontSize: 14,
                            //           fontWeight: FontWeight.normal,
                            //         ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.badge,
                            color: Color(0xFF39D2C0),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Text(
                              'Id',
                              style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              // '24',
                              _currentList[_currentId]['idCliente'],
                              style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.person,
                            color: Color(0xFF39D2C0),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Text(
                              'Nombre',
                              style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              // 'Adolfo Lozano',
                              _currentList[_currentId]['nombrecompleto'],
                              style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Color(0xFF39D2C0),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Text(
                              'Telefono de contacto',
                              style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              _currentList[_currentId]['telefonoContacto'],
                              style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.person_pin_circle_outlined,
                            color: Color(0xFF39D2C0),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Text(
                              'Nombre del doctor',
                              style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              // 'Dr. Francisco Garza',
                              _currentList[_currentId]['nombreMedico'],
                              style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.healing,
                            color: Color(0xFF39D2C0),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Text(
                              'Cuidados',
                              style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Container(
                              width: 100,
                              height: 200,
                              decoration: BoxDecoration(),
                              child: AutoSizeText(
                                // 'La persona que se quede a cuidar a don Juan debe saber cocinar, es muy puntual para sus horarios de comidas, le gusta platicar y hacer bromas, debe ser paciente ya que él a veces es un poco terco. Debes ser limpia, por que a don Juan no le gusta el desorde',
                                _currentProcedimientos[_currentId][0],
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: ElevatedButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BitacoraWidget(user: _currentUser, idCliente: _currentList[_currentId]['idCliente'],),
                    ),
                  );
                },
                child: Text('Consulta de Bitácoras'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 50),
                  primary: Color(0xFF39D2C0),
                  textStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      elevation: 3,
                ),
                
                // options: FFButtonOptions(
                //   width: double.infinity,
                //   height: 50,
                //   color: Color(0xFF39D2C0),
                //   textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                //         fontFamily: 'Poppins',
                //         color: Colors.white,
                //         fontSize: 16,
                //         fontWeight: FontWeight.w500,
                //       ),
                //   elevation: 3,
                //   borderSide: BorderSide(
                //     color: Color(0xFF00D8D6),
                //     width: 1,
                //   ),
                //   borderRadius: 8,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
