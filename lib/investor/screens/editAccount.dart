import 'package:flutter/material.dart';
import '../models/editaccountmodel.dart';
export '../models/editaccountmodel.dart';

class EditaccountWidget extends StatefulWidget {
  const EditaccountWidget({Key? key}) : super(key: key);

  @override
  _EditaccountWidgetState createState() => _EditaccountWidgetState();
}

class _EditaccountWidgetState extends State<EditaccountWidget> {
  late EditaccountModel _model = EditaccountModel();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  bool obscurePass = true;
  bool obscureConfirm = true;
  bool obscureOld = true;
  
  bool _mismatch = false;

  String? passPossible(val) {
    if ((val == null || val.isEmpty)) {
      return 'Field required!';
    } else if (val.length < 8) {
      return 'too short! at least 8';
    } else
      null;
  }

  @override
  void initState() {
    super.initState();

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

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
            'Edit Account',
            style: TextStyle(fontSize: 20),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Change Password',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController1,
                          autofocus: true,
                          obscureText: obscureOld,
                          decoration: InputDecoration(
                            labelText: 'Old Password',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(90, 117, 117, 117),
                            ),
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
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => obscureOld = !obscureOld,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                obscureOld
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 18,
                              ),
                            ),
                          ),
                          // style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: (value) {
                            return passPossible(value);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController2,
                          autofocus: true,
                          obscureText: obscurePass,
                          decoration: InputDecoration(
                            labelText: 'New Password',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(90, 117, 117, 117),
                            ),
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
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => obscurePass = !obscurePass,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                obscurePass
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 18,
                              ),
                            ),
                          ),
                          // style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: (value) {
                            return passPossible(value);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController3,
                          autofocus: true,
                          obscureText: obscureConfirm,
                          decoration: InputDecoration(
                            labelText: 'Re-enter new Password',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(90, 117, 117, 117),
                            ),
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
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => obscureConfirm = !obscureConfirm,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                obscureConfirm
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 18,
                              ),
                            ),
                          ),
                          // style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: (value) {
                            return passPossible(value);
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _mismatch,
                      child: Row(
                        children: [
                          Icon(Icons.warning),
                          Text("The new Password and re-entry password do not match", style: TextStyle( fontSize: 13, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_model.formKey.currentState!.validate() &&
                                (_model.textController2!.text ==
                                    _model.textController3!.text)) {
                              _model.oldPass = _model.textController1!.text;
                              _model.newPass = _model.textController2!.text;
                              _model.confirmPass = _model.textController3!.text;
                              
                            } else if (_model.textController2!.text !=
                                _model.textController3!.text) {
                              setState(() {
                                _mismatch = true;
                              });
                            }
                            null;
                          },
                          child: const Text('submitt')),
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Delete Account')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
