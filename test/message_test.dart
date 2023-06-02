import 'package:evolve/admin/blocs/message%20bloc/message_bloc.dart';
import 'package:evolve/admin/blocs/message%20bloc/message_event.dart';
import 'package:evolve/admin/blocs/message%20bloc/message_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:evolve/admin/repository/Message_Repository.dart';
import 'package:evolve/admin/models/AnnouncementModel.dart';
import 'package:evolve/admin/models/complaintModel.dart';

// Create a mock message repository
class MockMessageRepository extends Mock implements MessageRepository {}

void main() {
  group('MessageBloc', () {
    late MessageRepository messageRepository;
    late MessageBloc messageBloc;

    setUp(() {
      // Initialize the mock repository and bloc
      messageRepository = MockMessageRepository();
      messageBloc = MessageBloc(messageRepository);
    });

    tearDown(() {
      // Close the bloc after each test
      messageBloc.close();
    });

    const authToken = 'testAuthToken';
    final posts = [
      AnnouncementModel(Message: 'Test announcement 1'),
      AnnouncementModel(Message: 'Test announcement 2'),
    ];

    final complaints = [
      ComplaintModel(email: 'testEmail1', message: 'Test complaint 1'),
      ComplaintModel(email: 'testEmail2', message: 'Test complaint 2'),
    ];
// this test works

    test('initial state is MessageLoadingState', () {
      expect(messageBloc.state, MessageLoadingState());
    });
    blocTest<MessageBloc, MessageState>(
      'emits MessageLoadedState when GetPostsEvent is added',
      build: () {
        // Return the expected result from the mock repository
        when(() => messageRepository.getPosts(authToken))
            .thenAnswer((_) async => posts);
        return messageBloc;
      },
      act: (bloc) =>
          bloc.add(GetPostsEvent(authToken: authToken) as MessageEvent),
      expect: () => [MessageLoadedState(announcements: posts)],
    );
    //  getpostEvent fail

    blocTest<MessageBloc, MessageState>(
      'emits MessageNotLoadedState when GetPostsEvent is added',
      build: () {
        // Return the expected result from the mock repository
        when(() => messageRepository.getPosts(authToken)).thenThrow('error');
        return messageBloc;
      },
      act: (bloc) =>
          bloc.add(GetPostsEvent(authToken: authToken) as MessageEvent),
      expect: () => [MessageNotLoadedState(error: 'error')],
    );
    blocTest<MessageBloc, MessageState>(
      'emits ComplaintLoadedState when GetComplaintEvent successes',
      build: () {
        // Throw an error from the mock repository
        when(() => messageRepository.getComplaints(authToken))
            .thenAnswer((_) async => complaints);
        return messageBloc;
      },
      act: (bloc) =>
          bloc.add(GetComplaintsEvent(authToken: authToken) as MessageEvent),
      expect: () => [ComplaintsLoadedState(complaints: complaints)],
    );

    // blocTest<MessageBloc, MessageState>(
    //   'emits ReplySentState when ReplyToComplaintEvent is added successfully',
    //   build: () => messageBloc,
    //   act: (bloc) => bloc.add(ReplyToComplaintEvent(
    //       authToken: authToken,
    //       email: 'testEmail',
    //       message: 'testMessage') as MessageEvent),
    //   expect: () => [MessageLoadingState(), ReplySentState()],
    //   // ReplySentState() is not being emmited
    // );



    // blocTest<MessageBloc, MessageState>(
    //   'emits ReplyNotSentState when createPostEvent fails',
    //   build: () {
    //     // Throw an error from the mock repository
    //     when(() => messageRepository.createPost(authToken, 'testMessage'))
    //         .thenThrow('error');
    //     return messageBloc;
    //   },
    //   act: (bloc) => bloc.add(
    //       createPostEvent(authToken: authToken, message: 'testMessage')
    //           as MessageEvent),
    //   expect: () => [MessageLoadingState(), ReplyNotSentState(error: 'error')],
    //   // the replayNotSentState(error: 'error') not sent
    // );


    // blocTest<MessageBloc, MessageState>(
    //   'emits ComplaintNotLoadedState when GetComplaintEvent fails',
    //   build: () {
    //     // Throw an error from the mock repository
    //     when(() => messageRepository.getComplaints(authToken))
    //         .thenThrow('error');
    //     return messageBloc;
    //   },
    //   act: (bloc) =>
    //       bloc.add(GetComplaintsEvent(authToken: authToken) as MessageEvent),
    //   expect: () => [ComplaintsNotLoadedState(error: 'error')],
    // );
    // 


  });
}
