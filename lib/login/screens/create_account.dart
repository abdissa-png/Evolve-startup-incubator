// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int _accountType = 0;

  void _navigateToAccountCreationPage() {
    if (_accountType == 0) {
      context.go("/signup/startup");
    } else {
      context.go("/signup/investor");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go("/login");
          },
        ),
        title: Text('Create Account'),
        backgroundColor: Colors.purple[900],
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Image(image: AssetImage('assets/images/logo.png'), height: 150.0),
          SizedBox(height: 40),
          Text(
            'Select account type you want to create',
            style: TextStyle(fontSize: 18.0),
          ),
          RadioListTile(
            title: Text('Startup'),
            value: 0,
            groupValue: _accountType,
            onChanged: (value) {
              setState(() {
                _accountType = value as int;
              });
            },
            activeColor: Colors.purple[900],
          ),
          RadioListTile(
            title: Text('Investor'),
            value: 1,
            groupValue: _accountType,
            onChanged: (value) {
              setState(() {
                _accountType = value as int;
              });
            },
            activeColor: Colors.purple[900],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: _navigateToAccountCreationPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[900],
            ),
            child: Text('Next'),
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
