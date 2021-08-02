import 'dart:developer';

import 'package:flux_payments/bloc/flux_points_bloc/flux_point_event.dart';
import 'package:flux_payments/bloc/flux_points_bloc/flux_point_state.dart';
import 'package:flux_payments/repository/database_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:flux_payments/services/database_lambda.dart';

class FluxPointsBloc extends Bloc<FluxPointsEvent, FluxPointsState> {
  final DatabaseRepository _databaseRepo;
  FluxPointsBloc(this._databaseRepo) : super(FluxPointsInitialState());
  double fluxPoints = 0.0;

  double get getFluxPoints => fluxPoints;
  @override
  Stream<FluxPointsState> mapEventToState(FluxPointsEvent event) async* {
    log("***************************************************************$fluxPoints");
    if (event is GetFluxPoints) {
      try {
        yield LoadingFluxPoints();
        try {
          fluxPoints = await _databaseRepo.getFluxPoints(userID: event.userID);
          yield LoadedFluxPoints();
        } catch (e) {
          yield ErrorFluxPoints("Unable to load FluxPoints!");
        }
      } catch (e) {
        yield ErrorFluxPoints("Unable to load FluxPoints!");
      }
    } else if (event is UpdateFluxPoints) {
      try {
        yield LoadingFluxPoints();
        try {
          await _databaseRepo.updateFluxPoints(
            userID: event.userID,
            appEvent: event.appEvent,
            servicePoints: event.servicePoints,rewardTransID: event.rewardTransID,
              amount: event.amount,
              rewardID: event.rewardID,
              rewardPartnerID: event.rewardPartnerID,
              shopID: event.shopID,
              timestamp: event.timestamp,
          );
          fluxPoints += event.servicePoints ?? 0;
          // await _databaseRepo.addRewardTransaction(
          //     rewardTransID: event.rewardTransID,
          //     amount: event.amount,
          //     rewardID: event.rewardID,
          //     rewardPartnerID: event.rewardPartnerID,
          //     shopID: event.shopID,
          //     timestamp: event.timestamp,
          //     userID: event.userID);
          yield LoadedFluxPoints();
        } catch (e) {
          yield ErrorFluxPoints("Unable to update FluxPoints!");
        }
      } catch (e) {
        yield ErrorFluxPoints("Unable to update FluxPoints!");
      }
    }
  }
}
