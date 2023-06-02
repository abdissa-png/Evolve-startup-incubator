// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evolve/investor/blocs/message/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/Message_Repository.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageRepository messageRepository;
  MessageBloc({
    required this.messageRepository,
  }) : super(MessageStarted()) {
    on<GetNotificationEvent>(
      (event, emit) async {
        emit(MessageLoading());
        try {
          final result =
              await messageRepository.getNotifications(event.authToken);
          emit(NotificationSuccess(notifications: result));
        } catch (e) {
          emit(NotificationFailure(error: e));
        }
      },
    );
    on<SendComplaintEvent>(
      (event, emit) async {
        emit(MessageLoading());
        try {
          final result = messageRepository.submitComplaint(
              event.authToken, event.complaint);
          emit(ComplaintSuccess());
        } catch (e) {
          emit(ComplaintFailure(error: e));
        }
      },
    );
  }
}
