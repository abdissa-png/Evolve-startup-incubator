// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evolve/admin/data_providers/User_Data_Provider.dart';
import 'package:evolve/admin/models/userModel.dart';

class UserRepository {
  final UserDataProvider userDataProvider;
  UserRepository({
    required this.userDataProvider,
  });
  Future<List<UserModel>> searchUser(String authToken, String name) async {
    return userDataProvider.searchUser(authToken, name);
  }

  Future<void> removeUser(String authToken, String email, String role) async {
    return userDataProvider.removeUser(authToken, email, role);
  }
}
