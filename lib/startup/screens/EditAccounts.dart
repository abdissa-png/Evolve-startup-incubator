import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../models/EditAccountsModel.dart';
import 'package:flutter/material.dart';
import '../models/EditAccountsModel.dart';



class EditAccountWidget extends StatefulWidget {
  @override
  _EditAccountWidgetState createState() => _EditAccountWidgetState();
}

class _EditAccountWidgetState extends State<EditAccountWidget> {
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  bool obscurePass = true;
  bool obscureConfirm = true;
  bool obscureOld = true;

  bool _passwordMismatch = false;
  bool _shortPassword = false;

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field required!';
    } else if (value.length < 6) {
      return 'Too short! At least 6 characters required';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: newPassController,
                obscureText: obscurePass,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  suffixIcon: InkWell(
                    onTap: () => setState(() => obscurePass = !obscurePass),
                    child: Icon(obscurePass
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                ),
                validator: (value) {
                  final passwordError = validatePassword(value);
                  if (passwordError != null) {
                    setState(() {
                      _shortPassword = true;
                    });
                  } else {
                    setState(() {
                      _shortPassword = false;
                    });
                  }
                  return passwordError;
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
                  if (value != newPassController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Visibility(
                visible: _passwordMismatch || _shortPassword,
                child: Row(
                  children: [
                    Icon(Icons.warning),
                    Text(
                      _shortPassword
                          ? "Password must be at least 6 characters long"
                          : "The new Password and re-entry password do not match",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _passwordMismatch = newPassController.text != confirmPassController.text;
                    _shortPassword = newPassController.text.length < 6;
                  });

                  if (!_passwordMismatch && !_shortPassword) {
                    // Change password logic here
                  }
                },
                child: Text('Change password'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text('Delete Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
