// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../models/notificationModel.dart';

class MessageState extends Equatable {
  @override
  List<Object> get props => [];
}

class MessageLoading extends MessageState {}

class MessageStarted extends MessageState {}

class NotificationSuccess extends MessageState {
  final List<NotificationsModel> notifications;
  NotificationSuccess({
    required this.notifications,
  });
  @override
  List<Object> get props => [notifications];
}

class NotificationFailure extends MessageState {
  final Object error;
  NotificationFailure({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class ComplaintSuccess extends MessageState {}

class ComplaintFailure extends MessageState {
  final Object error;
  ComplaintFailure({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}
