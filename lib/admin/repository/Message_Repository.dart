import 'package:evolve/admin/data_providers/Message_Data_Provider.dart';
import 'package:evolve/admin/models/AnnouncementModel.dart';
import 'package:evolve/admin/models/complaintModel.dart';

class MessageRepository {
  final MessageDataProvider msgDataProvider;

  MessageRepository(this.msgDataProvider);

  Future<bool> createPost(String authToken, String message) async {
    return msgDataProvider.createPost(authToken, message);
  }

  Future<bool> replyToComplaint(authToken, email, message) async {
    return msgDataProvider.replyToPosts(authToken, email, message);
  }

  Future<List<AnnouncementModel>> getPosts(String authToken) async {
    return msgDataProvider.getPosts(authToken);
  }

  Future<List<ComplaintModel>> getComplaints(String authToken) async {
    return msgDataProvider.getComplaints(authToken);
  }
}
