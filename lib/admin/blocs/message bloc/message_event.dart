// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../models/userModel.dart';

class MessageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPostsEvent extends MessageEvent {
  final String authToken;
  GetPostsEvent({
    required this.authToken,
  });
  @override
  List<Object> get props => [authToken];
}

class GetComplaintsEvent extends MessageEvent {
  final String authToken;
  GetComplaintsEvent({
    required this.authToken,
  });
  @override
  List<Object> get props => [authToken];
}

class ReplyToComplaintEvent extends MessageEvent {
  final String authToken;
  final String message;
  final String email;
  ReplyToComplaintEvent({
    required this.authToken,
    required this.message,
    required this.email,
  });
  @override
  List<Object> get props => [authToken, email, message];
}

class createPostEvent extends MessageEvent {
  final String authToken;
  final String message;
  createPostEvent({
    required this.authToken,
    required this.message,
  });
  @override
  List<Object> get props => [authToken, message];
}
