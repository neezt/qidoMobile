import '../dashboard_cliente/dashboard_cliente_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../perfil_paciente/perfil_paciente_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../usertoken.dart';
import '../utils/fire_auth.dart';

class ListaPacientesWidget extends StatefulWidget {
 // const ListaPacientesWidget({Key key}) : super(key: key);
  final User user;
  const ListaPacientesWidget({this.user});

  @override
  _ListaPacientesWidgetState createState() => _ListaPacientesWidgetState();
}

class _ListaPacientesWidgetState extends State<ListaPacientesWidget> with TickerProviderStateMixin {
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
    response = await http.get(Uri.parse('https://otconsultingback.comercioincoterms.com/cliente/clientesByContacto?correoContacto=$email'), headers: {"Token": FireAuth.token,});

    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];

        listLen = listResponse.length.toString();
        print('listResponseLista: $listResponse');
        for (var i = 0; i < listResponse.length; i++) {
          listResponse1.add(mapResponse['data'][i]['nombrecompleto'].toString());
          idClientes.add(mapResponse['data'][i]['idCliente'].toString());
          print('listResponseListaN: $listResponse1');
          print('Ids: $idClientes');
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
     // id = int.parse(id);
      print("todo bien $id");
      response = await http.get(Uri.parse('https://otconsultingback.comercioincoterms.com/cliente/colaboradoresByCliente?cliente=$id'), headers: {"Token": FireAuth.token,});
      print("holaaa ${response.statusCode}");
      if (response.statusCode==200) {

        setState(() {
          mapResponse2 = json.decode(response.body);
          listResponse2 = mapResponse2['data'];
          print("holi $listResponse2");

         // for (var i = 0; i < listResponse2.length; i++) {
          //  print("Q TAL ${mapResponse2['data'][i]['idServicio'] != mapResponse2['data'][i+1]['idServicio']}");

        //    if (mapResponse2['data'][i]['idServicio'] != mapResponse2['data'][i+1]['idServicio']) {
              listResponse3.add(mapResponse2['data'][0]['nombrecompleto'].toString());
              procedimiento.add(mapResponse2['data'][0]['procedimientos'].toString());
              print("AQUI SI $listResponse3");
            //  return;
          //  } else {
             // listResponse3.add(mapResponse2['data'][i]['nombrecompleto'].toString());
             // print("AQUI NEL $listResponse3");
           // }
            // listResponse3.add(mapResponse2['data'][i].toString());
             print('INFO DE LOS CLIENTES: $listResponse');
        //  }

        });
      }
      listResponse4.add(listResponse3);
      procedimientos.add(procedimiento);
      listResponseClienteLen.add(listResponse3.length);
      print('IDS DE CLIENTES $idClientes');
      print('Cuidadores $listResponse4');
      print('PROCEDIMIENTOS: $procedimientos');

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 54,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardClienteWidget(),
              ),
            );
          },
        ),
        title: Text(
          'Lista de Pacientes',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: textController,
                        onChanged: (_) => EasyDebounce.debounce(
                          'textController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Escribe aquí..',
                          labelStyle: FlutterFlowTheme.of(context).bodyText2,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 44,
                        icon: Icon(
                          Icons.search_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                child: Text(
                  'Resultado:',
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                child: ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    for (var i = 0; i < listResponse.length; i++)

                      Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x32000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(26),
                                child: Image.network(
                                  'https://wearesutd.sutd.edu.sg/wp-content/uploads/2017/11/generic-male-icon-blue.jpg',
                                  width: 36,
                                  height: 36,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          listResponse1[i],
                                          '',

                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black600,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                         if (listResponseClienteLen[i]==1)
                                           // if (listResponseClienteLen[i]>1)

                                              Text(
                                            "Cuidador: "+ listResponse4[i][0],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PerfilPacienteWidget(
                                              id: i, list: listResponse, procedimientos: procedimientos
                                          ),
                                    ),
                                  );
                                },
                                text: 'Ver',
                                options: FFButtonOptions(
                                  width: 70,
                                  height: 36,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
