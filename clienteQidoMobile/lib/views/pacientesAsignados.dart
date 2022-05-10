// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socios_qido/views/menu_page.dart';
import 'package:socios_qido/main.dart';

import '../logic/models/mysql.dart';


class PacientesAsignadosPage extends StatefulWidget {
  // const PacientesAsignadosPage({Key key}) : super(key: key);
  final User? user;
  const PacientesAsignadosPage({required this.user});

  @override
  _PacientesAsignadosPageState createState() => _PacientesAsignadosPageState();
}

class _PacientesAsignadosPageState extends State<PacientesAsignadosPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
   late User? _currentUser = widget.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
