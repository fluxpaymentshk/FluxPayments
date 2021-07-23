import 'package:flux_payments/models/myCoupons.dart';
import 'package:flux_payments/models/ModelProvider.dart';

abstract class CouponsEvent {
  const CouponsEvent();
}

class GetCoupons extends CouponsEvent {
  final List<myCoupons> coupons;
  final int page;
  final String userID;
  const GetCoupons({required this.page, required this.coupons,required this.userID});
}