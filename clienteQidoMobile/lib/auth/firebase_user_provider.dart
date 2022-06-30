import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class QidoColaboradoresFirebaseUser {
  QidoColaboradoresFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

QidoColaboradoresFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<QidoColaboradoresFirebaseUser> qidoColaboradoresFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<QidoColaboradoresFirebaseUser>(
            (user) => currentUser = QidoColaboradoresFirebaseUser(user));
