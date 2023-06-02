// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:evolve/investor/models/pairedStartups.dart';
import 'package:evolve/investor/models/pairingModel.dart';

class PairingState extends Equatable {
  @override
  List<Object> get props => [];
}

class PairingStarted extends PairingState {}

class PairingLoading extends PairingState {}

class PairingStartupSuccess extends PairingState {}

class PairingStartupFailed extends PairingState {
  final Object error;
  PairingStartupFailed({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class UpdateResponseSuccess extends PairingState {
  @override
  List<Object> get props => [];
}

class UpdateResponseFailure extends PairingState {
  final Object error;
  UpdateResponseFailure({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class PairedStartupsLoaded extends PairingState {
  final List<PairedStartup> startups;
  PairedStartupsLoaded({
    required this.startups,
  });
  @override
  List<Object> get props => [startups];
}

class PairedStartupsLoadFailed extends PairingState {
  final Object error;
  PairedStartupsLoadFailed({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

class PairingResponseLoaded extends PairingState {
  final List<PairingModel> responses;
  PairingResponseLoaded({
    required this.responses,
  });
  @override
  List<Object> get props => [responses];
}

class PairingResponseFailed extends PairingState {
  final Object error;
  PairingResponseFailed({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

class RequestsLoaded extends PairingState {
  final List<PairingModel> requests;
  RequestsLoaded({
    required this.requests,
  });
  @override
  List<Object> get props => [requests];
}

class RequestsLoadFailed extends PairingState {
  final Object error;
  RequestsLoadFailed({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
