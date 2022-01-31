import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:salesforce/models/config_acessos/grupo.dart';

import 'http/http_interceptor.dart';

class GrupoRepositories {
  static String baseUrl = 'localhost:44309';

  Future<List<Grupo>> getGrupos() async {
    List<Grupo> grupos = [];

    Uri url = Uri.https(baseUrl, "/Grupo");

    Client client =
        InterceptedClient.build(interceptors: [LoggingInterceptor()]);

    final Response response =
        await client.get(url, headers: {'Content-type': 'Application/json'});
    if (response.statusCode == 200) {
      var decodedJson = (json.decode(response.body) as List<dynamic>);
      for (var item in decodedJson) {
        grupos.add(Grupo.fromJson(Map<String, dynamic>.from(item)));
      }
    }

    return grupos;
  }

  Future<Grupo> saveGrupo(Grupo grupo) async {
    Uri url = Uri.https(baseUrl, "/Grupo");
    Client client =
        InterceptedClient.build(interceptors: [LoggingInterceptor()]);

    final Response response = await client.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(grupo.toJson()),
    );
    if (response.statusCode == 200) {
      return grupo;
    }
    return grupo;
  }

  Future<Grupo> delete(Grupo grupo) async {
    Uri url = Uri.https(baseUrl, "/Grupo");
    Client client =
        InterceptedClient.build(interceptors: [LoggingInterceptor()]);

    final Response response = await client.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(grupo.toJson()),
    );
    if (response.statusCode == 200) {
      return grupo;
    }
    return grupo;
  }
}
