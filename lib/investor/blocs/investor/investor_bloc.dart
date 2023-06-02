// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:evolve/investor/blocs/investor/blocs.dart';

import '../../repository/Investor_Repository.dart';

class InvestorBloc extends Bloc<InvestorEvent, InvestorState> {
  final InvestorRepository investorRepository;
  InvestorBloc({
    required this.investorRepository,
  }) : super(InvestorStarted()) {
    on<InvestorProfileLoad>(
      (event, emit) async {
        emit(InvestorLoading());
        try {
          final investor = await investorRepository.getProfile(event.authToken);
          emit(ProfileLoaded(investor: investor));
        } catch (e) {
          emit(ProfileLoadFailed(error: e));
        }
      },
    );
    on<InvestorProfileUpdate>(
      (event, emit) async {
        emit(InvestorLoading());
        try {
          final result = await investorRepository.updateProfile(
              event.authToken, event.investor);
          emit(ProfileUpdated());
        } catch (e) {
          emit(ProfileUpdateFailed(error: e));
        }
      },
    );
    on<InvestorChangePassword>(
      (event, emit) async {
        emit(InvestorLoading());
        try {
          final result = await investorRepository.changePassword(
              event.authToken, event.oldPassword, event.newPassword);
          emit(PasswordChanged());
        } catch (e) {
          emit(PasswordChangeFailed(error: e));
        }
      },
    );
    on<InvestorDeleteAccount>(
      (event, emit) async {
        emit(InvestorLoading());
        try {
          final result =
              await investorRepository.deleteAccount(event.authToken);
          emit(PasswordChanged());
        } catch (e) {
          emit(PasswordChangeFailed(error: e));
        }
      },
    );
    on<StartupSearch>(
      (event, emit) async {
        try {
          final result = await investorRepository.searchStartup(
              event.authToken, event.name);
          emit(SearchSuccess(startup: result));
        } catch (e) {
          emit(SearchFailed(error: e));
        }
      },
    );
  }
}
