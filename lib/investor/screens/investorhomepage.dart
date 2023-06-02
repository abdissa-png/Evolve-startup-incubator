// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:evolve/investor/blocs/investor/blocs.dart';
import 'package:evolve/investor/blocs/pairing/blocs.dart';
import 'package:evolve/investor/data_providers/Investor_Data_Provider.dart';
import 'package:evolve/investor/data_providers/Pairing_Data_Provider.dart';
import 'package:evolve/investor/models/pairingModel.dart';
import 'package:evolve/investor/repository/Pairing_Repositiory.dart';
import 'package:evolve/login/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../repository/Investor_Repository.dart';

class InvestorhomepageWidget extends StatefulWidget {
  const InvestorhomepageWidget({Key? key}) : super(key: key);

  @override
  _InvestorhomepageWidgetState createState() => _InvestorhomepageWidgetState();
}

class _InvestorhomepageWidgetState extends State<InvestorhomepageWidget> {
  var investorBloc = InvestorBloc(
      investorRepository:
          InvestorRepository(investorDataProvider: InvestorDataProvider()));
  String authToken = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var pairingBloc = PairingBloc(
      PairingRepository(pairingDataProvider: PairingDataProvider()));
  var pairingBloc1 = PairingBloc(
      PairingRepository(pairingDataProvider: PairingDataProvider()));

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is! AuthenticatedAuthState) {
            context.go("/");
            return Container();
          } else {
            authToken = state.auth.authToken;
            return Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.white,
              drawer: Drawer(
                elevation: 16,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.person,
                          ),
                          title: Text(
                            'Profile',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(100, 117, 117, 117),
                              size: 20,
                            ),
                            onPressed: () {
                              context.go("/investor/profile");
                            },
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.content_paste_sharp,
                          ),
                          title: Text(
                            'Startup\'s you paired with',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(100, 117, 117, 117),
                              size: 20,
                            ),
                            onPressed: () {
                              context.go("/investor/pairedStartups");
                            },
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.notifications,
                          ),
                          title: Text(
                            'Notifications',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(100, 117, 117, 117),
                              size: 20,
                            ),
                            onPressed: () {
                              context.go("/investor/notifications");
                            },
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.account_circle,
                          ),
                          title: Text(
                            'Edit Account',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(100, 117, 117, 117),
                              size: 20,
                            ),
                            onPressed: () {
                              context.go("/investor/editAccount");
                            },
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.message,
                          ),
                          title: Text(
                            'Submit complaint',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(100, 117, 117, 117),
                              size: 20,
                            ),
                            onPressed: () {
                              context.go("/investor/submitComplaints");
                            },
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                  automaticallyImplyLeading: false,
                  title: BlocProvider<InvestorBloc>.value(
                      value: investorBloc,
                      child: BlocConsumer<InvestorBloc, InvestorState>(
                          listener: (ctx, state) {},
                          builder: (ctx, state) {
                            if (state is! ProfileLoaded) {
                              return Text(
                                'Hello, Investor',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              );
                            } else {
                              return Text(
                                'Hello, ${state.investor.name}',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              );
                            }
                          })),
                  actions: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                context.go("/investor/searchStartups");
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context)
                                    .add(AuthLogoutRequested());
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  centerTitle: false,
                  elevation: 2,
                ),
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0, 0),
                              child: TabBar(
                                labelColor: Colors.blue,
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                                indicatorColor: Colors.white,
                                tabs: [
                                  Tab(
                                    text: 'Responses',
                                  ),
                                  Tab(
                                    text: 'Requests',
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  SingleChildScrollView(
                                    child: BlocProvider<PairingBloc>.value(
                                        value: pairingBloc,
                                        child: BlocConsumer<PairingBloc,
                                                PairingState>(
                                            listener: (ctx, state) {},
                                            builder: (ctx, state) {
                                              if (state is PairingStarted) {
                                                BlocProvider.of<PairingBloc>(
                                                        ctx)
                                                    .add(PairingGetRequests(
                                                        authToken: authToken));
                                                return Container();
                                              } else if (state
                                                  is RequestsLoaded) {
                                                final requests = state.requests;
                                                return ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: requests.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return ListTile(
                                                      title: Text(
                                                        requests[index]
                                                            .startupEmail,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      subtitle: Text(
                                                        requests[index].status,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      tileColor: Colors.white,
                                                      dense: false,
                                                    );
                                                  },
                                                );
                                              } else {
                                                return Container();
                                              }
                                            })),
                                  ),
                                  BlocProvider<PairingBloc>.value(
                                      value: pairingBloc1,
                                      child: SingleChildScrollView(
                                        child: BlocConsumer<PairingBloc,
                                                PairingState>(
                                            listener: (context, state) {},
                                            builder: (ctx, state) {
                                              if (state is PairingStarted) {
                                                BlocProvider.of<PairingBloc>(
                                                        ctx)
                                                    .add(PairingGetResponses(
                                                        authToken: authToken));
                                                return Container();
                                              } else if (state
                                                  is PairingResponseLoaded) {
                                                final responses =
                                                    state.responses;
                                                return ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: responses.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return ListTile(
                                                        title: Text(
                                                          responses[index]
                                                              .investorEmail,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        subtitle: Text(
                                                          responses[index]
                                                              .status,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        tileColor: Colors.white,
                                                        dense: false,
                                                        trailing: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            IconButton(
                                                                onPressed: () {
                                                                  BlocProvider.of<PairingBloc>(ctx).add(PairingUpdateResponse(
                                                                      authToken:
                                                                          authToken,
                                                                      pairing: PairingModel(
                                                                          startupEmail: responses[index]
                                                                              .startupEmail,
                                                                          investorEmail: responses[index]
                                                                              .startupEmail,
                                                                          status:
                                                                              "accepted")));
                                                                },
                                                                icon: Icon(Icons
                                                                    .check)),
                                                            IconButton(
                                                                onPressed: () {
                                                                  BlocProvider.of<PairingBloc>(ctx).add(PairingUpdateResponse(
                                                                      authToken:
                                                                          authToken,
                                                                      pairing: PairingModel(
                                                                          startupEmail: responses[index]
                                                                              .startupEmail,
                                                                          investorEmail: responses[index]
                                                                              .startupEmail,
                                                                          status:
                                                                              "rejected")));
                                                                },
                                                                icon: Icon(
                                                                  Icons.close,
                                                                  color: Colors
                                                                      .red,
                                                                )),
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              } else {
                                                return Container();
                                              }
                                            }),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
