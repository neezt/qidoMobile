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

class LoginWidget extends StatefulWidget {
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

  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String stringResponse = '';
  List listResponse = [];
  Map mapResponse = {};

  Future fetchData() async {
    http.Response response;
    response = await http.get(Uri.parse('http://localhost/public/cotizador/datosCotizador'));
    if (response.statusCode==200) {
      setState(() {
        mapResponse = json.decode(response.body);
        mapResponse = mapResponse['polizas'][0];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    // emailAddressController = TextEditingController(text: 'usuario.cliente');
    // passwordController = TextEditingController(text: '123456789qwerty');
    passwordVisibility = false;
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => DashboardPage(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF8F8F8),
        resizeToAvoidBottomInset : false, // configuracion de teclado
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // return Padding(
              //   padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                return SingleChildScrollView(
                  reverse: true,
                  // padding: EdgeInsets.all(32),
                  child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 45),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network('https://i0.wp.com/qido.mx/wp-content/uploads/elementor/thumbs/final-C-1-oqtordmw9wbz4gl9m92smr3inmbur0l8gwhukog03u.png?w=525&ssl=1',
                              width: 246,
                                height: 95,
                                fit: BoxFit.cover,),
                              // Image.asset(
                              //   'assets/images/final-C-1-oqtordmw9wbz4gl9m92smr3inmbur0l8gwhukog03u.webp',
                              //   width: 246,
                              //   height: 95,
                              //   fit: BoxFit.cover,
                              // ),
                            ],
                          ),
                        ),
                    Form(
                          key: _formKey,
                            child: Column(
                                children: <Widget>[
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                                          validator: (value) => Validator.validateEmail(
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
                                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
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
                                      // text: '¿Olvide la contraseña?',
                                      // options: FFButtonOptions(
                                      //   // color: Color(0x00FFFFFF),
                                      //   elevation: 0,
                                      //   borderSide: BorderSide(
                                      //     color: Colors.transparent,
                                      //     width: 1,
                                      //   ),
                                      //   borderRadius: 0,
                                      // ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                          _focusEmail.unfocus();
                                          _focusPassword.unfocus();

                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              _isProcessing = true;
                                            });

                                            User? user = await FireAuth
                                                .signInUsingEmailPassword(
                                              email: _emailTextController.text,
                                              password:
                                              _passwordTextController.text,
                                            );

                                            setState(() {
                                              _isProcessing = false;
                                            });

                                            if (user != null) {
                                              user.getIdToken().then((String token1) {
                                                token = token1;
                                                print('Token: $token');
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DashboardPage(user: user),
                                                ),
                                              );
                                              });
                                              // print('Token: $token');
                                              // Navigator.of(context)
                                              //     .pushReplacement(
                                              //   MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         DashboardPage(user: user),
                                              //   ),
                                              // );
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
                                ],
                            ),
                      ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
                );
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(bottom: 24.0),
                //       child: Text(
                //         'Login',
                //         style: Theme.of(context).textTheme.headline1,
                //       ),
                //     ),
                //     Form(
                //       key: _formKey,
                //       child: Column(
                //         children: <Widget>[
                //           TextFormField(
                //             controller: _emailTextController,
                //             focusNode: _focusEmail,
                //             validator: (value) => Validator.validateEmail(
                //               email: value,
                //             ),
                //             decoration: InputDecoration(
                //               hintText: "Email",
                //               errorBorder: UnderlineInputBorder(
                //                 borderRadius: BorderRadius.circular(6.0),
                //                 borderSide: BorderSide(
                //                   color: Colors.red,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           SizedBox(height: 8.0),
                //           TextFormField(
                //             controller: _passwordTextController,
                //             focusNode: _focusPassword,
                //             obscureText: true,
                //             validator: (value) => Validator.validatePassword(
                //               password: value,
                //             ),
                //             decoration: InputDecoration(
                //               hintText: "Password",
                //               errorBorder: UnderlineInputBorder(
                //                 borderRadius: BorderRadius.circular(6.0),
                //                 borderSide: BorderSide(
                //                   color: Colors.red,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           SizedBox(height: 24.0),
                //           _isProcessing
                //               ? CircularProgressIndicator()
                //               : Row(
                //             mainAxisAlignment:
                //             MainAxisAlignment.spaceBetween,
                //             children: [
                //               Expanded(
                //                 child: ElevatedButton(
                //                   onPressed: () async {
                //                     _focusEmail.unfocus();
                //                     _focusPassword.unfocus();

                //                     if (_formKey.currentState!
                //                         .validate()) {
                //                       setState(() {
                //                         _isProcessing = true;
                //                       });

                //                       User? user = await FireAuth
                //                           .signInUsingEmailPassword(
                //                         email: _emailTextController.text,
                //                         password:
                //                         _passwordTextController.text,
                //                       );

                //                       setState(() {
                //                         _isProcessing = false;
                //                       });

                //                       if (user != null) {
                //                         Navigator.of(context)
                //                             .pushReplacement(
                //                           MaterialPageRoute(
                //                             builder: (context) =>
                //                                 ProfilePage(user: user),
                //                           ),
                //                         );
                //                       }
                //                     }
                //                   },
                //                   child: Text(
                //                     'Sign In',
                //                     style: TextStyle(color: Colors.white),
                //                   ),
                //                 ),
                //               ),
                //               SizedBox(width: 24.0),
                //               Expanded(
                //                 child: ElevatedButton(
                //                   onPressed: () {
                //                     Navigator.of(context).push(
                //                       MaterialPageRoute(
                //                         builder: (context) =>
                //                             RegisterPage(),
                //                       ),
                //                     );
                //                   },
                //                   child: Text(
                //                     'Register',
                //                     style: TextStyle(color: Colors.white),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           )
                //         ],
                //       ),
                //     )
                //   ],
                // ),
              // );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}