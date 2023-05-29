// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/create_startup_model.dart';

class CreateStartupAccountPage extends StatefulWidget {
  @override
  _CreateStartupAccountPageState createState() =>
      _CreateStartupAccountPageState();
}

class _CreateStartupAccountPageState extends State<CreateStartupAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final List<bool> _isChecked = [false, false, false, false];
  final List<String> _selectedAssistance = [];
  String _companyStage = 'Seed';
  StartupModel _startup = StartupModel(
      address: "",
      founders: "",
      phoneNumber: "",
      assistanceRequired: [],
      companyName: "",
      companyStage: "",
      description: "",
      email: "",
      password: "");
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
                onSaved: (val) {
                  _startup.email = val!;
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
                onSaved: (val) {
                  _startup.password = val!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Company Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Company name is required';
                  }
                  return null;
                },
                onSaved: (val) {
                  _startup.companyName = val!;
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
                onSaved: (val) {
                  _startup.phoneNumber = val!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
                onSaved: (val) {
                  _startup.address = val!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Founder(s)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Founder(s) is required';
                  }
                  return null;
                },
                onSaved: (val) {
                  _startup.founders = val!;
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
                onSaved: (val) {
                  _startup.description = val!;
                },
              ),
              SizedBox(height: 16.0),
              Text('Assistance Required'),
              Row(
                children: [
                  Checkbox(
                    tristate: false,
                    value: _isChecked[0],
                    onChanged: (val) {
                      setState(() {
                        _isChecked[0] = val!;
                        if (val) {
                          _selectedAssistance.add("Funding");
                        } else {
                          _selectedAssistance.remove("Funding");
                        }
                      });
                    },
                  ),
                  Text('Funding'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    tristate: false,
                    value: _isChecked[1],
                    onChanged: (val) {
                      setState(() {
                        _isChecked[1] = val!;
                        if (val) {
                          _selectedAssistance.add("Mentoring");
                        } else {
                          _selectedAssistance.remove("Mentoring");
                        }
                      });
                    },
                  ),
                  Text("Mentoring")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    tristate: false,
                    value: _isChecked[2],
                    onChanged: (val) {
                      setState(() {
                        _isChecked[2] = val!;
                        if (val) {
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
                    value: _isChecked[3],
                    onChanged: (val) {
                      setState(() {
                        _isChecked[3] = val!;
                        if (val) {
                          _selectedAssistance.add("Other");
                        } else {
                          _selectedAssistance.remove("Other");
                        }
                      });
                    },
                  ),
                  Text('Other'),
                ],
              ),
              // if (_otherAssistance == 'other')
              //   TextFormField(
              //     decoration: InputDecoration(
              //       labelText: 'Specify Assistance',
              //     ),
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Assistance details are required';
              //       }
              //       return null;
              //     },
              //   ),
              SizedBox(height: 16.0),
              Text('Company Stage'),
              Row(
                children: [
                  Radio(
                    value: 'Seed',
                    groupValue: _companyStage,
                    onChanged: (value) {
                      setState(() {
                        _companyStage = value.toString();
                      });
                    },
                  ),
                  Text('Seed'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Early-Stage',
                    groupValue: _companyStage,
                    onChanged: (value) {
                      setState(() {
                        _companyStage = value.toString();
                      });
                    },
                  ),
                  Text('Early Stage'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Growth',
                    groupValue: _companyStage,
                    onChanged: (value) {
                      setState(() {
                        _companyStage = value.toString();
                      });
                    },
                  ),
                  Text('Growth'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Late-Stage',
                    groupValue: _companyStage,
                    onChanged: (value) {
                      setState(() {
                        _companyStage = value.toString();
                      });
                    },
                  ),
                  Text('Late Stage'),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Create startup model and save the data
                    _formKey.currentState!.save();
                    _startup.assistanceRequired = _selectedAssistance;
                    _startup.companyStage = _companyStage;
                    print(_startup.address);
                    print(_startup.assistanceRequired);
                    print(_startup.companyName);
                    print(_startup.companyStage);
                    print(_startup.description);
                    print(_startup.email);
                    print(_startup.founders);
                    print(_startup.password);
                    print(_startup.phoneNumber);
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
