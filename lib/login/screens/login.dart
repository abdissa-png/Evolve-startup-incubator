import 'package:flutter/material.dart';
import '../models/login_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signIn() {
    String email = _emailController.text;
    String password = _passwordController.text;

    LoginModel loginModel = LoginModel(email: email, password: password);
    bool isValid = loginModel.signIn();

    setState(() {
      _isEmailValid = isValid;
      _isPasswordValid = isValid;
    });

    if (isValid) {
      // Perform sign-in logic here
      // Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Incubator App'),
        backgroundColor: Colors.purple[900],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/investor.png'),
            ),
            Text(
              'Sign in to your account',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _isEmailValid ? null : 'Enter a valid email address',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _isPasswordValid
                    ? null
                    : 'Password must be at least 6 characters',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: signIn,
              child: Text('Sign In'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[900],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/createAccount');
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.purple[900],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
