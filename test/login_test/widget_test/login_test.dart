import 'package:flutter_test/flutter_test.dart';
import 'package:evolve/login/screens/login.dart';
import 'package:evolve/login/blocs/auth_bloc.dart';
import 'package:evolve/login/blocs/auth_event.dart';
import 'package:evolve/login/blocs/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evolve/login/repository/Auth_repository.dart';
import 'package:evolve/login/data_providers/Auth_Data_Provider.dart';

void main() {
  group('LoginPage', () {
    late AuthBloc authBloc;

    setUp(() {
      final authDataProvider = AuthDataProvider();

      final authRepository = AuthRepository(authDataProvider);

      authBloc = AuthBloc(authRepository: authRepository);
    });

    tearDown(() {
      authBloc.close();
    });

    testWidgets('Renders sign-in form', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<AuthBloc>.value(
              value: authBloc,
              child: LoginPage(),
            ),
          ),
        ),
      );

      expect(find.text('Sign in to your account'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('Invalid email and password shows error',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<AuthBloc>.value(
              value: authBloc,
              child: LoginPage(),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).first, 'invalidemail');
      await tester.enterText(find.byType(TextField).last, 'short');

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Enter a valid email address'), findsOneWidget);
      expect(
          find.text('Password must be at least 6 characters'), findsOneWidget);
    });

    testWidgets('Valid email and password triggers sign-in',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<AuthBloc>.value(
              value: authBloc,
              child: LoginPage(),
            ),
          ),
        ),
      );

      
      await tester.enterText(
          find.byType(TextField).first, 'validemail@example.com');
      await tester.enterText(find.byType(TextField).last, 'validpassword');

      
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      
      expect(
        authBloc,
        emitsInOrder([
          isA<AuthenticationLoadingState>(),
          isA<AuthenticatedAuthState>(),
        ]),
      );
    });
  });
}
