import 'package:evolve/admin/screens/viewComplaints.dart';
import 'package:evolve/login/blocs/auth_event.dart';
import 'package:evolve/login/models/auth_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:evolve/admin/blocs/message bloc/blocs.dart';
import 'package:evolve/admin/repository/Message_Repository.dart';
import 'package:evolve/login/blocs/auth_bloc.dart';
import 'package:evolve/login/blocs/auth_state.dart';
import 'package:evolve/admin/screens/viewComplaints.dart';

// Create a mock of the MessageBloc
class MockMessageBloc extends Mock implements MessageBloc {}

// Create a mock of the AuthBloc
class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  late MockMessageBloc mockMessageBloc;
  late MockAuthBloc mockAuthBloc;

  setUp(() {
    // Initialize the mock messageBloc and authBloc
    mockMessageBloc = MockMessageBloc();
    mockAuthBloc = MockAuthBloc();
  });

  testWidgets('Complaints - Authenticated state', (WidgetTester tester) async {
    // Provide the mock authBloc to the Complaints widget
    await tester.pumpWidget(
      Complaints(),
    );

    // Set the auth state to AuthenticatedAuthState
    // when(mockAuthBloc.state).thenReturn(
    //   AuthenticatedAuthState(
    //     auth:
    //         AuthModel(authToken: 'your_auth_token', refreshToken: '', role: ''),
    //   ),
    // );

    // Pump the widget again to rebuild with the new auth state
    await tester.pump();

    // Expect the widget to have the expected UI elements
    expect(find.text('Complaints'), findsOneWidget);

    // You can perform more widget tests for different scenarios and interactions
  });

  testWidgets('Complaints - Unauthenticated state',
      (WidgetTester tester) async {
    // Provide the mock authBloc to the Complaints widget
    await tester.pumpWidget(
      Complaints(),
    );

    // Set the auth state to UnauthenticatedAuthState
    // when(mockAuthBloc.state).thenReturn(UnauthenticatedAuthState());

    // Pump the widget again to rebuild with the new auth state
    await tester.pump();

    // Expect the widget to navigate to the login page
    verify(mockAuthBloc.add(AuthLogoutRequested())).called(1);
    expect(find.text('Complaints'), findsNothing);

    // You can perform more widget tests for different scenarios and interactions
  });

  tearDown(() {
    mockMessageBloc.close();
    mockAuthBloc.close();
  });
}
