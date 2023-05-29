import 'dart:convert';
import '../models/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthDataProvider {
  static const String _baseUrl = "http://localhost:3000/api/v1/auth";
  Future<AuthModel> login(Map<String, String> login) async {
    final response = await http.post(Uri.parse('$_baseUrl/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(login));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return AuthModel.fromJson(body);
    } else {
      throw Exception("Failed to login");
    }
  }

  Future<AuthModel> startupSignup(Map<String, dynamic> startup) async {
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

  Future<AuthModel> investorSignup(Map<String, dynamic> investor) async {
    final response = await http.post(Uri.parse('$_baseUrl/signup/investor'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(investor));
    if (response.statusCode == 201) {
      dynamic body = jsonDecode(response.body);
      body = ['investor', body];
      return AuthModel.fromJson(body);
    } else {
      throw Exception("Failed to register Investor");
    }
  }

  Future<bool> logout(String authToken) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $authToken'
      },
    );
    if (response.statusCode == 200) {
      return response.body as bool;
    } else {
      throw Exception("Failed to logout");
    }
  }
}
