// import '../flutter_flow/flutter_flow_icon_button.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socios_qido/views/loginWidget.dart';
import 'package:socios_qido/views/pacientesAsignados.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socios_qido/views/menu_page.dart';
import 'package:socios_qido/main.dart';
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

class BitacoraInfoWidget extends StatefulWidget {
  // const BitacoraInfoWidget({Key key}) : super(key: key);
    final User? user;
    const BitacoraInfoWidget({required this.user, required this.list, required this.idTemp});

    final List list;
    final int idTemp;
  @override
  _BitacoraInfoWidgetState createState() => _BitacoraInfoWidgetState();
}

class _BitacoraInfoWidgetState extends State<BitacoraInfoWidget> {
  late User? _currentUser = widget.user;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List listAlimentos = ["Nada", "Poco", "Normal", "Mas de lo Normal", "Mucho"];

  bool _isSendingVerification = false;
  bool _isSigningOut = false;

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
    response = await http.get(Uri.parse('http://10.0.2.2/public/bitacora/estadosAnimo'), headers: {"Token": FireAuth.token,});
    if (response.statusCode==200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
        // int listLen = 0;
        // listLen = listResponse.length;
        print('listResponseLista: $listResponse');
        for (var i = 0; i < listResponse.length; i++) {
          listResponse1.add(mapResponse['data'][i]['nombre'].toString());
          print('listResponseListaN: $listResponse1');
        }
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
          'Bitácora',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: ExpandableNotifier(
                    initialExpanded: false,
                    child: ExpandablePanel(
                      header: Text(
                        'Alimentación',
                        style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                      ),
                      collapsed: Container(),
                      expanded: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Desayuno: ',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['desayuno'] != "0" && widget.list[widget.idTemp]['desayuno'] != null)
                              Text(
                                listAlimentos[int.parse(widget.list[widget.idTemp]['desayuno'])-1],
                                // widget.list[widget.idTemp]['desayuno'],
                                // 'Nada',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['desayuno'] == "0" || widget.list[widget.idTemp]['desayuno'] == null)
                              Text(
                                'NA',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Comida: ',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['comida'] != "0" && widget.list[widget.idTemp]['comida'] != null)
                              Text(
                                listAlimentos[int.parse(widget.list[widget.idTemp]['comida'])-1],
                                // 'Poco',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['comida'] == "0" || widget.list[widget.idTemp]['comida'] == null)
                              Text(
                                'NA',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Cena: ',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['cena'] != "0" && widget.list[widget.idTemp]['cena'] != null)
                              Text(
                                listAlimentos[int.parse(widget.list[widget.idTemp]['cena'])-1],
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['cena'] == "0" || widget.list[widget.idTemp]['cena'] == null)
                              Text(
                                'NA',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: ExpandableNotifier(
                    initialExpanded: false,
                    child: ExpandablePanel(
                      header: Text(
                        'Cuidados y/o Actividades',
                        style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                      ),
                      collapsed: Container(),
                      expanded: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(children: [
                                                          Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
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
                                              'Salida familiar',
                                              // style:
                                              //     FlutterFlowTheme.of(context)
                                              //         .bodyText1,
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
                                                          Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
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
                                              'Ejercicio',
                                              // style:
                                              //     FlutterFlowTheme.of(context)
                                              //         .bodyText1,
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
                          ],)
                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          //     Text(
                          //       'Durmió: ',
                          //       style: TextStyle(
                          //             fontFamily: 'Poppins',
                          //             fontWeight: FontWeight.w600,
                          //           ),
                          //     ),
                          //     Text(
                          //       '30 min',
                          //       style: TextStyle(
                          //             fontFamily: 'Poppins',
                          //             fontWeight: FontWeight.w300,
                          //           ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          //     Text(
                          //       'Caminó ',
                          //       style: TextStyle(
                          //             fontFamily: 'Poppins',
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          //     Text(
                          //       'vio TV',
                          //       style: TextStyle(
                          //             fontFamily: 'Poppins',
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          //     Text(
                          //       'Tomo el sol',
                          //       style: TextStyle(
                          //             fontFamily: 'Poppins',
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          //     Text(
                          //       'Se baño solo',
                          //       style: TextStyle(
                          //             fontFamily: 'Poppins',
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          //     Text(
                          //       'Tuvo visita familiar',
                          //       style: TextStyle(
                          //             fontFamily: 'Poppins',
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          //     Text(
                          //       'Hizo Pipí',
                          //       style: TextStyle(
                          //             fontFamily: 'Poppins',
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: ExpandableNotifier(
                    initialExpanded: false,
                    child: ExpandablePanel(
                      header: Text(
                        'Estado de Ánimo',
                        style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                      ),
                      collapsed: Container(),
                      expanded: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if(widget.list[widget.idTemp]['idEstadoAnimo'] != "0" && widget.list[widget.idTemp]['idEstadoAnimo'] != null)
                              Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
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
                                              // style:
                                              //     FlutterFlowTheme.of(context)
                                              //         .bodyText1,
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
                              // Text(
                              //   listResponse1[int.parse(widget.list[widget.idTemp]['idEstadoAnimo'])-1],
                              //   // 'Con Dolor: ',
                              //   style: TextStyle(
                              //         fontFamily: 'Poppins',
                              //         fontWeight: FontWeight.w600,
                              //       ),
                              // ),
                              if(widget.list[widget.idTemp]['idEstadoAnimo'] == "0" || widget.list[widget.idTemp]['idEstadoAnimo'] == null)
                              Text(
                                'NA',
                                // 'Con Dolor: ',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              // Text(
                              //   'Medio',
                              //   style: TextStyle(
                              //         fontFamily: 'Poppins',
                              //         fontWeight: FontWeight.w500,
                              //       ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: ExpandableNotifier(
                    initialExpanded: false,
                    child: ExpandablePanel(
                      header: Text(
                        'Mediciones',
                        style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                      ),
                      collapsed: Container(),
                      expanded: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Temperatura corporal: ',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['temperaturaCorporal'] != "0" && widget.list[widget.idTemp]['temperaturaCorporal'] != null)
                              Text(
                                "${widget.list[widget.idTemp]['temperaturaCorporal']}°C",
                                // '36.5 °C',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['temperaturaCorporal'] == "0" || widget.list[widget.idTemp]['temperaturaCorporal'] == null)
                              Text(
                                'NA',
                                // '36.5 °C',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Presión arterial: ',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['presionSistolica'] != "0" && widget.list[widget.idTemp]['presionSistolica'] != null && widget.list[widget.idTemp]['presionDiastolica'] != "0" && widget.list[widget.idTemp]['presionDiastolica'] != null)
                              Text(
                                "${widget.list[widget.idTemp]['presionSistolica']}/${widget.list[widget.idTemp]['presionDiastolica']} mmHg",
                                // '120/80',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['presionSistolica'] == "0" || widget.list[widget.idTemp]['presionSistolica'] == null || widget.list[widget.idTemp]['presionDiastolica'] == "0" || widget.list[widget.idTemp]['presionDiastolica'] == null)
                              Text(
                                'NA',
                                // '120/80',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Nivel de azúcar: ',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['glucosa'] != "0" && widget.list[widget.idTemp]['glucosa'] != null)
                              Text(
                                '${widget.list[widget.idTemp]['glucosa']} mg/dl',
                                // '125 mg/dl',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['glucosa'] == "0" || widget.list[widget.idTemp]['glucosa'] == null)
                              Text(
                                'NA',
                                // '125 mg/dl',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Nivel de saturación de oxígeno: ',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['saturacionOxigeno'] != "0" && widget.list[widget.idTemp]['saturacionOxigeno'] != null)
                              Text(
                                "${widget.list[widget.idTemp]['saturacionOxigeno']} %",
                                // '95 %',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              if(widget.list[widget.idTemp]['saturacionOxigeno'] == "0" || widget.list[widget.idTemp]['saturacionOxigeno'] == null)
                              Text(
                                "NA",
                                // '95 %',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: ExpandableNotifier(
                    initialExpanded: false,
                    child: ExpandablePanel(
                      header: Text(
                        'Aplicaciones',
                        style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                      ),
                      collapsed: Container(),
                      expanded: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Vacunas/Inyecciones: ',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Icon(
                                            Icons.image_search,
                                            color: Color(0xFF39D2C0),
                                            size: 30,
                                          ),
                              // Text(
                              //   'Insulina',
                              //   style: TextStyle(
                              //         fontFamily: 'Poppins',
                              //         fontWeight: FontWeight.w300,
                              //       ),
                              // ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Toma de medicamentos: ',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Icon(
                                            Icons.image_search,
                                            color: Color(0xFF39D2C0),
                                            size: 30,
                                          ),
                              // Text(
                              //   'Metformina',
                              //   style: TextStyle(
                              //         fontFamily: 'Poppins',
                              //         fontWeight: FontWeight.w300,
                              //       ),
                              // ),
                            ],
                          ),
                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          //     Text(
                          //       'Terapias físicas: ',
                          //       style: TextStyle(
                          //             fontFamily: 'Poppins',
                          //             fontWeight: FontWeight.w600,
                          //           ),
                          //     ),
                          //     Text(
                          //       'Termoterapia',
                          //       style: TextStyle(
                          //             fontFamily: 'Poppins',
                          //             fontWeight: FontWeight.w300,
                          //           ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
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
