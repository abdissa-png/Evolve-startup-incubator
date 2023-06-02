import 'package:evolve/admin/blocs/message%20bloc/blocs.dart';
import 'package:evolve/admin/data_providers/Message_Data_Provider.dart';
import 'package:evolve/admin/repository/Message_Repository.dart';
import 'package:evolve/login/blocs/auth_bloc.dart';
import 'package:evolve/login/blocs/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  String authToken = '';
  var messageBloc = MessageBloc(MessageRepository(MessageDataProvider()));
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
          backgroundColor: Colors.indigoAccent[700],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
            ),
            onPressed: () {
              context.go("/admin");
            },
          ),
          title: const Text("Complaints"),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: BlocProvider<MessageBloc>.value(
                value: messageBloc,
                child: BlocConsumer<MessageBloc, MessageState>(
                    listener: (_, state) {
                  if (state is ComplaintsNotLoadedState) {
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //   content: Text("Complaints Not Loaded"),
                    //   duration: Duration(milliseconds: 200),
                    // ));
                    if (state is ComplaintsLoadedState) {
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //   content: Text("Complaints Loaded"),
                      //   duration: Duration(milliseconds: 200),
                      // ));
                    }
                  }
                }, builder: (_, state) {
                  messageBloc.add(GetComplaintsEvent(authToken: authToken));
                  if (state is ComplaintsLoadedState) {
                    final complaints = state.complaints;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: complaints.length,
                        itemBuilder: (context, index) {
                          final complaint = complaints[index];
                          return ExpansionTile(
                            title: Text(
                              complaint.email,
                              style: const TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(complaint.message.substring(0, 7)),
                            trailing: const SizedBox(
                              width: 50,
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 30,
                              ),
                            ),
                            children: [
                              Column(
                                children: [
                                  Text(complaint.message),
                                  Row(
                                    children: [
                                      Text("Send a reply"),
                                      IconButton(
                                        icon: const Icon(Icons.send),
                                        onPressed: () {
                                          context.go(
                                              "/admin/createPost/${complaint.email}");
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          );
                        });
                  } else {
                    return const Center(child: Text("No complaints found"));
                  }
                })),
          ),
        ),
      );
    });
  }
}
