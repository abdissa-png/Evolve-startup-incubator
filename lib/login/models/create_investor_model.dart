// ignore_for_file: public_member_api_docs, sort_constructors_first
class InvestorModel {
  String email;
  String password;
  String name;
  String phoneNumber;
  String description;
  List<String> interest;
  List<String> investmentStage;
  InvestorModel({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.description,
    required this.interest,
    required this.investmentStage,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'description': description,
      'phoneNumber': phoneNumber,
      'industryStage': investmentStage,
      'requiredAssistance': interest
    };
  }
}
