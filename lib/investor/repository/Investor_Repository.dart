// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evolve/investor/data_providers/Investor_Data_Provider.dart';
import 'package:evolve/investor/models/investorprofileModel.dart';
import 'package:evolve/investor/models/startupSearchModel.dart';

class InvestorRepository {
  final InvestorDataProvider investorDataProvider;
  InvestorRepository({
    required this.investorDataProvider,
  });
  Future<InvestorModel> getProfile(String authToken) async {
    return investorDataProvider.getProfile(authToken);
  }

  Future<List<StartupModel>> searchStartup(
      String authToken, String name) async {
    return investorDataProvider.searchStartup(authToken, name);
  }

  Future<bool> changePassword(
      String authToken, String oldPassword, String newPassword) async {
    return investorDataProvider.changePassword(
        authToken, oldPassword, newPassword);
  }

  Future<bool> deleteAccount(String authToken) {
    return investorDataProvider.deleteAccount(authToken);
  }

  Future<bool> updateProfile(String authToken, InvestorModel investor) async {
    return investorDataProvider.updateProfile(authToken, investor);
  }
}
