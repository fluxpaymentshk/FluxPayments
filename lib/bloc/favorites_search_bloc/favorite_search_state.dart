import 'package:flux_payments/models/Rewards.dart';

abstract class CouponsSearchState {
  const CouponsSearchState();
}

class CouponsSearchInitial extends CouponsSearchState {
  const CouponsSearchInitial();
}

class CouponsSearchStateLoading extends CouponsSearchState {
  const CouponsSearchStateLoading();
}

class CouponsSearchError extends CouponsSearchState {
  final String message;
  const CouponsSearchError(this.message);
}

class CouponsSearchStateDone extends CouponsSearchState {
  final List<Rewards> result;
  const CouponsSearchStateDone(this.result);
}
