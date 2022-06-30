import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../utils/fire_auth.dart';

class BackService {

  List listResponse = [];
  List listResponse1 = [];
  dynamic colaborador;
  Map mapResponse = {};
  Future<dynamic> obtenerColaboradores(correoElectronico) async {
    print("corr: $correoElectronico");
    http.Response response;
    response = await http.post(
        Uri.parse('https://otconsultingback.comercioincoterms.com/colaborador/colaboradorByCorreo?correoElectronico=$correoElectronico'),
        headers: {
          "Token": FireAuth.token,
        });
    print('response: ${response.statusCode}');
    print(FireAuth.token);
    if (response.statusCode == 200) {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
        colaborador = mapResponse['data'];
        print("returnAPI: $colaborador");
        // for (var i = 0; i < listResponse.length; i++) {
        //   listResponse1
        //       .add(mapResponse['data'][i]['correoElectronico'].toString());
        //   print('listResponse: $listResponse1');
        // }
        // mapResponse = mapResponse['polizas'][0];
        print('YES $mapResponse');
    }
    return colaborador != null ? colaborador[0] : null;
  }

}