import 'package:qido_colaboradores/alimentacion_bitacora/alimentacion_bitacora_widget.dart';

import '../actividades_bitacora/actividades_bitacora_widget.dart';
import '../backend/firebase_storage/storage.dart';
import '../bitacora_completada/bitacora_completada_widget.dart';
import '../desayuno_bitacora/desayuno_bitacora_widget.dart';
import '../estado_de_animo_bitacora/estado_de_animo_bitacora_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../inyecciones_bitacora/inyecciones_bitacora_widget.dart';
import '../model/usuario.dart';
import '../pagina_perfil_v3/pagina_perfil_v3_widget.dart';
import '../temperatura_bitacora/temperatura_bitacora_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../bitacoravariables.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_animations.dart';

import '../usertoken.dart';

import 'package:qido_colaboradores/utils/fire_auth.dart';
import 'package:qido_colaboradores/utils/validator.dart';

import '../lista_pacientes_v2/lista_pacientes_v2_widget.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistroBitacoraV2Widget extends StatefulWidget {
  const RegistroBitacoraV2Widget({Key key, this.idPaciente, this.nombrePaciente, this.idTemp, this.listTemp, this.usuario}) : super(key: key);

    final int idTemp;
    final List listTemp;
    final String idPaciente;
    final String nombrePaciente;
    final Usuario usuario;
  @override
  _RegistroBitacoraV2WidgetState createState() =>
      _RegistroBitacoraV2WidgetState();
}

class _RegistroBitacoraV2WidgetState extends State<RegistroBitacoraV2Widget> {

  Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "token": token,
  };

  

Future grabarBitacora() async {
  Map data = {
    'desayunoBitacora': desayunoBitacora,
    'comidaBitacora': comidaBitacora,
    'cenaBitacora': cenaBitacora,
    'estadoAnimoBitacora': estadoAnimoBitacora,
    'temperaturaBitacora': temperaturaBitacora,
    'presionSistolicaBitacora': presionSistolicaBitacora,
    'presionDiastolicaBitacora': presionDiastolicaBitacora,
    'glucosaBitacora': glucosaBitacora,
    'oxigenoBitacora': oxigenoBitacora,
    'idServicioBitacora': idServicioBitacora,
    'idColaboradorBitacora': widget.usuario.id,
    'actividadesBitacora': actividadesBitacora,
  };
  print(data);

  var body = json.encode(data);

    http.Response response;
    response = await http.post(Uri.parse('https://otconsultingback.comercioincoterms.com/bitacora/create'), headers: {"Token": widget.usuario.token,}, body: body);
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
    // fetchData1();
  }

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
    response = await http.post(Uri.parse('https://otconsultingback.comercioincoterms.com/bitacora/lastBitacora?idServicio=${widget.listTemp[widget.idTemp]['idServicio']}'), headers: {"Token": widget.usuario.token,});
    print(response.statusCode);
    if (response.statusCode==200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];

      });
    }
  }

      @override
  void initState() {
    super.initState();
    fetchData();
  }


  String uploadedFileUrl = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
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
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: PaginaPerfilV3Widget(id: widget.idTemp, list: widget.listTemp, usuario: widget.usuario,),
                          ),
                        );
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nueva Bit??cora',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Nombre: ${widget.nombrePaciente} - ID: ${widget.idPaciente}',
                              // 'Nombre: Rosario Armenta - ID: 24',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xB4FFFFFF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          if (listResponse.length > 0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '??ltima bit??cora: ${listResponse[0]["fechaCaptura"]}',
                              // 'Nombre: Rosario Armenta - ID: 24',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xB4FFFFFF),
                                    fontSize: 14,
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
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DesayunoBitacoraWidget(idPaciente1: widget.idPaciente, nombrePaciente1: widget.nombrePaciente, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlimentacionBitacoraWidget(idPaciente1: widget.idPaciente, nombrePaciente1: widget.nombrePaciente, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario),
                        ),
                      );
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 4, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Alimentaci??n',
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                buttonSize: 46,
                                icon: Icon(
                                  Icons.chevron_right_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActividadesBitacoraWidget(idPaciente1: widget.idPaciente, nombrePaciente1: widget.nombrePaciente, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 4, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cuidados / Actividades',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              buttonSize: 46,
                              icon: Icon(
                                Icons.chevron_right_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EstadoDeAnimoBitacoraWidget(idPaciente1: widget.idPaciente, nombrePaciente1: widget.nombrePaciente, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 4, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Estado de ??nimo',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              buttonSize: 46,
                              icon: Icon(
                                Icons.chevron_right_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TemperaturaBitacoraWidget(idPaciente1: widget.idPaciente, nombrePaciente1: widget.nombrePaciente, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario),
                      ),
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 4, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mediciones',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 16,
                                  ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              buttonSize: 46,
                              icon: Icon(
                                Icons.chevron_right_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InyeccionesBitacoraWidget(idPaciente1: widget.idPaciente, nombrePaciente1: widget.nombrePaciente, idTemp: widget.idTemp, listTemp: widget.listTemp, usuario: widget.usuario),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 4, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Aplicaciones',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 16,
                                  ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              buttonSize: 46,
                              icon: Icon(
                                Icons.chevron_right_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: InkWell(
              onTap: () async {
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  allowPhoto: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  showUploadMessage(
                    context,
                    'Uploading file...',
                    showLoading: true,
                  );
                  final downloadUrls = (await Future.wait(selectedMedia.map(
                          (m) async =>
                              await uploadData(m.storagePath, m.bytes))))
                      .where((u) => u != null)
                      .toList();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (downloadUrls != null &&
                      downloadUrls.length == selectedMedia.length) {
                    setState(() => uploadedFileUrl = downloadUrls.first);
                    showUploadMessage(
                      context,
                      'Success!',
                    );
                  } else {
                    showUploadMessage(
                      context,
                      'Failed to upload media',
                    );
                    return;
                  }
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 4, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fotos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 16,
                                  ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              buttonSize: 46,
                              icon: Icon(
                                Icons.chevron_right_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 40),
            child: FFButtonWidget(
              onPressed: () async {
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Confirmaci??n'),
                          content: Text(
                              '??Est?? seguro que quiere grabar esta bit??cora?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: Text('Confirmar'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  await grabarBitacora();
                  desayunoBitacora = 0;
                  comidaBitacora = 0;
                  cenaBitacora = 0;
                  estadoAnimoBitacora = null;
                  temperaturaBitacora = 0.0;
                  presionSistolicaBitacora = 0;
                  presionDiastolicaBitacora = 0;
                  glucosaBitacora = 0;
                  oxigenoBitacora = 0;
                  idServicioBitacora = 0;
                  actividadesBitacora = [];
                  
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BitacoraCompletadaWidget(usuario: widget.usuario),
                    ),
                  );
                } else {
                  return;
                }
              },
              text: 'Grabar Bit??cora',
              options: FFButtonOptions(
                width: 180,
                height: 50,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).subtitle2,
                elevation: 3,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  width: 1,
                ),
                borderRadius: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
