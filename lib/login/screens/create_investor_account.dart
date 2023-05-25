import 'package:flutter/material.dart';
import '../models/create_investor_model.dart';

class CreateInvestorAccountPage extends StatefulWidget {
  @override
  _CreateInvestorAccountPageState createState() =>
      _CreateInvestorAccountPageState();
}

class _CreateInvestorAccountPageState extends State<CreateInvestorAccountPage> {
  final _formKey = GlobalKey<FormState>();
  InvestorModel _investor = InvestorModel();

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
                  return null;
                },
                onSaved: (value) {
                  _investor.phoneNumber = value!;
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
                onSaved: (value) {
                  _investor.additionalInfo = value!;
                },
              ),
              SizedBox(height: 16.0),
              Text('Investment Interest'),
              Row(
                children: [
                  Radio(
                    value: 'funding',
                    groupValue: _investor.interest,
                    onChanged: (value) {
                      setState(() {
                        _investor.interest = value.toString();
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
                    groupValue: _investor.interest,
                    onChanged: (value) {
                      setState(() {
                        _investor.interest = value.toString();
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
                    groupValue: _investor.interest,
                    onChanged: (value) {
                      setState(() {
                        _investor.interest = value.toString();
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
                    groupValue: _investor.interest,
                    onChanged: (value) {
                      setState(() {
                        _investor.interest = value.toString();
                      });
                    },
                  ),
                  Text('Other'),
                ],
              ),
              if (_investor.interest == 'other')
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Specify Interest',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Interest details are required';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    _investor.otherInterest = value!;
                  },
                ),
              SizedBox(height: 16.0),
              Text('Investment Stage'),
              Row(
                children: [
                  Radio(
                    value: 'seed',
                    groupValue: _investor.investmentStage,
                    onChanged: (value) {
                      setState(() {
                        _investor.investmentStage = value.toString();
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
                    groupValue: _investor.investmentStage,
                    onChanged: (value) {
                      setState(() {
                        _investor.investmentStage = value.toString();
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
                    groupValue: _investor.investmentStage,
                    onChanged: (value) {
                      setState(() {
                        _investor.investmentStage = value.toString();
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
                    groupValue: _investor.investmentStage,
                    onChanged: (value) {
                      setState(() {
                        _investor.investmentStage = value.toString();
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
                    _formKey.currentState!.save();
                    // Process the investor data
                    // Example: createAccount(_investor);
                    // Redirect to investor home page
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
