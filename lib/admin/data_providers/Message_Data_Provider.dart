import 'dart:convert';

import 'package:evolve/admin/models/complaintModel.dart';
import 'package:http/http.dart' as http;

import '../models/AnnouncementModel.dart';

class MessageDataProvider {
  static const String _baseUrl = "http://localhost:3000/api/v1/message";
  MessageDataProvider();
  Future<List<AnnouncementModel>> getPosts(String authToken) async {
    final response =
        await http.get(Uri.parse("$_baseUrl/posts"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authToken}'
    });
    if (response.statusCode == 200) {
      List<dynamic> messages = jsonDecode(response.body);
      List<AnnouncementModel> announcements = [];
      for (var message in messages) {
        announcements.add(AnnouncementModel(Message: message['message']));
      }
      return announcements;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }

  Future<bool> replyToPosts(
      String authToken, String email, String message) async {
    final response = await http.post(Uri.parse("$_baseUrl/reply/complaint"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authToken}'
        },
        body: jsonEncode(
            <String, String>{'receiver': email, 'message': message}));
    if (response.statusCode == 201) {
      return true;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }

  Future<bool> createPost(String authToken, String message) async {
    final response = await http.post(Uri.parse("$_baseUrl/announcement"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authToken}'
        },
        body: jsonEncode(<String, String>{"message": message}));
    if (response.statusCode == 200) {
      return true;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }

  Future<List<ComplaintModel>> getComplaints(String authToken) async {
    final response = await http
        .get(Uri.parse("$_baseUrl/complaint"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${authToken}'
    });
    if (response.statusCode == 200) {
      List<dynamic> complaints = jsonDecode(response.body);
      List<ComplaintModel> complaintsArray = [];

      for (var complaint in complaints) {
        complaintsArray.add(ComplaintModel(
            email: complaint['from'], message: complaint['message']));
      }
      return complaintsArray;
    } else {
      var res = jsonDecode(response.body);
      throw Exception(res['message']);
    }
  }
}
