import 'package:evolve/admin/blocs/message%20bloc/blocs.dart';
import 'package:evolve/admin/data_providers/Message_Data_Provider.dart';
import 'package:evolve/admin/repository/Message_Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../login/blocs/blocs.dart';

class AdminHomePage extends StatefulWidget {
  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  var messageBloc = MessageBloc(MessageRepository(MessageDataProvider()));
  String authToken = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (_, state) {
      if (state is UnauthenticatedAuthState) {
        context.go("/login");
      }
    }, builder: (_, state) {
      if (state is AuthenticatedAuthState) {
        authToken = state.auth.authToken;
      }
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 20),
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: AppBar(
              title: const Text("Hello,Admin"),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.logout,
                        size: 30.0,
                      ),
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(AuthLogoutRequested());
                      },
                    ))
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Navigation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.remove,
                  size: 50,
                ),
                title: const Text('Remove Users'),
                onTap: () {
                  context.go("/admin/removeUser");
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.create,
                  size: 40,
                ),
                title: const Text('Create Post'),
                onTap: () {
                  context.go("/admin/createPost/all");
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.view_agenda,
                ),
                title: const Text('Complaints'),
                onTap: () {
                  context.go("/admin/getComplaint");
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white10,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Your Posts",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            fontFamily: "poppins"),
                      )
                    ],
                  ),
                  BlocProvider<MessageBloc>.value(
                      value: messageBloc,
                      child: BlocConsumer<MessageBloc, MessageState>(
                        listener: (_, state) {
                          if (state is MessageNotLoadedState) {
                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            // content: Text(state.error.toString())));
                          }
                        },
                        builder: (_, state) {
                          messageBloc.add(GetPostsEvent(authToken: authToken));
                          if (state is MessageLoadingState) {
                            return const Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  backgroundColor: Colors.blue,
                                ),
                                Text("Loading...")
                              ],
                            ));
                          } else if (state is MessageLoadedState) {
                            final posts = state.announcements;
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: posts.length,
                                itemBuilder: (context, index) {
                                  final post = posts[index];
                                  return ExpansionTile(
                                    title: Text(
                                      "Post ${index + 1}",
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    trailing: const Icon(
                                      Icons.arrow_drop_down,
                                      size: 50,
                                    ),
                                    children: [
                                      Text(post.Message),
                                    ],
                                  );
                                });
                          } else {
                            return Text("No posts loaded");
                          }
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
