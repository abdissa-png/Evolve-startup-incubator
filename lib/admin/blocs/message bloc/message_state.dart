// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:evolve/admin/models/AnnouncementModel.dart';
import 'package:evolve/admin/models/complaintModel.dart';

class MessageState extends Equatable {
  @override
  List<Object> get props => [];
}

class MessageLoadingState extends MessageState {
  @override
  List<Object> get props => [];
}

class MessageLoadedState extends MessageState {
  final List<AnnouncementModel> announcements;
  MessageLoadedState({
    required this.announcements,
  });
  @override
  List<Object> get props => [announcements];
}

class MessageNotLoadedState extends MessageState {
  final Object error;
  MessageNotLoadedState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class ComplaintsLoadedState extends MessageState {
  final List<ComplaintModel> complaints;
  ComplaintsLoadedState({
    required this.complaints,
  });
  @override
  List<Object> get props => [complaints];
}

class ComplaintsNotLoadedState extends MessageState {
  final Object error;
  ComplaintsNotLoadedState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class ReplySentState extends MessageState {}

class ReplyNotSentState extends MessageState {
  final Object error;
  ReplyNotSentState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}
