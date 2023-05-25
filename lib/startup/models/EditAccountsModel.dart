
import 'package:flutter/material.dart';


class EditaccountModel{
  ///  State fields for stateful widgets in this page.
  late String oldPass;
  late String newPass;
  late String confirmPass;

  
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  late bool passwordVisibility3;
  String? Function(BuildContext, String?)? textController3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
    passwordVisibility3 = false;
  }

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
  }

  /// Additional helper methods are added here.

}