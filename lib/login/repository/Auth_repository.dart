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

  Future<bool> logout(AuthModel auth) async {
    return authDataProvider.logout(auth.authToken);
  }
}
