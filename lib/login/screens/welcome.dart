// ignore_for_file: prefer_const_constructors

import 'package:evolve/login/blocs/auth_bloc.dart';
import 'package:evolve/login/blocs/auth_event.dart';
import 'package:evolve/login/blocs/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (_, state) {
          if (state is UnknownAuthState) {
            Future.delayed(Duration(seconds: 3), () {
              BlocProvider.of<AuthBloc>(context).add(AuthStarted());
            });
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: const [
                    Colors.purple,
                    Colors.blue,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 250,
                      height: 250,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ));
          }
        },
        listener: (_, state) {
          if (state is AuthRegisterState) {
            context.go("/login");
          }
          if (state is AuthenticatedAuthState) {
            if (state.auth.role == "admin") {
              context.go("/admin");
            }
            if (state.auth.role == "startup") {
              context.go("/startup");
            }
            if (state.auth.role == "investor") {
              context.go("/investor");
            }
          }
        },
      ),
    );
  }
}
