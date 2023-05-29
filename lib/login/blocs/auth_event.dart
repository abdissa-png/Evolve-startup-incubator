import 'package:equatable/equatable.dart';
import 'package:evolve/login/models/auth_model.dart';
import 'package:evolve/login/models/create_startup_model.dart';
import 'package:evolve/login/models/login_model.dart';

import '../models/create_investor_model.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStartedEvent extends AuthEvent {
  final LoginModel login;

  AuthStartedEvent(this.login);

  @override
  List<Object?> get props => [login];
}

class AuthUnauthenticatedEvent extends AuthEvent {
  final Object error;

  AuthUnauthenticatedEvent(this.error);
  @override
  List<Object?> get props => [];
}

class AuthLogoutRequested extends AuthEvent {
  final AuthModel auth;

  const AuthLogoutRequested(this.auth);

  @override
  List<Object?> get props => [auth];
}

class AuthStartupSignUp extends AuthEvent {
  final StartupModel startup;

  AuthStartupSignUp(this.startup);

  @override
  List<Object?> get props => [startup];
}

class AuthInvestorSignUp extends AuthEvent {
  final InvestorModel investor;

  AuthInvestorSignUp(this.investor);

  @override
  List<Object?> get props => [investor];
}
