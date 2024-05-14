import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/response_login_model.dart';

class RemoteDatasource {
  final _BASE_URL = "http://192.168.3.105";
  final _END_POINT = "/kendaraan/login.php";

  Future<http.Response> login({ResponseLogin? body}) async {
    try {
      final response = await http.post(
        Uri.parse("${_BASE_URL}${_END_POINT}"),
        body: jsonEncode(body!.toJson()),
      );
      log("awall ${response.body}");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
