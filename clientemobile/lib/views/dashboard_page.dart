import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clientemobile/views/menu_page.dart';

const kAppTitle = 'Bienvenido';
const kStateType = 'Provider';

class DashboardPage extends StatefulWidget {
  final User? user;
  const DashboardPage({required this.user});
  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
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
                text:  _currentUser?.email,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            );
          },
        ),
      ),
    );
  }
}