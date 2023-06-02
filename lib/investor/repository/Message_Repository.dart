import '../models/submitcomplaintsmodel.dart';

import '../data_providers/Message_Data_Provider.dart';
import 'package:evolve/investor/models/notificationModel.dart';

class MessageRepository {
  final MessageDataProvider messageDataProvider;
  MessageRepository({required this.messageDataProvider});
  Future<List<NotificationsModel>> getNotifications(String authToken) async {
    return messageDataProvider.getNotifications(authToken);
  }

  Future<bool> submitComplaint(
      String authToken, SubmitcomplaintModel complaint) async {
    return messageDataProvider.submitComplaint(authToken, complaint);
  }
}
