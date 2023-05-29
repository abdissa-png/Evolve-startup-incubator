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

  bool _mismatch = false;

  String? passPossible(String? val) {
    if (val == null || val.isEmpty) {
      return 'Field required!';
    } else if (val.length < 8) {
      return 'Too short! At least 8 characters required';
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
      body:SingleChildScrollView(
      child:Padding(
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
                  onTap: () => setState(() => obscurePass = !obscurePass),
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
                  onTap: () => setState(() => obscureConfirm = !obscureConfirm),
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
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (newPassController.text == confirmPassController.text) {
                  // Change password logic here
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
              onPressed: () {},
              child: Text('Delete Account'),
            ),
          ],
        ),
      ),
        
        )
    );
      
  }
}
