import 'package:evolve/login/repository/Auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/auth_model.dart';
import 'blocs.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnknownAuthState()) {
    on<AuthStarted>(
      (event, emit) async {
        final bool hasToken = await authRepository.hasToken();
        if (hasToken) {
          final authModel = await authRepository.fetchToken();
          emit(AuthenticatedAuthState(authModel));
        } else {
          emit(AuthRegisterState());
        }
      },
    );
    on<AuthLogin>(
      (event, emit) async {
        emit(AuthenticationLoadingState());
        try {
          AuthModel result = await authRepository.login(event.login);
          emit(AuthenticatedAuthState(result));
        } catch (error) {
          emit(UnauthenticatedAuthState(error));
        }
      },
    );
    on<AuthStartupSignUp>(
      (event, emit) async {
        emit(AuthenticationLoadingState());
        try {
          AuthModel result = await authRepository.startupSignup(event.startup);
          emit(AuthenticatedAuthState(result));
        } catch (error) {
          emit(UnauthenticatedAuthState(error));
        }
      },
    );
    on<AuthInvestorSignUp>(
      (event, emit) async {
        emit(AuthenticationLoadingState());
        try {
          AuthModel result =
              await authRepository.investorSignup(event.investor);
          emit(AuthenticatedAuthState(result));
        } catch (error) {
          emit(UnauthenticatedAuthState(error));
        }
      },
    );
    on<AuthLogoutRequested>((event, emit) async {
      emit(AuthenticationLoadingState());
      try {
        bool result = await authRepository.logout();
        emit(UnknownAuthState());
      } catch (error) {
        emit(UnauthenticatedAuthState(error));
      }
    });
    on<AuthUnauthenticated>((event, emit) async {
      emit(UnauthenticatedAuthState(event.error));
    });
  }
}
