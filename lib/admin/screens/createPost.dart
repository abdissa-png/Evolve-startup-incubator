// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evolve/admin/blocs/message%20bloc/blocs.dart';
import 'package:evolve/admin/models/userModel.dart';
import 'package:evolve/admin/repository/Message_Repository.dart';
import 'package:evolve/login/blocs/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../login/blocs/auth_bloc.dart';
import '../data_providers/Message_Data_Provider.dart';

class CreatePost extends StatefulWidget {
  String email;
  CreatePost({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState(email);
}

class _CreatePostState extends State<CreatePost> {
  var messageBloc = MessageBloc(MessageRepository(MessageDataProvider()));
  final controller = TextEditingController();
  final String email;
  String authToken = '';
  _CreatePostState(this.email);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is! AuthenticatedAuthState) {
        context.go("/");
      }
    }, builder: (context, state) {
      if (state is AuthenticatedAuthState) {
        authToken = state.auth.authToken;
      }
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                if (email == "all") {
                  context.go("/admin");
                } else {
                  context.go("/admin/getComplaint");
                }
              },
            ),
            backgroundColor: Colors.indigo[700],
            title: const Text("Create Post"),
          ),
          body: Column(children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
              child: Container(
                child: BlocProvider<MessageBloc>.value(
                    value: messageBloc,
                    child: BlocConsumer<MessageBloc, MessageState>(
                        listener: (ctx, state) {
                      if (state is MessageLoadingState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Message is being sent"),
                          duration: Duration(milliseconds: 200),
                        ));
                      } else if (state is ReplySentState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Message is sent"),
                            duration: Duration(milliseconds: 200)));
                        if (email == "all") {
                          context.go("/admin");
                        } else {
                          context.go("/admin/getComplaint");
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Message is not sent"),
                            duration: Duration(milliseconds: 100)));
                      }
                    }, builder: (ctx, state) {
                      return Column(
                        children: [
                          TextFormField(
                            controller: controller,
                            decoration: InputDecoration(
                              labelText: 'Write Post',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            maxLines: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: const Text(
                                'Post',
                                style: TextStyle(
                                    color: Colors.white,
                                    decorationColor: Colors.indigo),
                              ),
                              onPressed: () {
                                if (email == "all") {
                                  messageBloc.add(createPostEvent(
                                      authToken: authToken,
                                      message: controller.text));
                                } else {
                                  messageBloc.add(ReplyToComplaintEvent(
                                      authToken: authToken,
                                      message: controller.text,
                                      email: email));
                                }
                              },
                            ),
                          ),
                        ],
                      );
                    })),
              ),
            ),
          ]));
    });
  }
}
