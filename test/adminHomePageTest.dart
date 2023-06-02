import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:evolve/admin/blocs/message%20bloc/blocs.dart';
import 'package:evolve/admin/repository/Message_Repository.dart';
import 'package:evolve/admin/data_providers/Message_Data_Provider.dart';
import 'package:evolve/login/blocs/blocs.dart';
import 'package:evolve/login/models/auth_model.dart';
import 'package:evolve/admin/screens/adminHomePage.dart';

// Create a mock of the AuthBloc
class MockAuthBloc extends Mock implements AuthBloc {}

// var error = Error();
void main() {
  late AuthBloc mockAuthBloc;

  setUp(() {
    // Initialize the mock authBloc
    mockAuthBloc = MockAuthBloc();
  });

  testWidgets('AdminHomePage - Authenticated state',
      (WidgetTester tester) async {
    // Create a mock MessageBloc and its dependencies
    final messageDataProvider = MessageDataProvider();
    final messageRepository = MessageRepository(messageDataProvider);
    final messageBloc = MessageBloc(messageRepository);

    // Provide the mock authBloc to the AdminHomePage widget
    await tester.pumpWidget(
      AdminHomePage(
          // authBloc: mockAuthBloc,
          // messageBloc: messageBloc,
          // goRouter: GoRouter(
          //   routes: const {},
          // ),
          ),
    );

    // Set the auth state to AuthenticatedAuthState
    // when(mockAuthBloc.state).thenReturn(
    //     AuthenticatedAuthState(auth: Auth(authToken: 'your_auth_token')));
    when(mockAuthBloc.state).thenReturn(AuthenticatedAuthState(
        AuthModel(authToken: 'your_auth_token', refreshToken: '', role: '')));

    // Pump the widget again to rebuild with the new auth state
    await tester.pump();

    // Expect the widget to have the expected UI elements
    expect(find.text('Hello,Admin'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
    expect(find.text('Your Posts'), findsOneWidget);
    expect(find.text('No posts loaded'), findsOneWidget);

    // You can perform more widget tests for different scenarios and interactions
  });

  testWidgets('AdminHomePage - Unauthenticated state',
      (WidgetTester tester) async {
    // Create a mock MessageBloc and its dependencies
    final messageDataProvider = MessageDataProvider();
    final messageRepository = MessageRepository(messageDataProvider);
    final messageBloc = MessageBloc(messageRepository);

    // Provide the mock authBloc to the AdminHomePage widget
    await tester.pumpWidget(
      AdminHomePage(
          // authBloc: mockAuthBloc,
          // messageBloc: messageBloc,
          // goRouter: GoRouter(
          //   routes: const {},
          // ),
          ),
    );

    // Set the auth state to UnauthenticatedAuthState
    var error;
    when(mockAuthBloc.state)
        .thenReturn(UnauthenticatedAuthState({error: "Error"}));

    // Pump the widget again to rebuild with the new auth state
    await tester.pump();

    // Expect the widget to navigate to the login page
    verify(mockAuthBloc.add(AuthLogoutRequested())).called(1);
    expect(find.text('Hello,Admin'), findsNothing);
    expect(find.text('Logout'), findsNothing);
    expect(find.text('Your Posts'), findsNothing);
    expect(find.text('No posts loaded'), findsNothing);

    // You can perform more widget tests for different scenarios and interactions
  });

  // Add more test cases as needed

  tearDown(() {
    mockAuthBloc.close();
  });
}
