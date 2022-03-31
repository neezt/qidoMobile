import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const kTitle = 'Provider';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                kTitle,
                style: TextStyle(
                  fontSize: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.fontSize,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
              leading: new IconButton(
                icon: new Icon(Icons.home, color: Colors.black),
                onPressed: () => null,
              ),
              title: const Text('Home'), onTap: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
          }),
          getLine(),
          ListTile(
              leading: new IconButton(
                icon: new Icon(Icons.person, color: Colors.black),
                onPressed: () => null,
              ),
              title: const Text('Perfil'), onTap: () {
            Navigator.pushReplacementNamed(context, '/profile');
          }),
          getLine(),
          ListTile(
              leading: new IconButton(
                icon: new Icon(Icons.exit_to_app, color: Colors.black),
                onPressed: () => null,
              ),title: const Text('Log  out'), onTap: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacementNamed(context, '/');
          }),
        ],
      ),
    );
  }

  Widget getLine() {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

}