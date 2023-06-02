import 'dart:convert';

import '../models/submitcomplaintsmodel.dart';

import '../models/notificationModel.dart';
import 'package:http/http.dart' as http;

class MessageDataProvider {
  static const String _baseUrl = "http://localhost:3000/api/v1/message";
  Future<List<NotificationsModel>> getNotifications(String authToken) async {
    final response = await http
        .get(Uri.parse("$_baseUrl/announcement"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authToken}'
    });
    if (response.statusCode == 200) {
      List<dynamic> messages = jsonDecode(response.body);
      List<NotificationsModel> notifications = [];
      for (var message in messages) {
        notifications.add(NotificationsModel(
            from: message['from'],
            to: message['to'],
            message: message['message']));
      }
      return notifications;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }

  Future<bool> submitComplaint(
      String authToken, SubmitcomplaintModel complaint) async {
    final response = await http.post(Uri.parse("$_baseUrl/submit/complaint"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authToken}',
        },
        body: jsonEncode(<String, String>{"message": complaint.complaint}));
    if (response.statusCode == 200) {
      return true;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }
}
