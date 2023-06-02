import 'package:bloc_test/bloc_test.dart';
import 'package:evolve/admin/blocs/user%20bloc/user_bloc.dart';
import 'package:evolve/admin/blocs/user%20bloc/user_event.dart';
import 'package:evolve/admin/blocs/user%20bloc/user_state.dart';
import 'package:evolve/admin/models/userModel.dart';
import 'package:evolve/admin/repository/User_Repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('UserBloc', () {
    late UserRepository userRepository;
    late UserBloc userBloc;

    final authToken = 'token';
    final search = 'search';
    final userModel =
        UserModel(name: 'name', email: 'email', role: 'role');

    setUp(() {
      userRepository = MockUserRepository();
      userBloc = UserBloc(userRepository);
    });

    tearDown(() {
      userBloc.close();
    });
    
    test('initial state is correct', () {
      expect(userBloc.state, equals(UserPageStarted()));
    });

    blocTest<UserBloc, UserState>(
      'emits UserFoundState on successful search',
      build: () {
        when(() => userRepository.searchUser(authToken, search)).thenAnswer(
          (_) async => [userModel],
        );
        return userBloc;
      },
      act: (bloc) => bloc.add(
        UserSearchEvent(
          authToken,
          search,
        ),
      ),
      expect: () => [
        UserSearchLoadingState(),
        UserFoundState(users: [userModel]),
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits UserNotFoundState on empty search result',
      build: () {
        when(() => userRepository.searchUser(authToken, search))
            .thenAnswer((_) async => []);
        return userBloc;
      },
      act: (bloc) => bloc.add(
        UserSearchEvent(
          authToken,
          search,
        ),
      ),
      expect: () => [
        UserSearchLoadingState(),
        UserNotFoundState(),
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits UserDeletedState on successful user deletion',
      build: () {
        when(() => userRepository.removeUser(authToken, userModel.email, userModel.role)).thenAnswer(
          (_) async => null,
        );
        return userBloc;
      },
      act: (bloc) => bloc.add(
        UserDeleteEvent(
          authToken,
          userModel,
        ),
      ),
      expect: () => [
        UserDeleteLoadingState(),
        UserDeletedState(user: userModel),
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits UserNotDeletedState on failed user deletion',
      build: () {
        when(() => userRepository.removeUser(authToken, userModel.email, userModel.role))
            .thenThrow(Exception());
        return userBloc;
      },
      act: (bloc) => bloc.add(
        UserDeleteEvent(
          authToken,
          userModel,
        ),
      ),
      expect: () => [
        UserDeleteLoadingState(),
        isA<UserNotDeletedState>(),
      ],
    );
  });
}
