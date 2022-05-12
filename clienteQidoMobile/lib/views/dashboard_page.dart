import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socios_qido/views/menu_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:socios_qido/views/usertoken.dart';

import '../logic/models/mysql.dart';

const kAppTitle = 'Bienvenido';
const kStateType = 'Provider';

class DashboardPage extends StatefulWidget {
  final User? user;
  const DashboardPage({required this.user});
  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  var db = new MySql();
  var nombre = '';

  // void _getName() {
  //   db.getConnection().then((conn) {
  //     String sql = 'select * from qido.colaborador;';
  //     conn.query(sql).then((results){
  //       for(var row in results) {
  //         setState(() {
  //           nombre = row[0];
  //         });
  //       }
  //     });
  //   });
  // }
  String text = 'Hola';
  late User? _currentUser = widget.user;

  String stringResponse = '';
  List listResponse = [];
  Map mapResponse = {};

  Future fetchData() async {
    http.Response response;
    response = await http.get(Uri.parse('http://localhost/public/colaborador/colaboradoresCompletos'), headers: {HttpHeaders.authorizationHeader: token,});
    if (response.statusCode==200) {
      setState(() {
        mapResponse = json.decode(response.body);
        // mapResponse = mapResponse['polizas'][0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    print('TokenDash: $_currentUser');
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      drawer: MenuPage(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Consumer(
          builder: (context, ui, child) {
            return RichText(
              text: TextSpan(
                text:  mapResponse.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _getName,
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.navigation),
      // ),
    );
  }
}