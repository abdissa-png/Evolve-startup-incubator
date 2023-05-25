import 'package:flutter/material.dart';

import '../models/startUpProfileModel.dart';
class startUpProfile extends StatefulWidget {
  @override
  _startUpProfileState createState() => _startUpProfileState();
}

class _startUpProfileState extends State<startUpProfile> {
  startUpProfileModel startUpProfile = startUpProfileModel();
  String companyName = '';
  String phoneNumber = '';
  String address = '';
  String founder = '';
  String description = '';
  bool fundingAssistance = false;
  bool mentoringAssistance = false;
  bool legalAssistance = false;
  bool otherAssistance = false;
  String companyStage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 85, 255),
        title: Text('Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    companyName = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Company Name',
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    address = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    founder = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Founder',
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                 maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Description of Yourself',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Assistance Required',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              CheckboxListTile(
                title: Text('Funding'),
                value: fundingAssistance,
                onChanged: (value) {
                  setState(() {
                    fundingAssistance = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Mentoring'),
                value: mentoringAssistance,
                onChanged: (value) {
                  setState(() {
                    mentoringAssistance = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Legal Assistance'),
                value: legalAssistance,
                onChanged: (value) {
                  setState(() {
                    legalAssistance = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Other'),
                value: otherAssistance,
                onChanged: (value) {
                  setState(() {
                    otherAssistance = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Company Stage',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              RadioListTile(
                title: Text('Seed'),
                value: 'Seed',
                groupValue: companyStage,
                onChanged: (value) {
                  setState(() {
                    companyStage = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('Early Stage'),
                value: 'Early Stage',
                groupValue: companyStage,
                onChanged: (value) {
                  setState(() {
                    companyStage = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('Growth'),
                value: 'Growth',
                groupValue: companyStage,
                onChanged: (value) {
                  setState(() {
                    companyStage = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('Late Stage'),
                value: 'Late Stage',
                groupValue: companyStage,
                onChanged: (value) {
                  setState(() {
                    companyStage = value.toString();
                  });
                },
              ),
              SizedBox(height: 16.0),
              Center(
      child: ElevatedButton(
        onPressed: () {
         
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0), 
          textStyle: TextStyle(fontSize: 18.0), 
        ),
        child: Text('Create Account'),
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: startUpProfile(),
  ));
}
