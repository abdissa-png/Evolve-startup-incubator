import 'package:evolve/login/data_providers/Auth_Data_Provider.dart';
import 'package:evolve/login/models/auth_model.dart';
import 'package:evolve/login/models/create_investor_model.dart';
import 'package:evolve/login/models/create_startup_model.dart';
import 'package:evolve/login/models/login_model.dart';
import 'package:evolve/login/repository/Auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:evolve/login/blocs/auth_bloc.dart';
import 'package:evolve/login/blocs/auth_event.dart';
import 'package:evolve/login/blocs/auth_state.dart';
import 'package:evolve/login/screens/create_startup_account.dart';

void main() {
  group('CreateStartupAccountPage', () {
    late AuthBloc authBloc;

    setUp(() {
      authBloc = AuthBloc(authRepository: AuthRepository(AuthDataProvider()));
    });

    tearDown(() {
      authBloc.close();
    });

    testWidgets('Valid form submission triggers AuthStartupSignUp event',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthBloc>.value(
            value: authBloc,
            child: CreateStartupAccountPage(),
          ),
        ),
      );

      // Fill in the form fields
      await tester.enterText(
          find.byKey(ValueKey('email_field')), 'test@example.com');
      await tester.enterText(
          find.byKey(ValueKey('password_field')), 'password123');
      await tester.enterText(
          find.byKey(ValueKey('company_name_field')), 'My Company');
      await tester.enterText(
          find.byKey(ValueKey('phone_number_field')), '1234567890');
      await tester.enterText(
          find.byKey(ValueKey('address_field')), '123 Main St');
      await tester.enterText(
          find.byKey(ValueKey('founders_field')), 'John Doe');
      await tester.enterText(
          find.byKey(ValueKey('description_field')), 'A description');

      // Check the checkboxes
      await tester.tap(find.byKey(ValueKey('funding_checkbox')));
      await tester.tap(find.byKey(ValueKey('mentoring_checkbox')));

      // Select a radio button
      await tester.tap(find.byKey(ValueKey('company_stage_seed')));

      // Submit the form
      await tester.tap(find.byKey(ValueKey('create_account_button')));
      await tester.pumpAndSettle();

      // Verify that the AuthStartupSignUp event was triggered with the correct data
      expect(authBloc.state, isA<AuthenticationLoadingState>());
      expect(
        authBloc,
        emitsInOrder([
          AuthStartupSignUp(
            StartupModel(
              email: 'test@example.com',
              password: 'password123',
              companyName: 'My Company',
              phoneNumber: '1234567890',
              address: '123 Main St',
              founders: 'John Doe',
              description: 'A description',
              assistanceRequired: ['Funding', 'Mentoring'],
              companyStage: 'Seed',
            ),
          ),
        ]),
      );
    });
  });
}
