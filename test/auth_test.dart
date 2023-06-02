import 'package:bloc_test/bloc_test.dart';
import 'package:evolve/login/blocs/auth_bloc.dart';
import 'package:evolve/login/blocs/auth_event.dart';
import 'package:evolve/login/blocs/auth_state.dart';
import 'package:evolve/login/models/auth_model.dart';
import 'package:evolve/login/models/create_investor_model.dart';
import 'package:evolve/login/models/create_startup_model.dart';
import 'package:evolve/login/models/login_model.dart';
import 'package:evolve/login/repository/Auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('AuthBloc', () {
    late AuthRepository authRepository;
    late AuthBloc authBloc;

    setUp(() {
      authRepository = MockAuthRepository();
      authBloc = AuthBloc(authRepository: authRepository);
    });

    tearDown(() {
      authBloc.close();
    });

    final LoginModel tLoginModel =
        LoginModel(email: 'test@test.com', password: 'password');
    final StartupModel tStartupModel = StartupModel(
      email: 'test@test.com',
      password: 'password',
      companyName: 'Test Company',
      phoneNumber: '1234567890',
      address: '123 Test Street',
      founders: 'Test Founder',
      description: 'Test Description',
      assistanceRequired: ['Assistance'],
      companyStage: 'Startup',
    );
    final InvestorModel tInvestorModel = InvestorModel(
      email: 'test@test.com',
      password: 'password',
      name: 'Test Name',
      phoneNumber: '1234567890',
      description: 'Test Description',
      interest: ['Interest'],
      investmentStage: ['Investment Stage'],
    );

    final tAuthModel = AuthModel(
      role: 'startup',
      authToken: 'authToken',
      refreshToken: 'refreshToken',
    );


blocTest<AuthBloc, AuthState>(
  'emits [UnauthenticatedAuthState] when AuthInvestorSignUp event is added and signup fails.',
  build: () {
    when(() => authRepository.investorSignup(tInvestorModel))
        .thenThrow('error');
    return authBloc;
  },
  act: (bloc) => bloc.add(AuthInvestorSignUp(tInvestorModel)),
  expect: () => <AuthState>[
    AuthenticationLoadingState(),
    UnauthenticatedAuthState('error'),
  ],
);
        blocTest<AuthBloc, AuthState>(
      'emits [UnauthenticatedAuthState] when AuthStartupSignUp event is added and signup fails.',
      build: () {
        when(() => authRepository.startupSignup(tStartupModel))
            .thenThrow('Error');
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthStartupSignUp(tStartupModel)),
      expect: () => <AuthState>[
        AuthenticationLoadingState(),
        const UnauthenticatedAuthState('Error'),
      ],
    );
     blocTest<AuthBloc, AuthState>(
      'emits [UnauthenticatedAuthState] when AuthLogin event is added and login fails.',
      build: () {
        when(() => authRepository.login(tLoginModel))
            .thenThrow('Error');
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthLogin(tLoginModel)),
      expect: () => <AuthState>[
        AuthenticationLoadingState(),
        UnauthenticatedAuthState('Error'),
      ],
    );
    



 blocTest<AuthBloc, AuthState>(
      'emits [AuthenticatedAuthState] when AuthLogin event is added and login succeeds.',
      build: () {
        when(() => authRepository.login(tLoginModel)).thenAnswer(
            (_) async => tAuthModel);
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthLogin(tLoginModel)),
      expect: () => <AuthState>[
        AuthenticationLoadingState(),
        AuthenticatedAuthState(tAuthModel),
      ],
    );

        blocTest<AuthBloc, AuthState>(
      'emits [AuthenticatedAuthState] when AuthStartupSignUp event is added and signup succeeds.',
      build: () {
        when(() => authRepository.startupSignup(tStartupModel)).thenAnswer(
            (_) async => tAuthModel);
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthStartupSignUp(tStartupModel)),
      expect: () => <AuthState>[
        AuthenticationLoadingState(),
        AuthenticatedAuthState(tAuthModel),
      ],
    );

        blocTest<AuthBloc, AuthState>(
      'emits [AuthenticatedAuthState] when AuthInvestorSignUp event is added and signup succeeds.',
      build: () {
        when(() => authRepository.investorSignup(tInvestorModel)).thenAnswer(
            (_) async => tAuthModel);
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthInvestorSignUp(tInvestorModel)),
      expect: () => <AuthState>[
 AuthenticationLoadingState(),
    AuthenticatedAuthState(tAuthModel),
  ],
);

blocTest<AuthBloc, AuthState>(
      'emits [UnknownAuthState] when AuthStarted hastoken is false',
      build: () {
        when(() => authRepository.hasToken()).thenAnswer((_) async => false);
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthStarted()),
      expect: () => <AuthState>[AuthRegisterState()],
    );
blocTest<AuthBloc, AuthState>(
  'emits AuthenticatedAuthState when AuthStarted hastoken is true',
  build: () {
    when(() => authRepository.hasToken()).thenAnswer((_) async => true);
    when(() => authRepository.fetchToken()).thenAnswer((_) async => tAuthModel);
    return authBloc;
  },
  act: (bloc) => bloc.add(AuthStarted()),
  expect: () => <AuthState>[AuthenticatedAuthState(tAuthModel)],
);

    
});
}