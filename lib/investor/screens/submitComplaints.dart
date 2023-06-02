import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../login/blocs/blocs.dart';
import '../data_providers/Message_Data_Provider.dart';
import '../models/submitcomplaintsmodel.dart';
import '../repository/Message_Repository.dart';
import '../blocs/message/blocs.dart';

class InvestorSubmitcomplaintWidget extends StatefulWidget {
  const InvestorSubmitcomplaintWidget({Key? key}) : super(key: key);

  @override
  _SubmitcomplaintWidgetState createState() => _SubmitcomplaintWidgetState();
}

class _SubmitcomplaintWidgetState extends State<InvestorSubmitcomplaintWidget> {
  SubmitcomplaintModel _model = SubmitcomplaintModel();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var messageBloc = MessageBloc(
      messageRepository:
          MessageRepository(messageDataProvider: MessageDataProvider()));
  String authToken = "";
  @override
  void initState() {
    super.initState();

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (ctx, state) {
          if (state is AuthenticatedAuthState) {
            authToken = state.auth.authToken;
          }
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  context.go("/investor");
                },
              ),
              title: Text(
                'Submit complaint',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: 200,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Write Post',
                                    labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(90, 117, 117, 117)),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.deepOrange,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  // style: FlutterFlowTheme.of(context).bodyMedium,
                                  maxLines: 15,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Field required!';
                                    } else {
                                      null;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          BlocProvider<MessageBloc>.value(
                              value: messageBloc,
                              child: BlocConsumer<MessageBloc, MessageState>(
                                  listener: (ctx, state) {},
                                  builder: (ctx, state) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        if (_model.formKey.currentState!
                                            .validate()) {
                                          _model.complaint =
                                              _model.textController!.text;
                                          BlocProvider.of<MessageBloc>(ctx).add(
                                              SendComplaintEvent(
                                                  authToken: authToken,
                                                  complaint: _model));
                                        } else {
                                          null;
                                        }
                                      },
                                      child: Text('Post'),
                                      style: ElevatedButton.styleFrom(
                                        alignment: Alignment.center,
                                        backgroundColor: Colors.blue,
                                      ),
                                    );
                                  })),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
