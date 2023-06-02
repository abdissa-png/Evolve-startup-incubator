import 'package:evolve/investor/blocs/pairing/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../login/blocs/blocs.dart';
import '../blocs/pairing/pairing_bloc.dart';
import '../data_providers/Pairing_Data_Provider.dart';
import '../models/pairingModel.dart';
import '../repository/Pairing_Repositiory.dart';

class InvestorPairedupStartupsWidget extends StatefulWidget {
  const InvestorPairedupStartupsWidget({Key? key}) : super(key: key);
  @override
  _PairedupStartupsWidgetState createState() => _PairedupStartupsWidgetState();
}

class _PairedupStartupsWidgetState
    extends State<InvestorPairedupStartupsWidget> {
  var pairingBloc = PairingBloc(
      PairingRepository(pairingDataProvider: PairingDataProvider()));
  String authToken = "";
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // @override
  // void initState() {
  //   super.initState();
  //   _model = createModel(context, () => PairedupStartupsModel());
  // }

  // @override
  // void dispose() {
  //   _model.dispose();

  //   _unfocusNode.dispose();
  //   super.dispose();
  // }
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
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () async {
                    context.go("/investor");
                  },
                ),
                title: const Text(
                  'Paired Startups',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: const [],
                centerTitle: false,
                elevation: 0,
              ),
              body: SafeArea(
                top: true,
                child: BlocProvider<PairingBloc>.value(
                    value: pairingBloc,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          BlocConsumer<PairingBloc, PairingState>(
                              listener: (ctx, state) {},
                              builder: (ctx, state) {
                                if (state is PairingStarted) {
                                  BlocProvider.of<PairingBloc>(ctx).add(
                                      PairingGetPairedStartups(
                                          authToken: authToken));
                                  return Container();
                                } else if (state is PairedStartupsLoaded) {
                                  final startups = state.startups;
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: startups.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        title: Text(
                                          startups[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          startups[index].email,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        tileColor: Colors.white,
                                        dense: false,
                                      );
                                    },
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                        ],
                      ),
                    )),
              ),
            );
          }
        });
  }
}
