// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:evolve/admin/blocs/message%20bloc/blocs.dart';

import '../../repository/Message_Repository.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageRepository messageRepository;
  MessageBloc(this.messageRepository) : super(MessageLoadingState()) {
    on<GetPostsEvent>(
      (event, emit) async {
        try {
          final posts = await messageRepository.getPosts(event.authToken);
          emit(MessageLoadedState(announcements: posts));
        } catch (e) {
          emit(MessageNotLoadedState(error: e));
        }
      },
    );
    on<GetComplaintsEvent>(
      (event, emit) async {
        try {
          final complaints =
              await messageRepository.getComplaints(event.authToken);
          emit(ComplaintsLoadedState(complaints: complaints));
        } catch (e) {
          // emit(ComplaintsNotLoadedState(error: e));
        }
      },
    );
    on<ReplyToComplaintEvent>(
      (event, emit) async {
        emit(MessageLoadingState());
        var result = await messageRepository.replyToComplaint(
            event.authToken, event.email, event.message);
        if (result is bool) {
          emit(ReplySentState());
        } else {
          emit(ReplyNotSentState(error: result));
        }
      },
    );
    on<createPostEvent>(
      (event, emit) async {
        emit(MessageLoadingState());
        var result =
            await messageRepository.createPost(event.authToken, event.message);
        if (result is bool) {
          emit(ReplySentState());
        } else {
          emit(ReplyNotSentState(error: result));
        }
      },
    );
  }
}
