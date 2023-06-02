import 'package:evolve/investor/blocs/message/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../login/blocs/blocs.dart';
import '../blocs/message/message_bloc.dart';
import '../blocs/message/message_state.dart';
import '../data_providers/Message_Data_Provider.dart';
import '../repository/Message_Repository.dart';

class InvestorNotificationWidget extends StatefulWidget {
  const InvestorNotificationWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<InvestorNotificationWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var messageBloc = MessageBloc(
      messageRepository:
          MessageRepository(messageDataProvider: MessageDataProvider()));
  String authToken = "";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  context.go("/investor");
                },
              ),
              title: const Text(
                'Page Title',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Your Posts',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    BlocProvider<MessageBloc>.value(
                        value: messageBloc,
                        child: BlocConsumer<MessageBloc, MessageState>(
                            listener: (ctx, state) {},
                            builder: (ctx, state) {
                              if (state is MessageLoading) {
                                BlocProvider.of<MessageBloc>(ctx).add(
                                    GetNotificationEvent(authToken: authToken));
                                return const Center(child: Text("Loading"));
                              } else if (state is NotificationSuccess) {
                                final posts = state.notifications;
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Container(
                                              width: 374,
                                              height: 147,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {},
                                                  child: Text(
                                                    post.message,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              } else {
                                return Container();
                              }
                            })),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
