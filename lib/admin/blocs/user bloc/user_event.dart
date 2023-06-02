// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:evolve/admin/models/userModel.dart';

class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object> get props => [];
}

class UserSearchEvent extends UserEvent {
  final String authToken;
  final String search;

  UserSearchEvent(
    this.authToken,
    this.search,
  );

  @override
  List<Object> get props => [authToken, search];
}

class UserDeleteEvent extends UserEvent {
  final String authToken;
  final UserModel userModel;

  UserDeleteEvent(
    this.authToken,
    this.userModel,
  );

  @override
  List<Object> get props => [authToken, userModel];
}
