import 'package:firebase_auth/firebase_auth.dart';
import 'package:qido_colaboradores/bitacoravariables.dart';
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

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  bool passwordVisibility;

  String stringResponse = '';
  List listResponse = [];
  List listResponse1 = [];
  Map mapResponse = {};
  Map mapResponse1 = {};
  Future fetchData() async {
    http.Response response;
    response = await http.post(
        Uri.parse('https://otconsultingback.comercioincoterms.com/colaborador/colaboradores'),
        headers: {
          "Token": FireAuth.token,
        });
    // print('response: $response');
    print(FireAuth.token);
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
        for (var i = 0; i < listResponse.length; i++) {
          listResponse1
              .add(mapResponse['data'][i]['correoElectronico'].toString());
          print('listResponse: $listResponse1');
        }
        // mapResponse = mapResponse['polizas'][0];
        print('YES $mapResponse');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    passwordVisibility = false;
  }

  idController() {
    for (var i = 0; i < listResponse.length; i++) {
      if (listResponse[i]['correoElectronico'].toString() ==
          _emailTextController.text) {
        idColaborador = listResponse[i]['idColaborador'];
        idColaboradorBitacora = int.parse(idColaborador);
        break;
      }
      print('idColaborador: $idColaborador');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      resizeToAvoidBottomInset: false, // configuracion de teclado
      body: SingleChildScrollView(
        //width: double.infinity,
        //height: double.infinity,
        //decoration: BoxDecoration(
         // color: Color(0xFFEEEEEE),
         // image: DecorationImage(
        //    fit: BoxFit.cover,
         //   image: Image.asset(
          //    'assets/images/sniff_hero@2x.jpg',
         //   ).image,
       //   ),
     //   ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/1140-geriatric-care-manager-nurse.jpg',
              width: 400,
              height: 400,
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/final-C-1-oqtordmw9wbz4gl9m92smr3inmbur0l8gwhukog03u.webp',
              width: 100,
              height: 100,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 44),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Accede a tu cuenta o',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'crea una nueva',
                              options: FFButtonOptions(
                                width: 125,
                                height: 28,
                                color: Color(0x00FFFFFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF00D8D6),
                                      fontSize: 14,
                                    ),
                                elevation: 0,
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: TextFormField(
                                    controller: _emailTextController,
                                    focusNode: _focusEmail,
                                    validator: (value) =>
                                        Validator.validateEmail(
                                      email: value,
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Usuario',
                                      labelStyle: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      hintStyle: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF0F1113),
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
                          padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _passwordTextController,
                                  focusNode: _focusPassword,
                                  obscureText: !passwordVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Contraseña',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    hintStyle: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 24, 24, 24),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => passwordVisibility =
                                            !passwordVisibility,
                                      ),
                                      child: Icon(
                                        passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF95A1AC),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF0F1113),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  print('Button-ForgotPassword pressed ...');
                                },
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF00D8D6),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  fixedSize: Size(182, 30),
                                  elevation: 0,
                                  primary: Colors.transparent,
                                  onPrimary: Color(0xFF00D8D6),
                                ),
                                child: Text('¿Olvide la contraseña?'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  _focusEmail.unfocus();
                                  _focusPassword.unfocus();

                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      _isProcessing = true;
                                    });

                                    User user =
                                        await FireAuth.signInUsingEmailPassword(
                                      email: _emailTextController.text,
                                      password: _passwordTextController.text,
                                    );

                                    setState(() {
                                      _isProcessing = false;
                                    });

                                    if (user != null) {
                                      await fetchData();

                                      if (listResponse1.contains(
                                          _emailTextController.text)) {
                                        email = _emailTextController.text;
                                        await idController();
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ListaPacientesV2Widget(
                                              user: user,
                                            ),
                                          ),
                                        );
                                      }

                                      //  Navigator.of(context)
                                      //      .pushReplacement(
                                      //    MaterialPageRoute(
                                      //      builder: (context) =>
                                      //          ListaPacientesV2Widget(user: user),
                                      //    ),
                                      //  );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  fixedSize: Size(150, 50),
                                  primary: Color(0xFF0F1113),
                                  // onPrimary: Color(0xFF0F1113),
                                  elevation: 3,
                                  onSurface: Colors.transparent,
                                ),
                                child: Text('Iniciar Sesión'),
                                // text: 'Iniciar Sesión',
                                // options: FFButtonOptions(
                                //   borderSide: BorderSide(
                                //     color: Colors.transparent,
                                //     width: 1,
                                //   ),
                                //   borderRadius: 8,
                                // ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                              'Ver: 1.0.1',
                              style: FlutterFlowTheme.of(context).bodyText1,
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
          ],
        ),
      ),
    );
  }
}
