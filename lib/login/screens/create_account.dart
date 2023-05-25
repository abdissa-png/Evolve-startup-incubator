import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int _accountType = 0;

  void _navigateToAccountCreationPage() {
    if (_accountType == 0) {
      // Navigator.pushNamed(context, '/createStartupAccount');
    } else {
      // Navigator.pushNamed(context, '/createInvestorAccount');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: Colors.purple[900],
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Image(
            image: AssetImage('assets/investor.png'),
          ),
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
            child: Text('Next'),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple[900],
            ),
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
