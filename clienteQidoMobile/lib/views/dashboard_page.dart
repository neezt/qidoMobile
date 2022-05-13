// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:socios_qido/views/menu_page.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:socios_qido/views/usertoken.dart';

// import '../logic/models/mysql.dart';
// import '../utils/fire_auth.dart';

// const kAppTitle = 'Bienvenido';
// const kStateType = 'Provider';

// class DashboardPage extends StatefulWidget {
//   final User? user;
//   const DashboardPage({required this.user});
//   @override
//   _DashboardPage createState() => _DashboardPage();
// }

// class _DashboardPage extends State<DashboardPage> {

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   var db = new MySql();
//   var nombre = '';

//   // void _getName() {
//   //   db.getConnection().then((conn) {
//   //     String sql = 'select * from qido.colaborador;';
//   //     conn.query(sql).then((results){
//   //       for(var row in results) {
//   //         setState(() {
//   //           nombre = row[0];
//   //         });
//   //       }
//   //     });
//   //   });
//   // }
//   String text = 'Hola';
//   late User? _currentUser = widget.user;

//   String stringResponse = '';
//   List listResponse = [];
//   List listResponse1 = [];
//   Map mapResponse = {};
//   Map mapResponse1 = {};

//   Future fetchData() async {
//     http.Response response;
//     response = await http.post(Uri.parse('http://10.0.2.2/public/colaborador/colaboradores'), headers: {"Token": FireAuth.token,});
//     // print('response: $response');
//     if (response.statusCode==200) {
//       setState(() {
//         mapResponse = json.decode(response.body);
//         listResponse = mapResponse['data'];
//         for (var i = 0; i < listResponse.length; i++) {
//           listResponse1.add(mapResponse['data'][i]['correoElectronico'].toString());
//           print('listResponse: $listResponse1');
//         }
//         // mapResponse = mapResponse['polizas'][0];
//         print('YES $mapResponse');
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {

//     print('TokenDash: ' + FireAuth.token);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(kAppTitle),
//       ),
//       drawer: MenuPage(),
//       body: Container(
//         margin: EdgeInsets.all(10),
//         child: Consumer(
//           builder: (context, ui, child) {
//             return RichText(
//               text: TextSpan(
//                 text:  listResponse1.toString(),
//                 style: Theme.of(context).textTheme.bodyText1,
//               ),
//             );
//           },
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: _getName,
//       //   backgroundColor: Colors.green,
//       //   child: const Icon(Icons.navigation),
//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socios_qido/views/menu_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:socios_qido/views/usertoken.dart';

import '../logic/models/mysql.dart';
import '../utils/fire_auth.dart';
import './loginWidget.dart';
import './usertoken.dart';
import 'listaPacientesWidget.dart';

class DashboardPage extends StatefulWidget {
  final User? user;
  const DashboardPage({required this.user});
  @override
  _DashboardPage createState() => _DashboardPage();
}

// class DashboardWidget extends StatefulWidget {
//   @override
//   _DashboardWidgetState createState() => _DashboardWidgetState();
// }

class _DashboardPage extends State<DashboardPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late User? _currentUser = widget.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF00D8D6),
        automaticallyImplyLeading: false,
        title: Text(
          'Inicio',
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF39D2C0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bienvenido',
                      style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        email,
                        style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListaPacientesWidget(user: _currentUser,),
                              ),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xE0E3E7),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.sick,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Text(
                                    'Lista de Pacientes',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
