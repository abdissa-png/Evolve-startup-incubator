// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/create_investor_model.dart';

class CreateInvestorAccountPage extends StatefulWidget {
  @override
  _CreateInvestorAccountPageState createState() =>
      _CreateInvestorAccountPageState();
}

class _CreateInvestorAccountPageState extends State<CreateInvestorAccountPage> {
  final _formKey = GlobalKey<FormState>();
  InvestorModel _investor = InvestorModel(
      email: "",
      password: "",
      name: "",
      phoneNumber: "",
      description: "",
      interest: [],
      investmentStage: []);
  final List<bool> _assistanceChecked = [false, false, false, false];
  final List<String> _selectedAssistance = [];
  final List<bool> _stageChecked = [false, false, false, false];
  final List<String> _selectedStage = [];
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.purple[900],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
                onSaved: (value) {
                  _investor.email = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_passwordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }

                  return null;
                },
                onSaved: (value) {
                  _investor.password = value!;
                },
              ),
              SizedBox(height: 16.0),
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
                    return 'Investor name is required';
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
                          _selectedAssistance.remove("Funding");
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
                          _selectedAssistance.add("Mentoring");
                        } else {
                          _selectedAssistance.remove("Mentoring");
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
                          _selectedAssistance.add("Legal Assistance");
                        } else {
                          _selectedAssistance.remove("Legal Assistance");
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
              // if (_investor.interest == 'other')
              //   TextFormField(
              //     decoration: InputDecoration(
              //       labelText: 'Specify Interest',
              //     ),
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Interest details are required';
              //       }

              //       return null;
              //     },
              //     onSaved: (value) {
              //       _investor.otherInterest = value!;
              //     },
              //   ),
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
                          _selectedStage.remove("Early-Stage");
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
                    _investor.investmentStage = _selectedStage;
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[900],
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
