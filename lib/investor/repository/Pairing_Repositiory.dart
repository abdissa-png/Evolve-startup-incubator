// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evolve/investor/data_providers/Pairing_Data_Provider.dart';
import 'package:evolve/investor/models/pairedStartups.dart';

import '../models/pairingModel.dart';

class PairingRepository {
  final PairingDataProvider pairingDataProvider;
  PairingRepository({
    required this.pairingDataProvider,
  });
  Future<bool> requestStartup(String authToken, String startupEmail) async {
    return pairingDataProvider.requestStartup(authToken, startupEmail);
  }

  Future<bool> updateResponse(String authToken, PairingModel pairing) async {
    return pairingDataProvider.updateResponse(authToken, pairing);
  }

  Future<List<PairedStartup>> pairedStartups(String authToken) async {
    return pairingDataProvider.pairedStartups(authToken);
  }

  Future<List<PairingModel>> getResponses(String authToken) async {
    return pairingDataProvider.getResponses(authToken);
  }

  Future<List<PairingModel>> getRequests(String authToken) async {
    return pairingDataProvider.getRequests(authToken);
  }
}
