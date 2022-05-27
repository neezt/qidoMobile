// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// import '../info_paciente1/info_paciente1_widget.dart';
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
import 'package:socios_qido/views/listaPacientesWidget.dart';
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
class ListaPacientesWidget extends StatefulWidget {
  // const ListaPacientesWidget({Key key}) : super(key: key);
    // final User? user;
    // const ListaPacientesWidget({required this.user});

    User? user;
    ListaPacientesWidget({required this.user});

  @override
  _ListaPacientesWidgetState createState() => _ListaPacientesWidgetState();
}

class _ListaPacientesWidgetState extends State<ListaPacientesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // late User? _currentUser = widget.user;

  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User? _currentUser = widget.user;

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
  Future fetchData() async {
    http.Response response;
    response = await http.get(Uri.parse('http://10.0.2.2/public/cliente/clientesByContacto?correoContacto=$email'), headers: {"Token": FireAuth.token,});
    if (response.statusCode==200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
        int listLen = 0;
        listLen = listResponse.length;
        print('listResponseLista: $listResponse');
        for (var i = 0; i < listResponse.length; i++) {
          listResponse1.add(mapResponse['data'][i]['nombrecompleto'].toString());
          idClientes.add(mapResponse['data'][i]['idCliente'].toString());
          print('listResponseListaN: $listResponse1');
        }
      });
    }
    fetchData1();
  }

  String stringResponse1 = '';
  List listResponse2 = [];
  List listResponse3 = [];
  List listResponse4 = [];
  List listResponseClienteLen = [];
  List procedimiento = [];
  List procedimientos = [];
  Map mapResponse2 = {};
  Map mapResponse3 = {};

  Future fetchData1() async {
    var tokenBitacora = FireAuth.token;
    print("tokenBITACORA $tokenBitacora");
    http.Response response;
    for(var j = 0; j < idClientes.length; j++) {
        listResponse3 = [];
        procedimiento = [];
      var id = idClientes[j];
      response = await http.get(Uri.parse('http://10.0.2.2/public/cliente/colaboradoresByCliente?cliente=$id'), headers: {"Token": FireAuth.token,});
    if (response.statusCode==200) {
      setState(() {
        mapResponse2 = json.decode(response.body);
        listResponse2 = mapResponse2['data'];
        for (var i = 0; i < listResponse2.length; i++) {
          if (mapResponse2['data'][i]['idServicio'] != mapResponse2['data'][i+1]['idServicio']) {
            listResponse3.add(mapResponse2['data'][i]['nombrecompleto'].toString());
            procedimiento.add(mapResponse2['data'][i]['procedimientos'].toString());
            return;
          } else {
            listResponse3.add(mapResponse2['data'][i]['nombrecompleto'].toString());
          }
          // listResponse3.add(mapResponse2['data'][i].toString());
          // print('listResponseCliente: $listResponse3');
        }
                
      });
    }
        listResponse4.add(listResponse3);
        procedimientos.add(procedimiento);
      listResponseClienteLen.add(listResponse3.length);
      print('listResponseCliente: $listResponse4');
    }
    // response = await http.get(Uri.parse('http://10.0.2.2/public/cliente/colaboradoresByCliente?cliente=$email'), headers: {"Token": FireAuth.token,});
    // if (response.statusCode==200) {
    //   setState(() {
    //     mapResponse = json.decode(response.body);
    //     listResponse = mapResponse['data'];
    //     int listLen = 0;
    //     listLen = listResponse.length;
    //     print('listResponseLista: $listResponse');
    //     for (var i = 0; i < listResponse.length; i++) {
    //       listResponse1.add(mapResponse['data'][i]['nombrecompleto'].toString());
    //       idClientes.add(mapResponse['data'][i]['idCliente'].toString());
    //       print('listResponseListaN: $listResponse1');
    //     }
    //   });
    // }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Future<FirebaseApp> _initializeFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();

  //   User? user = FirebaseAuth.instance.currentUser;

  //   if (user != null) {
  //     if(listResponse1.contains(_emailTextController.text)) {
  //       Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => DashboardPage(
  //           user: user,
  //         ),
  //       ),
  //     );
  //     }
  //   }

  //   return firebaseApp;
  // }


  @override
  Widget build(BuildContext context) {
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
          'Pacientes',
          style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF8F8F8),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      for (var i = 0; i < listResponse.length; i++)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                        child: Container(
                          width: double.infinity,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InfoPaciente1Widget(user: _currentUser, id: i, list: listResponse, procedimientos: procedimientos),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 1, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              listResponse1[i],
                                              // 'Adolfo Lozano',
                                              style: TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF090F13),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (listResponseClienteLen[i]==1)
                                            Text(
                                              'Colaborador Asignado: ',
                                              style: TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                            if (listResponseClienteLen[i]==1)
                                            Text(
                                              listResponse4[i][0],
                                              style: TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                            if (listResponseClienteLen[i]>1)
                                            Text(
                                              'Colaboradores Asignados:',
                                              style: TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                            if (listResponseClienteLen[i]>1)
                                            Text(
                                               listResponse4[i][0],
                                              style: TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                            if (listResponseClienteLen[i]>1)
                                            Text(
                                               '+',
                                              style: TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                        child: Icon(
                                          Icons.chevron_right_outlined,
                                          color: Color(0xFF95A1AC),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                      //   child: Container(
                      //     width: double.infinity,
                      //     height: 90,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //     ),
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: [
                      //         Expanded(
                      //           child: Padding(
                      //             padding: EdgeInsetsDirectional.fromSTEB(
                      //                 8, 1, 0, 0),
                      //             child: Column(
                      //               mainAxisSize: MainAxisSize.max,
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 Row(
                      //                   mainAxisSize: MainAxisSize.max,
                      //                   children: [
                      //                     Text(
                      //                       'German Enriquez',
                      //                       style: TextStyle(
                      //                             fontFamily: 'Lexend Deca',
                      //                             color: Color(0xFF090F13),
                      //                             fontSize: 16,
                      //                             fontWeight: FontWeight.w500,
                      //                           ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 Row(
                      //                   mainAxisSize: MainAxisSize.max,
                      //                   children: [
                      //                     Text(
                      //                       'Colaborador Asignado: Juan Perez',
                      //                       style: TextStyle(
                      //                             fontFamily: 'Lexend Deca',
                      //                             color: Color(0xFF95A1AC),
                      //                             fontSize: 14,
                      //                             fontWeight: FontWeight.normal,
                      //                           ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         Column(
                      //           mainAxisSize: MainAxisSize.max,
                      //           children: [
                      //             Expanded(
                      //               child: Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     0, 0, 8, 0),
                      //                 child: Icon(
                      //                   Icons.chevron_right_outlined,
                      //                   color: Color(0xFF95A1AC),
                      //                   size: 24,
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
