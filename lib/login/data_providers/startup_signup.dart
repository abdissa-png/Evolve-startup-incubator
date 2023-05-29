import 'dart:convert';

import 'package:evolve/login/models/create_startup_model.dart';

import '../models/auth_model.dart';
import 'package:http/http.dart' as http;

Future<AuthModel> startupSignup(Map<String, dynamic> startup) async {
  const String _baseUrl = "http://localhost:3000/api/v1/auth";
  final response = await http.post(Uri.parse('$_baseUrl/signup/startup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(startup));
  if (response.statusCode == 201) {
    dynamic body = jsonDecode(response.body);
    body = ['startup', body];
    return AuthModel.fromJson(body);
  } else {
    throw Exception("Failed to register Startup");
  }
}
