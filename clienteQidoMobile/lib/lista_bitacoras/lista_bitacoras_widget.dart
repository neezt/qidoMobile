import '../consulta_bitacora/consulta_bitacora_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../fotos_bitacora/fotos_bitacora_widget.dart';
import '../perfil_paciente/perfil_paciente_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../usertoken.dart';
import '../utils/fire_auth.dart';

class ListaBitacorasWidget extends StatefulWidget {
  const ListaBitacorasWidget({Key key, this.idCliente ,this.id, this.list,this.procedimientos}) : super(key: key);
  final int id;
  final List list;
  final List procedimientos;
  final String idCliente;
  //const ListaBitacorasWidget({this.idCliente});

  @override
  _ListaBitacorasWidgetState createState() => _ListaBitacorasWidgetState();
}

class _ListaBitacorasWidgetState extends State<ListaBitacorasWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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

  //get idCliente => this.idCliente;
  Future fetchData() async {
    print("EL ID : ${widget.id}");
    print("La lista que viene : ${widget.list}");
    print("Los procedimientos : ${widget.procedimientos}");
    print("EL ID CLIENTE : ${widget.idCliente}");
    http.Response response;
    var id = widget.idCliente;
    response = await http.get(Uri.parse('https://otconsultingback.comercioincoterms.com/cliente/colaboradoresByCliente?cliente=$id'), headers: {"Token": FireAuth.token,});
    if (response.statusCode==200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
        for (var i = 0; i < listResponse.length; i++) {
          listResponse1.add(mapResponse['data'][i]['idServicio']);
        }

        // int listLen = 0;
        // listLen = listResponse[0].length;
        print('ColaboradoresByCliente $listResponse1');
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
    print("ID servicio: $idServicio");
    response = await http.get(Uri.parse('https://otconsultingback.comercioincoterms.com/cliente/bitacorasByServicio?idServicio=$idServicio'), headers: {"Token": FireAuth.token,});
    if (response.statusCode==200) {
      setState(() {
        mapResponse2 = json.decode(response.body);
        listResponse2 = mapResponse2['data'];
        for (var i = 0; i < listResponse2.length; i++) {
          listResponse3.add(mapResponse2['data'][i]);
        }
        int listLen3 = 0;
        listLen3 = listResponse3.length;
        print('BitacorasByServicio $listResponse3');
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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    buttonSize: 46,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 24,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PerfilPacienteWidget(
                              id: widget.id, list: widget.list, procedimientos: widget.procedimientos
                          ),
                        ),
                      );
                    },
                  ),
                  Text(
                    'Bitácoras',
                    style: FlutterFlowTheme.of(context).title1,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 24, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Todas las bitácoras',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ],
                ),
              ),
              for (var i = 0; i < listResponse3.length; i++)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConsultaBitacoraWidget(
                          list: listResponse3,list2: widget.list, idTemp: i, idCliente: widget.idCliente, procedimientos: widget.procedimientos,),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color:
                                FlutterFlowTheme.of(context).secondaryText,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 2,
                              height: 110,
                              decoration: BoxDecoration(
                                color:
                                FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    listResponse3[i]['fechaCaptura'].toString().substring(0,11) + " "+listResponse3[i]['fechaCaptura'].toString().substring(11),
                                    style:
                                    FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FotosBitacoraWidget(),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.photo_camera,
                                      color: Color(0xFF95A1AC),
                                      size: 30,
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: Color(0xFF95A1AC),
                                    size: 30,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Bitácora registrada',
                                    style:
                                    FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://picsum.photos/seed/252/600',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ListaBitacorasWidget(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Adolfo Lozano',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
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
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(23, 0, 0, 0),
                        child: Container(
                          width: 2,
                          height: 84,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Text(
                  'Comienzo de Actividad',
                  style: FlutterFlowTheme.of(context).subtitle1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
