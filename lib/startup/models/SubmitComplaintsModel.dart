import 'package:flutter/material.dart';


class SubmitcomplaintModel{
  late String complaint;

  final formKey = GlobalKey<FormState>();
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;


  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();
  }


}