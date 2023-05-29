import 'package:evolve/login/repository/Auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/auth_model.dart';
import 'blocs.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnknownAuthState()) {
    on<AuthStartedEvent>(
      (event, emit) async {
        emit(AuthenticationLoading());
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
        emit(AuthenticationLoading());
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
        emit(AuthenticationLoading());
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
      bool result = await authRepository.logout(event.auth);
      emit(UnknownAuthState());
    });
    on<AuthUnauthenticatedEvent>((event, emit) async {
      emit(UnauthenticatedAuthState(event.error));
    });
  }
}
