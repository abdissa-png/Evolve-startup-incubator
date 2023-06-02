import 'package:evolve/investor/blocs/investor/investor_event.dart';
import 'package:evolve/investor/blocs/investor/investor_state.dart';
import 'package:evolve/investor/blocs/pairing/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../login/blocs/blocs.dart';
import '../blocs/investor/investor_bloc.dart';
import '../blocs/pairing/pairing_bloc.dart';
import '../data_providers/Investor_Data_Provider.dart';
import '../data_providers/Pairing_Data_Provider.dart';
import '../repository/Investor_Repository.dart';
import '../repository/Pairing_Repositiory.dart';

class SearchStartups extends StatefulWidget {
  const SearchStartups({super.key});

  @override
  State<SearchStartups> createState() => _SearchStartupsState();
}

final TextEditingController _searchController = new TextEditingController();
@override
List<String> startups = ['startup 1', 'startUp 2'];
String searchTerm = '';

String authToken = "";
var investorBloc = InvestorBloc(
    investorRepository:
        InvestorRepository(investorDataProvider: InvestorDataProvider()));
var pairingBloc =
    PairingBloc(PairingRepository(pairingDataProvider: PairingDataProvider()));

class _SearchStartupsState extends State<SearchStartups> {
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String searchTerm = _searchController.text.toString();
    print(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Search Startups',
                style: TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  context.go("/investor");
                },
              ),
            ),
            body: BlocProvider<InvestorBloc>.value(
                value: investorBloc,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 280,
                                child: TextField(
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    labelText: 'Enter Startup Name',
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(90, 117, 117, 117)),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                )),
                            BlocConsumer<InvestorBloc, InvestorState>(
                                listener: (ctx, state) {},
                                builder: (ctx, state) {
                                  return IconButton(
                                    iconSize: 30,
                                    icon: const Icon(Icons.search),
                                    onPressed: () {
                                      BlocProvider.of<InvestorBloc>(ctx).add(
                                          StartupSearch(
                                              authToken: authToken,
                                              name: _searchController.text));
                                    },
                                  );
                                })
                          ],
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text(
                              'startup matching search',
                              style: TextStyle(fontSize: 17),
                            ),
                          )
                        ],
                      ),
                      SingleChildScrollView(
                        child: Container(
                          child: BlocProvider<InvestorBloc>.value(
                              value: investorBloc,
                              child: BlocConsumer<InvestorBloc, InvestorState>(
                                  listener: (ctx, state) {},
                                  builder: (ctx, state) {
                                    if (state is SearchSuccess) {
                                      final startups = state.startup;
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: startups.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ExpansionTile(
                                            title: Column(
                                              children: [
                                                Text(
                                                  startups[index].companyName,
                                                  style:
                                                      TextStyle(fontSize: 24.0),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Address'),
                                                    Text(
                                                        startups[index].address)
                                                  ],
                                                )
                                              ],
                                            ),
                                            initiallyExpanded: false,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        startups[index]
                                                            .description,
                                                        style: TextStyle(
                                                            fontSize: 24.0),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Industrial Stage',
                                                        style: TextStyle(
                                                            fontSize: 24.0),
                                                      ),
                                                      Text(
                                                        startups[index]
                                                            .companyStage,
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        startups[index]
                                                            .assistanceRequired
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 24.0),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          BlocProvider<
                                                                  PairingBloc>.value(
                                                              value:
                                                                  pairingBloc,
                                                              child: BlocConsumer<
                                                                  PairingBloc,
                                                                  PairingState>(
                                                                listener: (ctx,
                                                                    state) {},
                                                                builder: (ctx,
                                                                    state) {
                                                                  BlocProvider.of<PairingBloc>(ctx).add(PairingRequestStartup(
                                                                      authToken:
                                                                          authToken,
                                                                      startupEmail:
                                                                          startups[index]
                                                                              .email));
                                                                  return const Text(
                                                                      "");
                                                                },
                                                              ));
                                                        },
                                                        child: Text(
                                                            'Request to work with you'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.blue,
                                                          elevation: 3.0,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      return Container();
                                    }
                                  })),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
