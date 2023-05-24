import 'package:flutter/material.dart';

import '../models/startUpProfileModel.dart';
export '../models/startUpProfileModel.dart';


class StartUpProfileWidget extends StatefulWidget {
  const StartUpProfileWidget({Key? key}) : super(key: key);

  @override
  _StartUpProfileWidgetState createState() => _StartUpProfileWidgetState();
}

class _StartUpProfileWidgetState extends State<StartUpProfileWidget> {
  late startUpProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  // @override
  // void initState() {
  //   super.initState();
  //   // _model = createModel();

  //   _model.textController1 ??= TextEditingController();
  //   _model.textController2 ??= TextEditingController();
  //   _model.textController3 ??= TextEditingController();
  // }

  // @override
  // void dispose() {
  //   // _model.dispose();

  //   _unfocusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () async {
              // context.pop();
            },
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Form(
              // key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: TextFormField(
                            // controller: _model.textController1,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Investor\'s Name',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(90, 117, 117, 117)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF000403),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            // style: FlutterFlowTheme.of(context).bodyMedium,
                            // validator: _model.textController1Validator
                            //     .asValidator(context),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: TextFormField(
                            // controller: _model.textController2,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Phone numb er',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(90, 117, 117, 117)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF000403),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            // style: FlutterFlowTheme.of(context).bodyMedium,
                            // validator: _model.textController2Validator
                            //     .asValidator(context),
                          ),
                        ),
                      ),
                      TextFormField(
                        // controller: _model.textController3,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Description   of  your self ',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(90, 117, 117, 117)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        // style: FlutterFlowTheme.of(context).bodyMedium,
                        maxLines: 8,
                        // validator: _model.textController3Validator
                        //     .asValidator(context),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Investment   Interests',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Checkbox(
                                // options: [
                                //   'Funding',
                                //   'Mentoring',
                                //   'Legal Assistance',
                                //   'Other'
                                // ],
                                onChanged: (value) => {},
                                // (val) => setState(
                                //     () => _model.checkboxGroupValues1 = val),
                                // controller:
                                //     _model.checkboxGroupValueController1 ??=
                                //         FormFieldController<List<String>>(
                                // [],
                                // ),
                                activeColor: Colors.blue,
                                checkColor: Colors.white, value: true,
                                // checkboxBorderColor:Colors.fromARGB(90,117,117,117),
                                // textStyle:
                                //     FlutterFlowTheme.of(context).bodyMedium,
                                // initialized:
                                //     _model.checkboxGroupValues1 != null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Invetsment Stage',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF090F13),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Checkbox(
                                // options: [
                                //   'Seed',
                                //   'Early-stage',
                                //   'Growth',
                                //   'late stage'
                                // ],
                                onChanged: (value) => {},
                                // (val) => setState(
                                //     () => _model.checkboxGroupValues2 = val),
                                // controller:
                                //     _model.checkboxGroupValueController2 ??=
                                //         FormFieldController<List<String>>(
                                //   [],
                                // ),
                                activeColor: Colors.blue,
                                checkColor: Colors.white, value: true,
                                // checkboxBorderColor:
                                //     FlutterFlowTheme.of(context).accent2,
                                // textStyle:
                                //     FlutterFlowTheme.of(context).bodyMedium,
                                // initialized:
                                //     _model.checkboxGroupValues2 != null, value: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'update changes',
                            ),
                            style: ElevatedButton.styleFrom(
                                alignment: Alignment.center,
                                backgroundColor: Colors.blue,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}