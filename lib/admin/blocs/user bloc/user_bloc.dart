import 'package:evolve/admin/repository/User_Repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserPageStarted()) {
    on<UserSearchEvent>(
      (event, emit) async {
        emit(UserSearchLoadingState());
        final users =
            await userRepository.searchUser(event.authToken, event.search);
        if (users.isEmpty) {
          emit(UserNotFoundState());
        } else {
          emit(UserFoundState(users: users));
        }
      },
    );
    on<UserDeleteEvent>(
      (event, emit) async {
        emit(UserDeleteLoadingState());
        try {
          userRepository.removeUser(
              event.authToken, event.userModel.email, event.userModel.role);
          emit(UserDeletedState(user: event.userModel));
        } catch (e) {
          emit(UserNotDeletedState(e));
        }
      },
    );
  }
}
