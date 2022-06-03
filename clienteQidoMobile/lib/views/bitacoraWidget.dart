// import '../bitacora_info/bitacora_info_widget.dart';
// import '../flutter_flow/flutter_flow_icon_button.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// import '../imagenes/imagenes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
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

import './bitacoraInfoWidget.dart';
import './imagenesWidget.dart';

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

class BitacoraWidget extends StatefulWidget {
  // const BitacoraWidget({Key key}) : super(key: key);
  final User? user;
  final String idCliente;
  const BitacoraWidget({required this.user, required this.idCliente});

  @override
  _BitacoraWidgetState createState() => _BitacoraWidgetState();
}

class _BitacoraWidgetState extends State<BitacoraWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User? _currentUser = widget.user;

    Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "token": token,
  };

  // late User? _currentUser = widget.user;
  late String _currentIdCliente = widget.idCliente;

        String stringResponse = '';
  List listResponse = [];
  List listResponse1 = [];
  List idClientes = [];
  Map mapResponse = {};
  Map mapResponse1 = {};
  Future fetchData() async {
    http.Response response;
    var id = _currentIdCliente;
    response = await http.get(Uri.parse('http://10.0.2.2/public/cliente/colaboradoresByCliente?cliente=$id'), headers: {"Token": FireAuth.token,});
    if (response.statusCode==200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
        for (var i = 0; i < listResponse.length; i++) {
          listResponse1.add(mapResponse['data'][i]['idServicio']);
        }

        // int listLen = 0;
        // listLen = listResponse[0].length;
        print('listResponseListaaa: $listResponse1');
      });
    }
    fetchData1();
  }

  String stringResponse1 = '';
  List listResponse2 = [];
  List listResponse3 = [];
  List idClientes1 = [];
  Map mapResponse2 = {};
  Map mapResponse3 = {};
  Future fetchData1() async {
    http.Response response;
    
    var idServicio = listResponse1[0];
    print("IMPRIMIRRR: $idServicio");
    response = await http.get(Uri.parse('http://10.0.2.2/public/cliente/bitacorasByServicio?idServicio=$idServicio'), headers: {"Token": FireAuth.token,});
    if (response.statusCode==200) {
      setState(() {
        mapResponse2 = json.decode(response.body);
        listResponse2 = mapResponse2['data'];
        for (var i = 0; i < listResponse2.length; i++) {
          listResponse3.add(mapResponse2['data'][i]);
        }
        int listLen3 = 0;
        listLen3 = listResponse3.length;
        print('listResponseListaaa111: $listResponse3');
      });
    }
  }

    @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  // void initState() {
  //   super.initState();
  //   // On page load action.
  //   SchedulerBinding.instance!.addPostFrameCallback((_) async {
  //     Navigator.pop(context);
  //   });
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
          onPressed: () {
            Navigator.pop(context);          },
        ),
        title: Text(
          'Bitácoras',
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
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              for (var i = 0; i < listResponse3.length; i++)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fecha:',
                                    style:
                                        TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                  ),
                                  Text(
                                    'Hora:',
                                    style:
                                        TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // '01/05/2022',
                                      listResponse3[i]['fechaCaptura'].toString().substring(0,11),
                                      style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    Text(
                                      // '07:00',
                                      listResponse3[i]['fechaCaptura'].toString().substring(11),
                                      style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                        child: IconButton(
                                          // borderColor: Colors.transparent,
                                          // borderRadius: 30,
                                          // borderWidth: 1,
                                          // buttonSize: 60,
                                          icon: Icon(
                                            Icons.image_search,
                                            color: Color(0xFF39D2C0),
                                            size: 30,
                                          ),
                                          onPressed: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ImagenesWidget(user: _currentUser,),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                        child: IconButton(
                                          // borderColor: Colors.transparent,
                                          // borderRadius: 30,
                                          // borderWidth: 1,
                                          // buttonSize: 60,
                                          icon: Icon(
                                            Icons.search,
                                            color: Color(0xFF39D2C0),
                                            size: 30,
                                          ),
                                          onPressed: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BitacoraInfoWidget(user: _currentUser, list: listResponse3, idTemp: i)
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
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
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Expanded(
              //         child: Card(
              //           clipBehavior: Clip.antiAliasWithSaveLayer,
              //           color: Color(0xFFF5F5F5),
              //           child: Row(
              //             mainAxisSize: MainAxisSize.max,
              //             children: [
              //               Padding(
              //                 padding:
              //                     EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              //                 child: Column(
              //                   mainAxisSize: MainAxisSize.max,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       'Fecha:',
              //                       style:
              //                           TextStyle(
              //                               fontFamily: 'Poppins',
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                     ),
              //                     Text(
              //                       'Hora:',
              //                       style:
              //                           TextStyle(
              //                               fontFamily: 'Poppins',
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               Expanded(
              //                 child: Padding(
              //                   padding: EdgeInsetsDirectional.fromSTEB(
              //                       10, 0, 10, 0),
              //                   child: Column(
              //                     mainAxisSize: MainAxisSize.max,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                         '02/05/2022',
              //                         style: TextStyle(
              //                               fontFamily: 'Poppins',
              //                               fontWeight: FontWeight.normal,
              //                             ),
              //                       ),
              //                       Text(
              //                         '07:00',
              //                         style: TextStyle(
              //                               fontFamily: 'Poppins',
              //                               fontWeight: FontWeight.normal,
              //                             ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               Expanded(
              //                 child: Column(
              //                   mainAxisSize: MainAxisSize.min,
              //                   crossAxisAlignment: CrossAxisAlignment.end,
              //                   children: [
              //                     Row(
              //                       mainAxisSize: MainAxisSize.min,
              //                       mainAxisAlignment: MainAxisAlignment.end,
              //                       children: [
              //                         Padding(
              //                           padding: EdgeInsetsDirectional.fromSTEB(
              //                               0, 0, 10, 0),
              //                           child: IconButton(
              //                             // borderColor: Colors.transparent,
              //                             // borderRadius: 30,
              //                             // borderWidth: 1,
              //                             // buttonSize: 60,
              //                             icon: Icon(
              //                               Icons.image_search,
              //                               color: Color(0xFF39D2C0),
              //                               size: 30,
              //                             ),
              //                             onPressed: () async {
              //                               await Navigator.push(
              //                                 context,
              //                                 MaterialPageRoute(
              //                                   builder: (context) =>
              //                                       ImagenesWidget(user: _currentUser,),
              //                                 ),
              //                               );
              //                             },
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding: EdgeInsetsDirectional.fromSTEB(
              //                               0, 0, 10, 0),
              //                           child: IconButton(
              //                             // borderColor: Colors.transparent,
              //                             // borderRadius: 30,
              //                             // borderWidth: 1,
              //                             // buttonSize: 60,
              //                             icon: Icon(
              //                               Icons.search,
              //                               color: Color(0xFF39D2C0),
              //                               size: 30,
              //                             ),
              //                             onPressed: () {
              //                               print('IconButton pressed ...');
              //                             },
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Expanded(
              //         child: Card(
              //           clipBehavior: Clip.antiAliasWithSaveLayer,
              //           color: Color(0xFFF5F5F5),
              //           child: Row(
              //             mainAxisSize: MainAxisSize.max,
              //             children: [
              //               Padding(
              //                 padding:
              //                     EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              //                 child: Column(
              //                   mainAxisSize: MainAxisSize.max,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       'Fecha:',
              //                       style:
              //                           TextStyle(
              //                               fontFamily: 'Poppins',
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                     ),
              //                     Text(
              //                       'Hora:',
              //                       style:
              //                           TextStyle(
              //                               fontFamily: 'Poppins',
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               Expanded(
              //                 child: Padding(
              //                   padding: EdgeInsetsDirectional.fromSTEB(
              //                       10, 0, 10, 0),
              //                   child: Column(
              //                     mainAxisSize: MainAxisSize.max,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                         '03/05/2022',
              //                         style: TextStyle(
              //                               fontFamily: 'Poppins',
              //                               fontWeight: FontWeight.normal,
              //                             ),
              //                       ),
              //                       Text(
              //                         '07:00',
              //                         style: TextStyle(
              //                               fontFamily: 'Poppins',
              //                               fontWeight: FontWeight.normal,
              //                             ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               Expanded(
              //                 child: Column(
              //                   mainAxisSize: MainAxisSize.min,
              //                   crossAxisAlignment: CrossAxisAlignment.end,
              //                   children: [
              //                     Row(
              //                       mainAxisSize: MainAxisSize.min,
              //                       mainAxisAlignment: MainAxisAlignment.end,
              //                       children: [
              //                         Padding(
              //                           padding: EdgeInsetsDirectional.fromSTEB(
              //                               0, 0, 10, 0),
              //                           child: IconButton(
              //                             // borderColor: Colors.transparent,
              //                             // borderRadius: 30,
              //                             // borderWidth: 1,
              //                             // buttonSize: 60,
              //                             icon: Icon(
              //                               Icons.image_search,
              //                               color: Color(0xFF39D2C0),
              //                               size: 30,
              //                             ),
              //                             onPressed: () async {
              //                               await Navigator.push(
              //                                 context,
              //                                 MaterialPageRoute(
              //                                   builder: (context) =>
              //                                       ImagenesWidget(user: _currentUser,),
              //                                 ),
              //                               );
              //                             },
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding: EdgeInsetsDirectional.fromSTEB(
              //                               0, 0, 10, 0),
              //                           child: IconButton(
              //                             // borderColor: Colors.transparent,
              //                             // borderRadius: 30,
              //                             // borderWidth: 1,
              //                             // buttonSize: 60,
              //                             icon: Icon(
              //                               Icons.search,
              //                               color: Color(0xFF39D2C0),
              //                               size: 30,
              //                             ),
              //                             onPressed: () {
              //                               print('IconButton pressed ...');
              //                             },
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
