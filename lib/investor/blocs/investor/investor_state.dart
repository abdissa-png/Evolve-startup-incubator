// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:evolve/investor/models/investorprofileModel.dart';
import 'package:evolve/investor/models/startupSearchModel.dart';

class InvestorState extends Equatable {
  @override
  List<Object> get props => [];
}

class InvestorStarted extends InvestorState {}

class InvestorLoading extends InvestorState {}

class ProfileLoaded extends InvestorState {
  final InvestorModel investor;
  ProfileLoaded({
    required this.investor,
  });
  @override
  List<Object> get props => [investor];
}

class ProfileLoadFailed extends InvestorState {
  final Object error;
  ProfileLoadFailed({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class SearchSuccess extends InvestorState {
  final List<StartupModel> startup;
  SearchSuccess({
    required this.startup,
  });
  @override
  List<Object> get props => [startup];
}

class SearchFailed extends InvestorState {
  final Object error;
  SearchFailed({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class PasswordChanged extends InvestorState {}

class PasswordChangeFailed extends InvestorState {
  final Object error;
  PasswordChangeFailed({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

class AccountDeleted extends InvestorState {}

class AccountDeleteFailed extends InvestorState {
  final Object error;
  AccountDeleteFailed({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

class ProfileUpdated extends InvestorState {}

class ProfileUpdateFailed extends InvestorState {
  final Object error;
  ProfileUpdateFailed({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
