import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../inyecciones_bitacora_v2/inyecciones_bitacora_v2_widget.dart';
import '../lista_bitacoras/lista_bitacoras_widget.dart';
import '../medicamentos_bitacora_v2/medicamentos_bitacora_v2_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/usuario.dart';
import '../usertoken.dart';
import '../utils/fire_auth.dart';

class ConsultaBitacoraWidget extends StatefulWidget {
  const ConsultaBitacoraWidget({Key key,this.list, this.list2 ,this.idTemp, this.idCliente, this.procedimientos, this.usuario}) : super(key: key);
  final List list;

  final List list2;
  final List procedimientos;
  final int idTemp;
  final String idCliente;
  final Usuario usuario;
  @override
  _ConsultaBitacoraWidgetState createState() => _ConsultaBitacoraWidgetState();
}

class _ConsultaBitacoraWidgetState extends State<ConsultaBitacoraWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List listAlimentos = ["Nada", "Poco", "Normal", "Mas de lo Normal", "Mucho"];

  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "token": token,
  };

  List actividades = [];
  String stringResponse = '';
  List listResponse = [];
  List listResponse1 = [];
  List idClientes = [];
  Map mapResponse = {};
  Map mapResponse1 = {};
  Future fetchData() async {
    http.Response response;
    response = await http.get(Uri.parse('https://otconsultingback.comercioincoterms.com/bitacora/estadosAnimo'), headers: {"Token": widget.usuario.token,});
    if (response.statusCode==200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
        // int listLen = 0;
        // listLen = listResponse.length;
        print('Estados de Animo: $listResponse');
        for (var i = 0; i < listResponse.length; i++) {
          listResponse1.add(mapResponse['data'][i]['nombre'].toString());

        }
        print('Estado de Animo2: $listResponse1');
        print('Asi va la cosa: ${widget.idTemp} y tmb asi ${widget.list.length}');
      });
    }
     actividades = jsonDecode(widget.list[widget.idTemp]['actividad']);
     fetchData1();
  }

  String stringResponse1 = '';
  List listResponse2 = [];
  List listResponse3 = [];
  List idCliente1 = [];
  Map mapResponse2 = {};
  Map mapResponse3 = {};
  Future fetchData1() async {
    http.Response response;
    response = await http.get(Uri.parse('https://otconsultingback.comercioincoterms.com/bitacora/actividad'), headers: {"Token": widget.usuario.token,});
    if (response.statusCode==200) {
      setState(() {
        mapResponse2 = json.decode(response.body);
        listResponse2 = mapResponse2['data'];
        // int listLen = 0;
        // listLen = listResponse.length;

        //for (var i = 0; i < listResponse2.length; i++) {
          //listResponse3.add(mapResponse2['data'][i]['nombre'].toString());
          //print('listResponseListaN: $listResponse3');
        //}
      });
    }
  //  actividades = jsonDecode(widget.list[widget.idTemp]['actividad']);
    print('Actividades: $listResponse2');
    print('El idTemp: ${widget.idTemp}');
    print('Lista de List: ${widget.list}');
   // print("OTRA PRUEBA:${listResponse2[actividades[1]]['nombre']}");
  }

  @override
  void initState(){
    super.initState();
    fetchData();
    print('ListaTest: ${widget.list[widget.idTemp]}');
   // print('Actttt: ${actividades[1]}');
  }
  @override
  Widget build(BuildContext context) {
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
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaBitacorasWidget(
                  id:
                      1,
                  //widget.idTemp,
                  idCliente: widget.idCliente, list: widget.list2,procedimientos: widget.procedimientos, usuario: widget.usuario,),
              ),
            );
          },
        ),
        title: Text(
          'Bitácora\n${widget.list[widget.idTemp]['fechaCaptura']}',
          textAlign: TextAlign.justify,
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 15, 0, 0),
                          child: Text(
                            '',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                  child: Text(
                    '',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x1F000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alimentación',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                          Divider(
                            height: 24,
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [

                              Text(
                                'Desayuno:',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              if(widget.list[widget.idTemp]['desayuno'] != "0" && widget.list[widget.idTemp]['desayuno'] != null)

                                Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),

                                child: Text(
                                  listAlimentos[int.parse(widget.list[widget.idTemp]['desayuno'])-1],
                                  //'Poco',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              if(widget.list[widget.idTemp]['desayuno'] == "0" || widget.list[widget.idTemp]['desayuno'] == null)

                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),

                                  child: Text(
                                    "NA",
                                    //'Poco',
                                    style: FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Comida:',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              if(widget.list[widget.idTemp]['comida'] != "0" && widget.list[widget.idTemp]['comida'] != null)

                                Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  listAlimentos[int.parse(widget.list[widget.idTemp]['comida'])-1],
                                 // 'Mucho',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              if(widget.list[widget.idTemp]['comida'] == "0" || widget.list[widget.idTemp]['comida'] == null)
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                  child: Text(
                                    "NA",
                                    // 'Mucho',
                                    style: FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Cena:',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              if(widget.list[widget.idTemp]['cena'] != "0" && widget.list[widget.idTemp]['cena'] != null)
                                Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  listAlimentos[int.parse(widget.list[widget.idTemp]['cena'])-1],
                                 // 'Poco mas de lo normal',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              if(widget.list[widget.idTemp]['cena'] == "0" || widget.list[widget.idTemp]['cena'] == null)
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                  child: Text(
                                   "NA",
                                    // 'Poco mas de lo normal',
                                    style: FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x1F000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cuidados/Actividades',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                          Divider(
                            height: 24,
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      for (var i = 0; i < actividades.length; i++)

                                        Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0, -0.21),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 30, 0, 20),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 15, 0, 0),
                                                      child: Text(
                                                       getActividad(1,i),
                                                        //'Se durmió',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  fontSize: 12,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 30),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Image.network(
                                                     getActividad(0,i),
                                                      //'https://img.icons8.com/color/344/sleeping--v1.png',
                                                      width: 40,
                                                      height: 40,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ],
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
                        ],
                      ),
                    ),
                  ),
                ),
                if(widget.list[widget.idTemp]['idEstadoAnimo'] == "0" || widget.list[widget.idTemp]['idEstadoAnimo'] == null)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),

                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x1F000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estado de ánimo',
                              style: FlutterFlowTheme.of(context).title2,
                            ),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'NA',
                                          style: FlutterFlowTheme.of(context).title2,
                                        ),

                                      ],
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
                if(widget.list[widget.idTemp]['idEstadoAnimo'] != "0" && widget.list[widget.idTemp]['idEstadoAnimo'] != null)

                  Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),

            child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x1F000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estado de ánimo',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                          Divider(
                            height: 24,
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0, -0.21),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 30, 0, 20),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 15, 0, 0),
                                                      child: Text(
                                                        getLabel(),
                                                        //'Enojado',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  fontSize: 12,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 30),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Image.network(
                                                      getImagen(),
                                                     // 'https://img.icons8.com/color/344/sleeping--v1.png',
                                                      width: 40,
                                                      height: 40,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ],
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
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x1F000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mediciones',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                          Divider(
                            height: 24,
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Temperatura Corporal:',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              if(widget.list[widget.idTemp]['temperaturaCorporal'] != "0" && widget.list[widget.idTemp]['temperaturaCorporal'] != null)

                                Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  "${widget.list[widget.idTemp]['temperaturaCorporal']}°C",
                                  //'38.0',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              if(widget.list[widget.idTemp]['temperaturaCorporal'] == "0" || widget.list[widget.idTemp]['temperaturaCorporal'] == null)

                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                  child: Text(
                                   "NA",
                                    //'38.0',
                                    style: FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Presión arterial:',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              if(widget.list[widget.idTemp]['presionSistolica'] != "0" && widget.list[widget.idTemp]['presionSistolica'] != null && widget.list[widget.idTemp]['presionDiastolica'] != "0" && widget.list[widget.idTemp]['presionDiastolica'] != null)
                                Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  "${widget.list[widget.idTemp]['presionSistolica']}/${widget.list[widget.idTemp]['presionDiastolica']} mmHg",
                                  //'133/79 mmHG',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              if(widget.list[widget.idTemp]['presionSistolica'] == "0" || widget.list[widget.idTemp]['presionSistolica'] == null || widget.list[widget.idTemp]['presionDiastolica'] == "0" || widget.list[widget.idTemp]['presionDiastolica'] == null)
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                  child: Text(
                                    "NA",
                                    //'133/79 mmHG',
                                    style: FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Nivel de azúcar:',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              if(widget.list[widget.idTemp]['glucosa'] != "0" && widget.list[widget.idTemp]['glucosa'] != null)
                                Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  '${widget.list[widget.idTemp]['glucosa']} mg/dl',
                                 // '120 mg/dl',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              if(widget.list[widget.idTemp]['glucosa'] == "0" || widget.list[widget.idTemp]['glucosa'] == null)
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                  child: Text(
                                    "NA",
                                    // '120 mg/dl',
                                    style: FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Nivel de saturación de oxígeno:',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              if(widget.list[widget.idTemp]['saturacionOxigeno'] != "0" && widget.list[widget.idTemp]['saturacionOxigeno'] != null)
                                Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  "${widget.list[widget.idTemp]['saturacionOxigeno']} %",
                                  //'97%',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              if(widget.list[widget.idTemp]['saturacionOxigeno'] == "0" || widget.list[widget.idTemp]['saturacionOxigeno'] == null)
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                  child: Text(
                                    "NA",
                                    //'97%',
                                    style: FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x1F000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aplicaciones',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                          Divider(
                            height: 24,
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Vacunas/Inyecciones:',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  'Ver más',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            InyeccionesBitacoraV2Widget(usuario: widget.usuario),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.image_search,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Toma de medicamentos:',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Ver más',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MedicamentosBitacoraV2Widget(usuario: widget.usuario),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.image_search,
                                      color: Colors.black,
                                      size: 30,
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      if(widget.idTemp < (widget.list.length-1))
                      FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConsultaBitacoraWidget(list: widget.list,list2: widget.list2, idTemp: (widget.idTemp + 1),idCliente: widget.idCliente,procedimientos: widget.procedimientos, usuario: widget.usuario,),
                            ),
                          );
                        },
                        text: 'Anterior',
                        options: FFButtonOptions(
                          width: 90,
                          height: 40,
                          color: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).black600,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      ),
                      if((widget.idTemp+1) == widget.list.length)
                        FFButtonWidget(

                          text: 'Anterior',
                          options: FFButtonOptions(
                            width: 90,
                            height: 40,
                            color: Colors.black12,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).black600,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      if(widget.idTemp > 0)
                        FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConsultaBitacoraWidget(list: widget.list,list2: widget.list2, idTemp: (widget.idTemp - 1),idCliente: widget.idCliente,procedimientos: widget.procedimientos, usuario: widget.usuario,),
                              ),
                            );
                          },
                          text: 'Siguiente',
                          options: FFButtonOptions(
                            width: 90,
                            height: 40,
                            color: Colors.white,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).black600,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.black12,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      if(widget.idTemp <= 0)
                        FFButtonWidget(

                          text: 'Siguiente',
                          options: FFButtonOptions(
                            width: 90,
                            height: 40,
                            color: Colors.grey,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).black600,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            elevation: 3,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
  getActividad(act, i){
    if(act==0){
      return (listResponse2[actividades[i]]['icono']);
    }
    if(act==1){
      return (listResponse2[actividades[i]]['nombre']);
    }

  }
  getLabel(){
   // print(widget.list[widget.idTemp]);
    return (listResponse[int.parse(widget.list[widget.idTemp]['idEstadoAnimo'])-1]['nombre']);
  }
  getImagen(){
    switch(int.parse(widget.list[widget.idTemp]['idEstadoAnimo'])) {
      case 1: {
        return ("https://img.icons8.com/color/344/lol--v1.png");
      }
      break;

      case 2: {
        return ("https://img.icons8.com/color/344/smiling.png");
      }
      break;
      case 3: {
        return ("https://img.icons8.com/color/344/kiss.png");
      }
      break;

      case 4: {
        return ("https://img.icons8.com/color/344/boring--v1.png");;
      }
      break;
      case 5: {
        return ("https://img.icons8.com/color/344/sad--v1.png");
      }
      break;

      case 6: {
        return ("https://img.icons8.com/color/344/crying--v1.png");
      }
      break;
      case 7: {
        return ("https://img.icons8.com/color/344/surprised.png");
      }
      break;

      case 8: {
        return ("https://img.icons8.com/color/344/angry.png");
      }
      break;
      case 9: {
        return ("https://img.icons8.com/color/344/old-fashioned-family-photo.png");

      }
      break;

      case 10: {
        return ("https://img.icons8.com/color/344/bored.png");

      }
      break;
      case 11: {
        return ("https://img.icons8.com/color/344/sleeping--v1.png");

      }
      break;

      case 12: {
        return ("https://img.icons8.com/color/344/question--v1.png");

      }
      break;
      case 13: {
        return ("https://img.icons8.com/color/344/vomited--v1.png");

      }
      break;

      case 14: {
        return ("https://img.icons8.com/color/344/bandage.png");

      }
      break;

      default: {
        return ("");
      }
      break;
    }
    //if(int.parse(widget.list[widget.idTemp]['idEstadoAnimo']) == 8){
      //return ("https://img.icons8.com/color/344/angry.png");
    //}
  }
}
