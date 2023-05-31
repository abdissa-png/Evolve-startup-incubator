import 'package:evolve/login/data_providers/Auth_Data_Provider.dart';
import 'package:evolve/login/models/auth_model.dart';
import 'package:evolve/login/models/create_investor_model.dart';
import 'package:evolve/login/models/create_startup_model.dart';

import '../models/login_model.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;
  AuthRepository(this.authDataProvider);
  Future<AuthModel> login(LoginModel loginData) async {
    return authDataProvider.login(loginData.toJson());
  }

  Future<AuthModel> startupSignup(StartupModel startup) async {
    return authDataProvider.startupSignup(startup.toJson());
  }

  Future<AuthModel> investorSignup(InvestorModel investor) async {
    return authDataProvider.investorSignup(investor.toJson());
  }

  Future<bool> logout() async {
    return authDataProvider.logout();
  }

  Future<bool> hasToken() async {
    try {
      AuthModel tokens = await authDataProvider.fetchToken();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<AuthModel> fetchToken() async {
    try {
      final authModel = authDataProvider.fetchToken();
      return authModel;
    } catch (e) {
      throw Exception("Tokens doesnot exist");
    }
  }
}
