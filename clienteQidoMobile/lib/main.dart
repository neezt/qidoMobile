import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socios_qido/utils/push_nofitications.dart';
import 'package:socios_qido/views/bitacoraInfoWidget.dart';
import 'package:socios_qido/views/bitacoraWidget.dart';
import 'package:socios_qido/views/dashboard_page.dart';
import 'package:socios_qido/views/imagenesWidget.dart';
import 'package:socios_qido/views/infoPaciente1Widget.dart';
import 'package:socios_qido/views/listaPacientesWidget.dart';
import 'package:socios_qido/views/loginWidget.dart';
import 'package:socios_qido/views/login_page.dart';
import 'package:socios_qido/views/pacientesAsignados.dart';
import 'package:socios_qido/views/profile_page.dart';

// import 'views/login_page.dart';
import 'views/loginWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> _sub;
  final _navigatorKey = new GlobalKey<NavigatorState>();
  String notificationTitle = 'No Title';
  String notificationBody = 'No Body';
  String notificationData = 'No Data';

  @override
  void initState() {
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);

    super.initState();
    // _sub = FirebaseAuth.instance.userChanges().listen((event) {
    //   _navigatorKey.currentState!.pushReplacementNamed(
    //     event != null ? '/dashboard' : '/',
    //   );
    // });
  }

  _changeData(String msg) => setState(() => notificationData = msg);
  _changeBody(String msg) => setState(() => notificationBody = msg);
  _changeTitle(String msg) => setState(() => notificationTitle = msg);

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late  FirebaseAuth auth = FirebaseAuth.instance;
    late User? user = auth.currentUser;
    late int id = 0;
    late List list = [];
    late List procedimientos = [];
    late String idCliente = "";
    late int idTemp = 0;
    return MaterialApp(
      title: 'Qido Socio',
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      initialRoute:
      FirebaseAuth.instance.currentUser == null ? '/' : '/dashboard',
      routes: {
        '/dashboard': (context) => DashboardPage(user: user),
        '/profile': (context) => ProfilePage(user: user),
        '/pacientesAsignados': (context) => PacientesAsignadosPage(user: user),
        // '/loginWidget': (context) => LoginWidget(user: user),
        '/listaPacientesWidget': (context) => ListaPacientesWidget(user: user),
        '/infoPaciente1Widget': (context) => InfoPaciente1Widget(user: user, id: id, list: list, procedimientos: procedimientos),
        '/bitacoraWidget': (context) => BitacoraWidget(user: user, idCliente: idCliente),
        '/bitacoraInfoWidget': (context) => BitacoraInfoWidget(user: user, list: list, idTemp: idTemp,),
        '/imagenesWidget': (context) => ImagenesWidget(user: user),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 24.0,
            ),
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 46.0,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(fontSize: 18.0),
        ),
      ),
      home: LoginWidget(),
    );
  }
}