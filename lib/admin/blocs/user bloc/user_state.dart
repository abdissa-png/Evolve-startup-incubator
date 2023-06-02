import 'package:equatable/equatable.dart';
import 'package:evolve/admin/models/userModel.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserPageStarted extends UserState {
  @override
  List<Object> get props => [];
}

class UserSearchLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserNotFoundState extends UserState {
  @override
  List<Object> get props => [];
}

class UserFoundState extends UserState {
  final List<UserModel> users;

  UserFoundState({required this.users});

  @override
  List<Object> get props => [users];
}

class UserDeleteLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserDeletedState extends UserState {
  final UserModel user;

  UserDeletedState({required this.user});
  @override
  List<Object> get props => [user];
}

class UserNotDeletedState extends UserState {
  final Object error;

  UserNotDeletedState(this.error);
  @override
  List<Object> get props => [error];
}
