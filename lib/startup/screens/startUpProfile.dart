import 'package:flutter/material.dart';


import 'package:practice_flutter/models/startUpProfileModel.dart';







class CreateStartupAccountPage extends StatefulWidget {
  @override
  _CreateStartupAccountPageState createState() =>
      _CreateStartupAccountPageState();
}

class _CreateStartupAccountPageState extends State<CreateStartupAccountPage> {
  startUpProfileModel startUpProfile = startUpProfileModel();
  String companyName = '';
  String phoneNumber = '';
  String address = '';
  String founder = '';
  String description = '';
  List<bool> assistanceSelections = [false, false, false, false];
  String companyStage = '';

  List<String> assistanceOptions = [
    'Funding',
    'Mentoring',
    'Legal Assistance',
    'Other'
  ];

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
              Column(
                children: assistanceOptions.map((option) {
                  int index = assistanceOptions.indexOf(option);
                  return CheckboxListTile(
                    title: Text(option),
                    value: assistanceSelections[index],
                    onChanged: (value) {
                      setState(() {
                        assistanceSelections[index] = value!;
                      });
                    },
                  );
                }).toList(),
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
                title: Text('Early-Stage'),
                value: 'Early-Stage',
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
                title: Text('Late-Stage'),
                value: 'Late-Stage',
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
                    // Handle form submission
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
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
