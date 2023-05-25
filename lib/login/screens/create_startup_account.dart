import 'package:flutter/material.dart';
import '../models/create_startup_model.dart';

class CreateStartupAccountPage extends StatefulWidget {
  @override
  _CreateStartupAccountPageState createState() =>
      _CreateStartupAccountPageState();
}

class _CreateStartupAccountPageState extends State<CreateStartupAccountPage> {
  final _formKey = GlobalKey<FormState>();
  bool _fundingAssistance = false;
  bool _mentoringAssistance = false;
  bool _legalAssistance = false;
  String _otherAssistance = '';
  String _companyStage = '';

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
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  // Add additional address validation logic
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Founder(s)',
                ),
                validator: (value) {
                  // Add additional founder(s) validation logic
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Additional Information',
                ),
                maxLines: 3,
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text('Assistance Required'),
              Row(
                children: [
                  Radio(
                    value: 'funding',
                    groupValue: _otherAssistance,
                    onChanged: (value) {
                      setState(() {
                        _otherAssistance = value.toString();
                      });
                    },
                  ),
                  Text('Funding'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'mentoring',
                    groupValue: _otherAssistance,
                    onChanged: (value) {
                      setState(() {
                        _otherAssistance = value.toString();
                      });
                    },
                  ),
                  Text('Mentoring'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'legal',
                    groupValue: _otherAssistance,
                    onChanged: (value) {
                      setState(() {
                        _otherAssistance = value.toString();
                      });
                    },
                  ),
                  Text('Legal'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'other',
                    groupValue: _otherAssistance,
                    onChanged: (value) {
                      setState(() {
                        _otherAssistance = value.toString();
                      });
                    },
                  ),
                  Text('Other'),
                ],
              ),
              if (_otherAssistance == 'other')
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Specify Assistance',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Assistance details are required';
                    }
                    return null;
                  },
                ),
              SizedBox(height: 16.0),
              Text('Company Stage'),
              Row(
                children: [
                  Radio(
                    value: 'seed',
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
                    value: 'early_stage',
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
                    value: 'growth',
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
                    value: 'late_stage',
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
                    StartupModel startup = StartupModel(
                      email: 'email@example.com',
                      password: 'password',
                      companyName: 'Company Name',
                      phoneNumber: '1234567890',
                      address: 'Company Address',
                      founders: 'Founder 1, Founder 2',
                      additionalInfo: 'Additional Information',
                      assistanceRequired: _otherAssistance,
                      assistanceDetails: _otherAssistance == 'other'
                          ? 'Assistance Details'
                          : '',
                      companyStage: _companyStage,
                    );

                    // TODO: Save the startup model to the database or perform further actions

                    // Redirect to startup home page
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple[900],
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
