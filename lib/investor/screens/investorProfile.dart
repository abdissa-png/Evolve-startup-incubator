// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../login/blocs/blocs.dart';
import '../blocs/investor/blocs.dart';
import '../blocs/investor/investor_bloc.dart';
import '../data_providers/Investor_Data_Provider.dart';
import '../models/investorprofileModel.dart';
import '../repository/Investor_Repository.dart';

class InvestorProfileWidget extends StatefulWidget {
  @override
  _InvestorProfileState createState() => _InvestorProfileState();
}

class _InvestorProfileState extends State<InvestorProfileWidget> {
  final _formKey = GlobalKey<FormState>();
  var investorBloc = InvestorBloc(
      investorRepository:
          InvestorRepository(investorDataProvider: InvestorDataProvider()));
  String authToken = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthenticatedAuthState) {
            authToken = state.auth.authToken;
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Update Account'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  context.go("/investor");
                },
              ),
            ),
            body: BlocProvider<InvestorBloc>.value(
                value: investorBloc,
                child: BlocConsumer<InvestorBloc, InvestorState>(
                    listener: (ctx, state) {},
                    builder: (ctx, state) {
                      if (state is InvestorStarted) {
                        BlocProvider.of<InvestorBloc>(ctx)
                            .add(InvestorProfileLoad(authToken: authToken));
                        return Container();
                      } else if (state is ProfileLoaded) {
                        final profile = state.investor;
                        InvestorModel _investor = InvestorModel(
                            name: profile.name,
                            phoneNumber: profile.phoneNumber,
                            description: profile.description,
                            interest: [],
                            investmentStage: []);
                        final List<bool> _assistanceChecked = [
                          profile.interest.contains("Funding"),
                          profile.interest.contains("Mentoring"),
                          profile.interest.contains("Legal Assistance"),
                          profile.interest.contains("Other")
                        ];
                        final List<String> _selectedAssistance =
                            profile.interest;
                        final List<bool> _stageChecked = [
                          profile.investmentStage.contains("Seed"),
                          profile.investmentStage.contains("Early-Stage"),
                          profile.investmentStage.contains("Growth"),
                          profile.investmentStage.contains("Late-Stage")
                        ];
                        final List<String> _selectedStage =
                            profile.investmentStage;
                        return SingleChildScrollView(
                          padding: EdgeInsets.all(16.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Investor Name',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Investor name is required';
                                    }

                                    return null;
                                  },
                                  onSaved: (value) {
                                    _investor.name = value!;
                                  },
                                ),
                                SizedBox(height: 16.0),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Phone number is required';
                                    }

                                    return null;
                                  },
                                  onSaved: (value) {
                                    _investor.phoneNumber = value!;
                                  },
                                ),
                                SizedBox(height: 16.0),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Description',
                                  ),
                                  maxLines: 7,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Description is required';
                                    }

                                    return null;
                                  },
                                  onSaved: (value) {
                                    _investor.description = value!;
                                  },
                                ),
                                SizedBox(height: 16.0),
                                Text('Investment Interest'),
                                Row(
                                  children: [
                                    Checkbox(
                                      tristate: false,
                                      value: _assistanceChecked[0],
                                      onChanged: (value) {
                                        setState(() {
                                          _assistanceChecked[0] = value!;
                                          if (value) {
                                            _selectedAssistance.add("Funding");
                                          } else {
                                            _selectedAssistance
                                                .remove("Funding");
                                          }
                                        });
                                      },
                                    ),
                                    Text('Funding')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      tristate: false,
                                      value: _assistanceChecked[1],
                                      onChanged: (value) {
                                        setState(() {
                                          _assistanceChecked[1] = value!;
                                          if (value) {
                                            _selectedAssistance
                                                .add("Mentoring");
                                          } else {
                                            _selectedAssistance
                                                .remove("Mentoring");
                                          }
                                        });
                                      },
                                    ),
                                    Text('Mentoring')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      tristate: false,
                                      value: _assistanceChecked[2],
                                      onChanged: (value) {
                                        setState(() {
                                          _assistanceChecked[2] = value!;
                                          if (value) {
                                            _selectedAssistance
                                                .add("Legal Assistance");
                                          } else {
                                            _selectedAssistance
                                                .remove("Legal Assistance");
                                          }
                                        });
                                      },
                                    ),
                                    Text('Legal Assistance')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      tristate: false,
                                      value: _assistanceChecked[3],
                                      onChanged: (value) {
                                        setState(() {
                                          _assistanceChecked[3] = value!;
                                          if (value) {
                                            _selectedAssistance.add("Other");
                                          } else {
                                            _selectedAssistance.remove("Other");
                                          }
                                        });
                                      },
                                    ),
                                    Text('Other')
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                Text('Investment Stage'),
                                Row(
                                  children: [
                                    Checkbox(
                                      tristate: false,
                                      value: _stageChecked[0],
                                      onChanged: (value) {
                                        setState(() {
                                          _stageChecked[0] = value!;
                                          if (value) {
                                            _selectedStage.add("Seed");
                                          } else {
                                            _selectedStage.remove("Seed");
                                          }
                                        });
                                      },
                                    ),
                                    Text('Seed')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      tristate: false,
                                      value: _stageChecked[1],
                                      onChanged: (value) {
                                        setState(() {
                                          _stageChecked[1] = value!;
                                          if (value) {
                                            _selectedStage.add("Early-Stage");
                                          } else {
                                            _selectedStage
                                                .remove("Early-Stage");
                                          }
                                        });
                                      },
                                    ),
                                    Text('Early-Stage')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      tristate: false,
                                      value: _stageChecked[2],
                                      onChanged: (value) {
                                        setState(() {
                                          _stageChecked[2] = value!;
                                          if (value) {
                                            _selectedStage.add("Growth");
                                          } else {
                                            _selectedStage.remove("Growth");
                                          }
                                        });
                                      },
                                    ),
                                    Text('Growth')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      tristate: false,
                                      value: _stageChecked[3],
                                      onChanged: (value) {
                                        setState(() {
                                          _stageChecked[3] = value!;
                                          if (value) {
                                            _selectedStage.add("Late-Stage");
                                          } else {
                                            _selectedStage.remove("Late-Stage");
                                          }
                                        });
                                      },
                                    ),
                                    Text('Late-Stage')
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      _investor.interest = _selectedAssistance;
                                      _investor.investmentStage =
                                          _selectedStage;
                                      BlocProvider.of<InvestorBloc>(ctx).add(
                                          InvestorProfileUpdate(
                                              authToken: authToken,
                                              investor: _investor));
                                      // Process the investor data
                                      // Example: createAccount(_investor);
                                      // Redirect to investor home page
                                      // print(_investor.description);
                                      // print(_investor.email);
                                      // print(_investor.interest);
                                      // print(_investor.investmentStage);
                                      // print(_investor.name);
                                      // print(_investor.password);
                                      // print(_investor.phoneNumber);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(),
                                  child: Text(
                                    'Update Account',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    })),
          );
        });
  }
}
