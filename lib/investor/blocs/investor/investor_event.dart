// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../models/investorprofileModel.dart';

class InvestorEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InvestorProfileLoad extends InvestorEvent {
  final String authToken;
  InvestorProfileLoad({
    required this.authToken,
  });
  @override
  List<Object> get props => [authToken];
}

class StartupSearch extends InvestorEvent {
  String authToken;
  String name;
  StartupSearch({
    required this.authToken,
    required this.name,
  });
  @override
  List<Object> get props => [authToken, name];
}

class InvestorChangePassword extends InvestorEvent {
  String authToken;
  String oldPassword;
  String newPassword;
  InvestorChangePassword({
    required this.authToken,
    required this.oldPassword,
    required this.newPassword,
  });
  @override
  List<Object> get props => [authToken, newPassword, oldPassword];
}

class InvestorDeleteAccount extends InvestorEvent {
  final String authToken;
  InvestorDeleteAccount({
    required this.authToken,
  });
  @override
  List<String> get props => [authToken];
}

class InvestorProfileUpdate extends InvestorEvent {
  String authToken;
  InvestorModel investor;
  InvestorProfileUpdate({
    required this.authToken,
    required this.investor,
  });
  @override
  List<Object> get props => [authToken, investor];
}
