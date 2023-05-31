import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthDataProvider {
  final secureStorage = const FlutterSecureStorage();
  static const String _baseUrl = "http://localhost:3000/api/v1/auth";

  AuthDataProvider();

  Future<void> persistToken(
      String role, String authToken, String refreshToken) async {
    await secureStorage.write(key: 'role', value: role);
    await secureStorage.write(key: 'authToken', value: authToken);
    await secureStorage.write(key: 'refreshToken', value: refreshToken);
  }

  Future<void> deleteToken() async {
    await secureStorage.delete(key: 'role');
    await secureStorage.delete(key: 'authToken');
    await secureStorage.delete(key: 'refreshToken');
  }

  Future<AuthModel> fetchToken() async {
    String? role = await secureStorage.read(key: "role");
    String? authToken = await secureStorage.read(key: 'authToken');
    String? refreshToken = await secureStorage.read(key: 'refreshToken');

    if (role == null || authToken == null || refreshToken == null) {
      throw Exception('Token not found');
    }

    return AuthModel(
        role: role, authToken: authToken, refreshToken: refreshToken);
  }

  Future<AuthModel> refreshAndFetchToken() async {
    AuthModel token = await fetchToken();
    // Use the token provider to obtain a fresh token
    final response = await http
        .post(Uri.parse('$_baseUrl/refresh'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${token.refreshToken}'
    });
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      persistToken(body[0], body[1]['access_token'], body[1]['refresh_token']);
      return AuthModel.fromJson(body);
    } else {
      throw Exception("Couldnot update tokens");
    }
  }

  Future<AuthModel> login(Map<String, String> login) async {
      final response = await http
          .post(Uri.parse('$_baseUrl/login'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(login));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        persistToken(
            body[0], body[1]['access_token'], body[1]['refresh_token']);
        return AuthModel.fromJson(body);
      } else {
        print(response.body);
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
      persistToken(body[0], body[1]['access_token'], body[1]['refresh_token']);
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
      persistToken(body[0], body[1]['access_token'], body[1]['refresh_token']);
      return AuthModel.fromJson(body);
    } else {
      throw Exception("Failed to register Investor");
    }
  }

  Future<bool> logout() async {
    AuthModel tokens = await fetchToken();
    final response = await http.post(
      Uri.parse('$_baseUrl/logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${tokens.authToken}'
      },
    );
    if (response.statusCode == 200) {
      return response.body as bool;
    } else {
      throw Exception("Failed to logout");
    }
  }
}
