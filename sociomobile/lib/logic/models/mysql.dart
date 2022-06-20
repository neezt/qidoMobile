import 'package:mysql1/mysql1.dart';

class MySql {
  static String host = 'https://otconsultingback.comercioincoterms.com',
                user = 'root',
                password = '',
                db = 'qido';
  static int port = 3306;

  MySql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: null,
      db: db
    );
    return await MySqlConnection.connect(settings);
  }
}