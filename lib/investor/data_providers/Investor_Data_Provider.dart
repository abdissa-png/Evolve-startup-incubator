import 'dart:convert';

import '../models/startupSearchModel.dart';

import '../models/investorprofileModel.dart';
import 'package:http/http.dart' as http;

class InvestorDataProvider {
  static const String _baseUrl = "http://localhost:3000/api/v1/investor";
  static const String _authUrl = "http://localhost:300/api/v1/auth";
  static const String _startupSearchUrl =
      "http://localhost:300/api/v1/startup/search";

  Future<InvestorModel> getProfile(String authToken) async {
    final response = await http
        .get(Uri.parse("$_baseUrl/profile"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authToken}'
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> profile = jsonDecode(response.body);
      List<Map<String, dynamic>> interestsArr = profile['investmentIntersts'];
      List<String> interests = [];
      List<Map<String, dynamic>> stageArr = profile['investmentStage'];
      List<String> stages = [];
      for (var interest in interestsArr) {
        interests.add(interest["assisstance"]);
      }
      for (var stage in stageArr) {
        stages.add(stage["stage"]);
      }
      InvestorModel investor = InvestorModel(
          name: profile["name"],
          phoneNumber: profile["phoneNumber"],
          description: profile["description"],
          interest: interests,
          investmentStage: stages);
      return investor;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }

  Future<List<StartupModel>> searchStartup(
      String authToken, String name) async {
    final response = await http
        .get(Uri.parse("$_startupSearchUrl/${name}"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authToken}'
    });
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> profiles = jsonDecode(response.body);
      List<StartupModel> profilesArr = [];
      for (var profile in profiles) {
        List<String> assistancesArr = [];
        List<Map<String, dynamic>> assistances = profile['requiredAssistance'];
        String stage = profile["industryStage"]["stage"];
        for (var assistance in assistances) {
          assistancesArr.add(assistance["assistance"]);
        }
        profilesArr.add(StartupModel(
            email: profile["email"],
            companyName: profile["name"],
            phoneNumber: profile["phoneNumber"],
            address: profile["address"],
            founders: profile["founders"],
            description: profile["description"],
            assistanceRequired: assistancesArr,
            companyStage: stage));
      }
      return profilesArr;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }

  Future<bool> changePassword(
      String authToken, String oldPassword, String newPassword) async {
    final response = await http.patch(Uri.parse("$_authUrl/changePass"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authToken}',
        },
        body: jsonEncode(<String, String>{
          "old_password": oldPassword,
          "new_password": newPassword,
        }));
    if (response.statusCode == 200) {
      return true;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }

  Future<bool> deleteAccount(String authToken) async {
    final response = await http
        .delete(Uri.parse("$_authUrl/deleteAccount"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authToken}',
    });
    if (response.statusCode == 204) {
      return true;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }

  Future<bool> updateProfile(String authToken, InvestorModel investor) async {
    final response = await http.patch(Uri.parse("$_authUrl/changePass"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authToken}',
        },
        body: jsonEncode(investor.toJson()));
    if (response.statusCode == 200) {
      return true;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }
}
