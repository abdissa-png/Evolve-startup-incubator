import 'dart:convert';

import 'package:evolve/investor/models/pairedStartups.dart';
import 'package:evolve/investor/models/pairingModel.dart';
import 'package:http/http.dart' as http;

class PairingDataProvider {
  static const String _baseUrl = "http://localhost:3000/api/v1/pairing";
  Future<bool> requestStartup(String authToken, String startupEmail) async {
    final response = await http.post(Uri.parse("$_baseUrl/request/startup"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authToken}',
        },
        body: jsonEncode(<String, String>{"email": startupEmail}));
    if (response.statusCode == 201) {
      return true;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }

  Future<bool> updateResponse(String authToken, PairingModel pairing) async {
    final response = await http.patch(Uri.parse("$_baseUrl/response"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authToken}',
        },
        body: jsonEncode(<String, String>{
          "startupEmail": pairing.startupEmail,
          "investorEmail": pairing.investorEmail,
          "status": pairing.status
        }));
    if (response.statusCode == 200) {
      return true;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }

  Future<List<PairedStartup>> pairedStartups(String authToken) async {
    final response = await http
        .get(Uri.parse("$_baseUrl/pairedStartups"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authToken}',
    });
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> pairedStartups = jsonDecode(response.body);
      List<PairedStartup> startups = [];
      for (var startup in pairedStartups) {
        startups
            .add(PairedStartup(name: startup["name"], email: startup["email"]));
      }
      return startups;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }

  Future<List<PairingModel>> getResponses(String authToken) async {
    final response = await http
        .get(Uri.parse("$_baseUrl/responses"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authToken}',
    });
    if (response.statusCode == 200) {
      List<dynamic> messages = jsonDecode(response.body);
      List<PairingModel> responses = [];
      for (var message in messages) {
        responses.add(PairingModel(
            startupEmail: message['startup'],
            investorEmail: message['investor'],
            status: message['status']));
      }
      return responses;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }

  Future<List<PairingModel>> getRequests(String authToken) async {
    final response = await http
        .get(Uri.parse("$_baseUrl/requests"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authToken}',
    });
    if (response.statusCode == 200) {
      List<dynamic> messages = jsonDecode(response.body);
      List<PairingModel> requests = [];
      for (var message in messages) {
        requests.add(PairingModel(
            startupEmail: message['startup'],
            investorEmail: message['investor'],
            status: message['status']));
      }
      return requests;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }
}
