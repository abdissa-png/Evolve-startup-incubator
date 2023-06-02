import 'dart:convert';

import 'package:evolve/admin/models/userModel.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  static const String _baseUrl = "http://localhost:3000/api/v1/auth";
  UserDataProvider();
  Future<List<UserModel>> searchUser(String authToken, String name) async {
    final response = await http.get(Uri.parse("$_baseUrl/search/user/$name"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $authToken'
        });
    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body);
      List<UserModel> UsersArray = [];
      for (var user in users) {
        if (user["role"]["role"] != "admin") {
          UsersArray.add(UserModel(
              name: user["name"],
              email: user["email"],
              role: user["role"]["role"]));
        }
      }
      return UsersArray;
    } else {
      return <UserModel>[];
    }
  }

  Future<void> removeUser(String authToken, String email, String role) async {
    final response = await http.delete(Uri.parse("$_baseUrl/remove/user"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $authToken'
        },
        body: jsonEncode(<String, String>{"email": email, "role": role}));
    if (response.statusCode != 204) {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }
}
