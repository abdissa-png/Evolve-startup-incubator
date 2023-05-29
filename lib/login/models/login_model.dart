class LoginModel {
  String email;
  String password;

  LoginModel({required this.email, required this.password});
  Map<String, String> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  bool validateEmail(String email) {
    // Use regex to validate email format
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  bool validatePassword(String password) {
    // Add additional password validation logic if needed
    return password.length >= 6;
  }

  bool signIn() {
    bool isEmailValid = validateEmail(email);
    bool isPasswordValid = validatePassword(password);

    return isEmailValid && isPasswordValid;
    // You can perform additional sign-in logic here if needed
  }
}
