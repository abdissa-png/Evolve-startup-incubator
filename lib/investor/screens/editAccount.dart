import 'package:evolve/investor/blocs/investor/blocs.dart';
import 'package:evolve/investor/data_providers/Investor_Data_Provider.dart';
import 'package:evolve/investor/repository/Investor_Repository.dart';
import 'package:evolve/investor/screens/searchStartUps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../login/blocs/blocs.dart';

class InvestorEditAccountWidget extends StatefulWidget {
  @override
  _EditAccountWidgetState createState() => _EditAccountWidgetState();
}

class _EditAccountWidgetState extends State<InvestorEditAccountWidget> {
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final investorBloc = InvestorBloc(
      investorRepository:
          InvestorRepository(investorDataProvider: InvestorDataProvider()));
  String authToken = "";
  bool obscurePass = true;
  bool obscureConfirm = true;
  bool obscureOld = true;

  bool _mismatch = false;

  String? passPossible(String? val) {
    if (val == null || val.isEmpty) {
      return 'Field required!';
    } else if (val.length < 6) {
      return 'Too short! At least 8 characters required';
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    oldPassController.addListener(() {});
    newPassController.addListener(() {});
    confirmPassController.addListener(() {});
  }

  @override
  void dispose() {
    oldPassController.dispose();
    newPassController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

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
              title: Text('Edit Account'),
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
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: oldPassController,
                      obscureText: obscureOld,
                      decoration: InputDecoration(
                        labelText: 'Old Password',
                        suffixIcon: InkWell(
                          onTap: () => setState(() => obscureOld = !obscureOld),
                          child: Icon(obscureOld
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                        ),
                      ),
                      validator: (value) {
                        return passPossible(value);
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: newPassController,
                      obscureText: obscurePass,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        suffixIcon: InkWell(
                          onTap: () =>
                              setState(() => obscurePass = !obscurePass),
                          child: Icon(obscurePass
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                        ),
                      ),
                      validator: (value) {
                        return passPossible(value);
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: confirmPassController,
                      obscureText: obscureConfirm,
                      decoration: InputDecoration(
                        labelText: 'Re-enter New Password',
                        suffixIcon: InkWell(
                          onTap: () =>
                              setState(() => obscureConfirm = !obscureConfirm),
                          child: Icon(obscureConfirm
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                        ),
                      ),
                      validator: (value) {
                        return passPossible(value);
                      },
                    ),
                    Visibility(
                      visible: _mismatch,
                      child: Row(
                        children: [
                          Icon(Icons.warning),
                          Text(
                            "The new Password and re-entry password do not match",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (newPassController.text ==
                            confirmPassController.text) {
                          BlocProvider<InvestorBloc>.value(
                            value: investorBloc,
                            child: BlocConsumer<InvestorBloc, InvestorState>(
                              listener: (ctx, state) {},
                              builder: (ctx, state) {
                                BlocProvider.of<InvestorBloc>(ctx).add(
                                    InvestorChangePassword(
                                        authToken: authToken,
                                        oldPassword: oldPassController.text,
                                        newPassword: newPassController.text));
                                return Text("");
                              },
                            ),
                          );
                        } else {
                          setState(() {
                            _mismatch = true;
                          });
                        }
                      },
                      child: Text('Change password'),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider<InvestorBloc>.value(
                          value: investorBloc,
                          child: BlocConsumer<InvestorBloc, InvestorState>(
                            listener: (ctx, state) {},
                            builder: (ctx, state) {
                              BlocProvider.of<InvestorBloc>(ctx).add(
                                  InvestorDeleteAccount(authToken: authToken));
                              return Text("");
                            },
                          ),
                        );
                      },
                      child: Text('Delete Account'),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
