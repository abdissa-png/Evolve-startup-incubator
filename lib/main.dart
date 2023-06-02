import 'package:evolve/investor/screens/investorhomepage.dart';
import 'package:evolve/startup/screens/startUPHomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'login/blocs/auth_bloc.dart';
import 'login/data_providers/Auth_Data_Provider.dart';
import 'package:flutter/material.dart';

import 'login/repository/Auth_repository.dart';
import 'login/screens/screens.dart';
import 'package:evolve/admin/screens/screens.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final authBloc = AuthBloc(authRepository: AuthRepository(AuthDataProvider()));
  final _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => WelcomePage(),
    ),
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(
      path: '/createAccount',
      builder: (context, state) => CreateAccountPage(),
    ),
    GoRoute(
      path: '/signup/startup',
      builder: (context, state) => CreateStartupAccountPage(),
    ),
    GoRoute(
      path: '/signup/investor',
      builder: (context, state) => CreateInvestorAccountPage(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => AdminHomePage(),
    ),
    GoRoute(
      path: '/admin/createPost/:email',
      builder: (context, state) =>
          CreatePost(email: state.pathParameters['email']!),
    ),
    GoRoute(
        path: '/admin/removeUser', builder: (context, state) => RemoveUser()),
    GoRoute(
      path: '/admin/getComplaint',
      builder: (context, state) => Complaints(),
    ),
    GoRoute(
      path: '/startup',
      builder: (context, state) => StartUpHomePageWidget(),
    ),
    GoRoute(
      path: '/investor',
      builder: (context, state) => InvestorhomepageWidget(),
    )
  ]);
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: authBloc,
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false, routerConfig: _router));
  }
}
