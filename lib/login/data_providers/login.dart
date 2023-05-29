import 'dart:convert';

import 'package:evolve/login/models/login_model.dart';

import '../models/auth_model.dart';
import 'package:http/http.dart' as http;

Future<AuthModel> login(LoginModel login) async {
  const String _baseUrl = "http://localhost:3000/api/v1/auth";
  final response = await http.post(Uri.parse('$_baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': login.email,
        'password': login.password,
      }));
  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    return AuthModel.fromJson(body);
  } else {
    throw Exception("Failed to login");
  }
}
