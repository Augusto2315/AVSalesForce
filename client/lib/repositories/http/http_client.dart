import 'dart:async';
import 'package:http/http.dart' as http;

class HttpClient {
  static String baseUrl = 'https://localhost:44309/';

  static Future<http.Response> get(
      {required String route,
      Map<String, String>? parameters,
      String? routeUrl}) async {
    Uri urlEndPoint = Uri.http(baseUrl, route);
    if (parameters != null) {
      urlEndPoint = Uri.http(baseUrl, route, parameters);
    }
    return await http.get(
      urlEndPoint,
    );
  }
}
