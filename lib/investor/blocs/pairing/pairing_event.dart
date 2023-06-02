// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../models/pairingModel.dart';

class PairingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PairingRequestStartup extends PairingEvent {
  final String authToken;
  final String startupEmail;
  PairingRequestStartup({
    required this.authToken,
    required this.startupEmail,
  });
}

class PairingUpdateResponse extends PairingEvent {
  final String authToken;
  final PairingModel pairing;
  PairingUpdateResponse({
    required this.authToken,
    required this.pairing,
  });
}

class PairingGetPairedStartups extends PairingEvent {
  final String authToken;
  PairingGetPairedStartups({
    required this.authToken,
  });
}

class PairingGetResponses extends PairingEvent {
  final String authToken;
  PairingGetResponses({
    required this.authToken,
  });
}

class PairingGetRequests extends PairingEvent {
  final String authToken;
  PairingGetRequests({
    required this.authToken,
  });
}
