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

class ListaPacientesV2Widget extends StatefulWidget {
  final User user;
  const ListaPacientesV2Widget({this.user});

  @override
  _ListaPacientesV2WidgetState createState() => _ListaPacientesV2WidgetState();
}

class _ListaPacientesV2WidgetState extends State<ListaPacientesV2Widget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // late User? _currentUser = widget.user;

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
  Future fetchData() async {
    http.Response response;
    response = await http.post(
        Uri.parse(
            'http://10.0.2.2/public/colaborador/pacientesByColaborador?idColaborador=$idColaborador'),
        headers: {
          "Token": FireAuth.token,
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];

        listLen = listResponse.length.toString();
        print('listResponseLista: $listResponse');
        for (var i = 0; i < listResponse.length; i++) {
          listResponse1
              .add(mapResponse['data'][i]['nombrecompleto'].toString());
          idClientes.add(mapResponse['data'][i]['cliente'].toString());
          print('listResponseListaN: $listResponse1');
        }
      });
    }
  }

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 400,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 400,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 110),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 400,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 120),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 400,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 130),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    fetchData();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    textController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Pacientes',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                child: TextFormField(
                  controller: textController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Escribe el nombre del paciente...',
                    labelStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                    child: Text(
                      'Pacientes encontrados:',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 12, 16, 0),
                    child: Text(
                      listLen,
                      // '4',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      for (var i = 0; i < listResponse.length; i++)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaginaPerfilV3Widget(
                                      id: i, list: listResponse),
                                ),
                              );
                            },
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0,
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    offset: Offset(0, 1),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.network(
                                        'https://img.icons8.com/ios/344/user-female-circle.png',
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Text(
                                              listResponse1[i],
                                              // 'Rosario Armenta',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    'Id: ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(1, 0, 0, 0),
                                                  child: Text(
                                                    idClientes[i],
                                                    // 'ID: 24',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2,
                                                  ),
                                                ),
                                                // Padding(
                                                //   padding: EdgeInsetsDirectional
                                                //       .fromSTEB(4, 0, 0, 0),
                                                //   child: Text(
                                                //     'name@domain.com',
                                                //     style: FlutterFlowTheme.of(
                                                //             context)
                                                //         .bodyText2,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 4, 4, 4),
                                        child: Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).animated(
                              [animationsMap['containerOnPageLoadAnimation1']]),
                        ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                      //   child: Container(
                      //     width: 100,
                      //     decoration: BoxDecoration(
                      //       color: FlutterFlowTheme.of(context)
                      //           .secondaryBackground,
                      //       boxShadow: [
                      //         BoxShadow(
                      //           blurRadius: 0,
                      //           color: FlutterFlowTheme.of(context).lineColor,
                      //           offset: Offset(0, 1),
                      //         )
                      //       ],
                      //     ),
                      //     child: Padding(
                      //       padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      //       child: Row(
                      //         mainAxisSize: MainAxisSize.max,
                      //         children: [
                      //           ClipRRect(
                      //             borderRadius: BorderRadius.circular(40),
                      //             child: Image.network(
                      //               'https://img.icons8.com/ios/344/user-female-circle.png',
                      //               width: 60,
                      //               height: 60,
                      //               fit: BoxFit.cover,
                      //             ),
                      //           ),
                      //           Expanded(
                      //             child: Column(
                      //               mainAxisSize: MainAxisSize.max,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Padding(
                      //                   padding: EdgeInsetsDirectional.fromSTEB(
                      //                       12, 0, 0, 0),
                      //                   child: Text(
                      //                     'Rosario Vela',
                      //                     style: FlutterFlowTheme.of(context)
                      //                         .subtitle1,
                      //                   ),
                      //                 ),
                      //                 Padding(
                      //                   padding: EdgeInsetsDirectional.fromSTEB(
                      //                       0, 4, 0, 0),
                      //                   child: Row(
                      //                     mainAxisSize: MainAxisSize.max,
                      //                     children: [
                      //                       Padding(
                      //                         padding: EdgeInsetsDirectional
                      //                             .fromSTEB(12, 0, 0, 0),
                      //                         child: Text(
                      //                           'ID: 54',
                      //                           style:
                      //                               FlutterFlowTheme.of(context)
                      //                                   .bodyText2,
                      //                         ),
                      //                       ),
                      //                       Padding(
                      //                         padding: EdgeInsetsDirectional
                      //                             .fromSTEB(4, 0, 0, 0),
                      //                         child: Text(
                      //                           'name@domain.com',
                      //                           style:
                      //                               FlutterFlowTheme.of(context)
                      //                                   .bodyText2,
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           Card(
                      //             clipBehavior: Clip.antiAliasWithSaveLayer,
                      //             color: FlutterFlowTheme.of(context)
                      //                 .primaryBackground,
                      //             elevation: 1,
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(40),
                      //             ),
                      //             child: Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   4, 4, 4, 4),
                      //               child: Icon(
                      //                 Icons.keyboard_arrow_right_rounded,
                      //                 color: FlutterFlowTheme.of(context)
                      //                     .secondaryText,
                      //                 size: 24,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ).animated(
                      //       [animationsMap['containerOnPageLoadAnimation2']]),
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                      //   child: Container(
                      //     width: 100,
                      //     decoration: BoxDecoration(
                      //       color: FlutterFlowTheme.of(context)
                      //           .secondaryBackground,
                      //       boxShadow: [
                      //         BoxShadow(
                      //           blurRadius: 0,
                      //           color: FlutterFlowTheme.of(context).lineColor,
                      //           offset: Offset(0, 1),
                      //         )
                      //       ],
                      //     ),
                      //     child: Padding(
                      //       padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      //       child: Row(
                      //         mainAxisSize: MainAxisSize.max,
                      //         children: [
                      //           ClipRRect(
                      //             borderRadius: BorderRadius.circular(40),
                      //             child: Image.network(
                      //               'https://img.icons8.com/ios/344/user-female-circle.png',
                      //               width: 60,
                      //               height: 60,
                      //               fit: BoxFit.cover,
                      //             ),
                      //           ),
                      //           Expanded(
                      //             child: Column(
                      //               mainAxisSize: MainAxisSize.max,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Padding(
                      //                   padding: EdgeInsetsDirectional.fromSTEB(
                      //                       12, 0, 0, 0),
                      //                   child: Text(
                      //                     'Rosenda Lopez',
                      //                     style: FlutterFlowTheme.of(context)
                      //                         .subtitle1,
                      //                   ),
                      //                 ),
                      //                 Padding(
                      //                   padding: EdgeInsetsDirectional.fromSTEB(
                      //                       0, 4, 0, 0),
                      //                   child: Row(
                      //                     mainAxisSize: MainAxisSize.max,
                      //                     children: [
                      //                       Padding(
                      //                         padding: EdgeInsetsDirectional
                      //                             .fromSTEB(12, 0, 0, 0),
                      //                         child: Text(
                      //                           'ID: 55',
                      //                           style:
                      //                               FlutterFlowTheme.of(context)
                      //                                   .bodyText2,
                      //                         ),
                      //                       ),
                      //                       Padding(
                      //                         padding: EdgeInsetsDirectional
                      //                             .fromSTEB(4, 0, 0, 0),
                      //                         child: Text(
                      //                           'name@domain.com',
                      //                           style:
                      //                               FlutterFlowTheme.of(context)
                      //                                   .bodyText2,
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           Card(
                      //             clipBehavior: Clip.antiAliasWithSaveLayer,
                      //             color: FlutterFlowTheme.of(context)
                      //                 .primaryBackground,
                      //             elevation: 1,
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(40),
                      //             ),
                      //             child: Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   4, 4, 4, 4),
                      //               child: Icon(
                      //                 Icons.keyboard_arrow_right_rounded,
                      //                 color: FlutterFlowTheme.of(context)
                      //                     .secondaryText,
                      //                 size: 24,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ).animated(
                      //       [animationsMap['containerOnPageLoadAnimation3']]),
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                      //   child: Container(
                      //     width: 100,
                      //     decoration: BoxDecoration(
                      //       color: FlutterFlowTheme.of(context)
                      //           .secondaryBackground,
                      //       boxShadow: [
                      //         BoxShadow(
                      //           blurRadius: 0,
                      //           color: FlutterFlowTheme.of(context).lineColor,
                      //           offset: Offset(0, 1),
                      //         )
                      //       ],
                      //     ),
                      //     child: Padding(
                      //       padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      //       child: Row(
                      //         mainAxisSize: MainAxisSize.max,
                      //         children: [
                      //           ClipRRect(
                      //             borderRadius: BorderRadius.circular(40),
                      //             child: Image.network(
                      //               'https://img.icons8.com/ios/344/user-female-circle.png',
                      //               width: 60,
                      //               height: 60,
                      //               fit: BoxFit.cover,
                      //             ),
                      //           ),
                      //           Expanded(
                      //             child: Column(
                      //               mainAxisSize: MainAxisSize.max,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Padding(
                      //                   padding: EdgeInsetsDirectional.fromSTEB(
                      //                       12, 0, 0, 0),
                      //                   child: Text(
                      //                     'Rose Smith',
                      //                     style: FlutterFlowTheme.of(context)
                      //                         .subtitle1,
                      //                   ),
                      //                 ),
                      //                 Padding(
                      //                   padding: EdgeInsetsDirectional.fromSTEB(
                      //                       0, 4, 0, 0),
                      //                   child: Row(
                      //                     mainAxisSize: MainAxisSize.max,
                      //                     children: [
                      //                       Padding(
                      //                         padding: EdgeInsetsDirectional
                      //                             .fromSTEB(12, 0, 0, 0),
                      //                         child: Text(
                      //                           'ID: 78',
                      //                           style:
                      //                               FlutterFlowTheme.of(context)
                      //                                   .bodyText2,
                      //                         ),
                      //                       ),
                      //                       Padding(
                      //                         padding: EdgeInsetsDirectional
                      //                             .fromSTEB(4, 0, 0, 0),
                      //                         child: Text(
                      //                           'name@domain.com',
                      //                           style:
                      //                               FlutterFlowTheme.of(context)
                      //                                   .bodyText2,
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           Card(
                      //             clipBehavior: Clip.antiAliasWithSaveLayer,
                      //             color: FlutterFlowTheme.of(context)
                      //                 .primaryBackground,
                      //             elevation: 1,
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(40),
                      //             ),
                      //             child: Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   4, 4, 4, 4),
                      //               child: Icon(
                      //                 Icons.keyboard_arrow_right_rounded,
                      //                 color: FlutterFlowTheme.of(context)
                      //                     .secondaryText,
                      //                 size: 24,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ).animated(
                      //       [animationsMap['containerOnPageLoadAnimation4']]),
                      // ),
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
