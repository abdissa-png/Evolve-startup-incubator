// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:evolve/investor/models/submitcomplaintsmodel.dart';

class MessageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetNotificationEvent extends MessageEvent {
  final String authToken;
  GetNotificationEvent({
    required this.authToken,
  });
  @override
  List<Object> get props => [authToken];
}

class SendComplaintEvent extends MessageEvent {
  final String authToken;
  final SubmitcomplaintModel complaint;
  SendComplaintEvent({
    required this.authToken,
    required this.complaint,
  });
  @override
  List<Object> get props => [authToken, complaint];
}
