import 'package:evolve/investor/repository/Pairing_Repositiory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs.dart';

class PairingBloc extends Bloc<PairingEvent, PairingState> {
  final PairingRepository pairingRepository;
  PairingBloc(this.pairingRepository) : super(PairingStarted()) {
    on<PairingRequestStartup>(
      (event, emit) async {
        emit(PairingLoading());
        try {
          final result = await pairingRepository.requestStartup(
              event.authToken, event.startupEmail);
          emit(PairingStartupSuccess());
        } catch (e) {
          emit(PairingStartupFailed(error: e));
        }
      },
    );
    on<PairingUpdateResponse>(
      (event, emit) async {
        emit(PairingLoading());
        try {
          await pairingRepository.updateResponse(
              event.authToken, event.pairing);
          emit(UpdateResponseSuccess());
        } catch (e) {
          emit(UpdateResponseFailure(error: e));
        }
      },
    );
    on<PairingGetPairedStartups>(
      (event, emit) async {
        emit(PairingLoading());
        try {
          final result =
              await pairingRepository.pairedStartups(event.authToken);
          emit(PairedStartupsLoaded(startups: result));
        } catch (e) {
          emit(PairedStartupsLoadFailed(error: e));
        }
      },
    );
    on<PairingGetResponses>(
      (event, emit) async {
        emit(PairingLoading());
        try {
          final result = await pairingRepository.getResponses(event.authToken);
          emit(PairingResponseLoaded(responses: result));
        } catch (e) {
          emit(PairingResponseFailed(error: e));
        }
      },
    );
    on<PairingGetRequests>(
      (event, emit) async {
        try {
          final result = await pairingRepository.getRequests(event.authToken);
          emit(RequestsLoaded(requests: result));
        } catch (e) {
          emit(RequestsLoadFailed(error: e));
        }
      },
    );
  }
}
