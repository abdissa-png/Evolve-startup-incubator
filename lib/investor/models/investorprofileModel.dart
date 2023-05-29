// ignore_for_file: public_member_api_docs, sort_constructors_first
class InvestorModel {

  String name;
  String phoneNumber;
  String description;
  List<String> interest;
  List<String> investmentStage;
  InvestorModel({

    required this.name,
    required this.phoneNumber,
    required this.description,
    required this.interest,
    required this.investmentStage,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,

      'description': description,
      'phoneNumber': phoneNumber,
      'industryStage': investmentStage,
      'requiredAssistance': interest
    };
  }
}
