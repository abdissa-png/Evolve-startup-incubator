class startUpProfileModel {
  String companyName;
  String phoneNumber;
  String address;
  String founder;
  String description;
  bool fundingAssistance;
  bool mentoringAssistance;
  bool legalAssistance;
  bool otherAssistance;
  String companyStage;

 startUpProfileModel({
    this.companyName = '',
    this.phoneNumber = '',
    this.address = '',
    this.founder = '',
    this.description = '',
    this.fundingAssistance = false,
    this.mentoringAssistance = false,
    this.legalAssistance = false,
    this.otherAssistance = false,
    this.companyStage = '',
  });
}
