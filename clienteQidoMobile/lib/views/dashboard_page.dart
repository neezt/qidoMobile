import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socios_qido/views/menu_page.dart';
import 'package:socios_qido/main.dart';

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

  void _getName() {
    db.getConnection().then((conn) {
      String sql = 'select * from qido.colaborador;';
      conn.query(sql).then((results){
        for(var row in results) {
          setState(() {
            nombre = row[0];
          });
        }
      });
    });
  }
  String text = 'Hola';
  late User? _currentUser = widget.user;

  @override
  Widget build(BuildContext context) {
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
                text:  '$nombre',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getName,
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}