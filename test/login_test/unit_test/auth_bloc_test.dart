import 'package:flutter_test/flutter_test.dart';
import 'package:evolve/login/blocs/auth_bloc.dart';
import 'package:evolve/login/blocs/auth_event.dart';
import 'package:evolve/login/blocs/auth_state.dart';
import 'package:evolve/login/models/auth_model.dart';
import 'package:evolve/login/models/login_model.dart';
import 'package:evolve/login/repository/Auth_repository.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthBloc authBloc;
  late AuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    authBloc = AuthBloc(authRepository: mockAuthRepository);
  });

  tearDown(() {
    authBloc.close();
  });

  test('initial state is UnknownAuthState', () {
    expect(authBloc.state, equals(UnknownAuthState()));
  });

  test(
    'emits AuthenticatedAuthState when AuthStarted event is added with a valid token',
    () async {
     
      final authModel = AuthModel(
        role: 'startup',
        authToken: 'validAuthToken',
        refreshToken: 'validRefreshToken',
      );

      when(mockAuthRepository.hasToken()).thenAnswer((_) async => true);
      when(mockAuthRepository.fetchToken()).thenAnswer((_) async => authModel);

      
      authBloc.add(AuthStarted());

      
      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthenticationLoadingState(),
          AuthenticatedAuthState(authModel),
        ]),
      );
    },
  );

  test(
    'emits AuthRegisterState when AuthStarted event is added with no token',
    () async {
      
      when(mockAuthRepository.hasToken()).thenAnswer((_) async => false);

      
      authBloc.add(AuthStarted());

      // Assert
      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthenticationLoadingState(),
          AuthRegisterState(),
        ]),
      );
    },
  );

  test(
    'emits AuthenticatedAuthState when AuthLogin event is added and login succeeds',
    () async {
      
      final loginModel = LoginModel(
        email: 'test@example.com',
        password: 'password',
      );
      final authModel = AuthModel(
        role: 'startup',
        authToken: 'validAuthToken',
        refreshToken: 'validRefreshToken',
      );

      when(mockAuthRepository.login(loginModel))
          .thenAnswer((_) async => authModel);

      
      authBloc.add(AuthLogin(loginModel));

      
      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthenticationLoadingState(),
          AuthenticatedAuthState(authModel),
        ]),
      );
    },
  );

  test(
    'emits UnauthenticatedAuthState when AuthLogin event is added and login fails',
    () async {
      // Arrange
      final loginModel = LoginModel(
        email: 'test@example.com',
        password: 'password',
      );
      final error = 'Invalid credentials';

      when(mockAuthRepository.login(loginModel)).thenThrow(error);

      
      authBloc.add(AuthLogin(loginModel));

   
      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthenticationLoadingState(),
          UnauthenticatedAuthState(error),
        ]),
      );
    },
  );

 
}
