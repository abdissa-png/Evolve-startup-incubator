class AuthModel {
  String role;
  String authToken;
  String refreshToken;
  AuthModel({
    required this.role,
    required this.authToken,
    required this.refreshToken,
  });
  factory AuthModel.fromJson(List<dynamic> body) {
    String role = body[0];
    String authToken = body[1]['access_token'];
    String refreshToken = body[1]['refresh_token'];
    return AuthModel(
        role: role, authToken: authToken, refreshToken: refreshToken);
  }
}
