import 'package:evolve/login/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../login/blocs/blocs.dart';
import '../blocs/user bloc/blocs.dart';
import '../data_providers/User_Data_Provider.dart';
import '../repository/User_Repository.dart';

class RemoveUser extends StatefulWidget {
  const RemoveUser({Key? key}) : super(key: key);

  @override
  State<RemoveUser> createState() => _RemoveUserState();
}

class _RemoveUserState extends State<RemoveUser> {
  final controller = TextEditingController();
  var userBloc = UserBloc(UserRepository(userDataProvider: UserDataProvider()));
  String authToken = '';
  // final List<DeleteUser> itemList = [
  //   DeleteUser(title: 'userName', subtitle: 'Role'),
  //   DeleteUser(title: 'userName', subtitle: 'Role'),
  //   DeleteUser(title: 'userName', subtitle: 'Role'),
  // ];
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
          title: const Text(
            "Remove User",
            style: TextStyle(),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20.0),
            child: Container(),
          ),
        ),
        body: BlocProvider<UserBloc>.value(
            value: userBloc,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: TextFormField(
                          controller: controller,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search_outlined),
                            border: InputBorder.none,
                            labelText: "Enter StartUp Name",
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          userBloc
                              .add(UserSearchEvent(authToken, controller.text));
                        },
                        child: Icon(Icons.search))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                  child: Text(
                    'Users matching search',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<UserBloc, UserState>(listener: (context, state) {
                  if (state is UserSearchLoadingState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Searching User"),
                      duration: Duration(milliseconds: 200),
                    ));
                  }
                  if (state is UserDeleteLoadingState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Deleting User"),
                      duration: Duration(milliseconds: 200),
                    ));
                  }
                  if (state is UserNotDeletedState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.error as String),
                      duration: Duration(milliseconds: 200),
                    ));
                  }
                }, builder: (ctx, state) {
                  if (state is UserNotFoundState) {
                    return Text("User you are looking for is not found");
                  } else if (state is UserFoundState) {
                    final userList = state.users;
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          final user = userList[index];
                          return ListTile(
                            title: Text(
                              user.name,
                              style: const TextStyle(fontSize: 40),
                            ),
                            subtitle: Text(user.role),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                userBloc.add(UserDeleteEvent(authToken, user));
                              },
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
              ],
            )),
      );
    });
  }
}
