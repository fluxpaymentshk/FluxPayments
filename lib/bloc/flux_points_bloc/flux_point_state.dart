import 'package:flux_payments/models/Favorite.dart';
import 'package:flux_payments/models/Reward.dart';

abstract class FluxPointsState {
  const FluxPointsState();
}

class FluxPointsInitialState extends FluxPointsState {
  const FluxPointsInitialState();
}

class LoadingFluxPoints extends FluxPointsState {
  const LoadingFluxPoints();
}

class LoadedFluxPoints extends FluxPointsState {
  const LoadedFluxPoints();
}

class UpdatingFluxPoints extends FluxPointsState {
  const UpdatingFluxPoints();
}

class ErrorFluxPoints extends FluxPointsState {
  final String? message;
  const ErrorFluxPoints(this.message);
}
