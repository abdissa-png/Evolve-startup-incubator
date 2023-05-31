// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../models/auth_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class UnknownAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthRegisterState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthenticationLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthenticatedAuthState extends AuthState {
  final AuthModel auth;
  const AuthenticatedAuthState(this.auth);

  @override
  List<Object> get props => [auth];
}

class UnauthenticatedAuthState extends AuthState {
  final Object error;
  const UnauthenticatedAuthState(this.error);
  @override
  List<Object> get props => [error];
}
