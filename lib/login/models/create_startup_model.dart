class StartupModel {
  String email;
  String password;
  String companyName;
  String phoneNumber;
  String address;
  String founders;
  String description;
  List<String> assistanceRequired;
  String companyStage;
  StartupModel({
    required this.email,
    required this.password,
    required this.companyName,
    required this.phoneNumber,
    required this.address,
    required this.founders,
    required this.description,
    required this.assistanceRequired,
    required this.companyStage,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': companyName,
      'email': email,
      'password': password,
      'description': description,
      'founders': founders,
      'industryStage': companyStage,
      'address': address,
      'phoneNumber': phoneNumber,
      'requiredAssistance': assistanceRequired
    };
  }
}
