// ignore_for_file: prefer_const_constructors

import 'package:evolve/login/blocs/auth_bloc.dart';
import 'package:evolve/login/blocs/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/auth_state.dart';
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

  void signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Startup Incubator App'),
          backgroundColor: Colors.purple[900],
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          builder: (_, state) {
            if (state is AuthenticationLoadingState) {
              return const Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                  Text("Loading...")
                ],
              ));
            } else {
              return SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: 150.0),
                    Text(
                      'Sign in to your account',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: _isEmailValid
                            ? null
                            : 'Enter a valid email address',
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
                      onPressed: () {
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        LoginModel loginModel =
                            LoginModel(email: email, password: password);
                        bool isValid = loginModel.signIn();

                        setState(() {
                          _isEmailValid = isValid;
                          _isPasswordValid = isValid;
                        });

                        if (isValid) {
                          BlocProvider.of<AuthBloc>(context)
                              .add(AuthLogin(loginModel));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[900],
                      ),
                      child: Text('Sign In'),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            context.go("/createAccount");
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
              );
            }
          },
          listener: (_, state) {
            if (state is AuthenticatedAuthState) {
              if (state.auth.role == "startup") {
                context.go("/startup");
              }
              if (state.auth.role == "investor") {
                context.go("/investor");
              }
              if (state.auth.role == "admin") {
                context.go("/admin");
              }
            }
            if (state is UnauthenticatedAuthState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error.toString())));
            }
          },
        ));
  }
}
