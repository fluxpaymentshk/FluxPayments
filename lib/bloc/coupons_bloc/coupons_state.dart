import 'package:flux_payments/models/myCoupons.dart';

abstract class CouponsState {
  const CouponsState();
}

class CouponsInitialState extends CouponsState {
  const CouponsInitialState();
}

class LoadingCoupons extends CouponsState {
  const LoadingCoupons();
}

class LoadedCoupons extends CouponsState {
  final List<myCoupons> coupons;
  const LoadedCoupons({required this.coupons});
}

class ErrorCoupons extends CouponsState {
  final String? message;
  const ErrorCoupons(this.message);
}
