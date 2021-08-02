import 'package:flutter/foundation.dart';
import 'package:flux_payments/models/Favorite.dart';
import 'package:flux_payments/models/ModelProvider.dart';
import 'package:flux_payments/services/database_lambda.dart';

abstract class FluxPointsEvent {
  const FluxPointsEvent();
}

class GetFluxPoints extends FluxPointsEvent {
  final String? userID;
  const GetFluxPoints({@required this.userID});
}

class UpdateFluxPoints extends FluxPointsEvent {
  final String? userID;
  final FluxPointServiceType? appEvent;
  final double? servicePoints;
  final String? rewardTransID;
  final double? amount;
  final String? timestamp;
  final String? rewardPartnerID;
  final String? rewardID;
  final String? shopID;
  const UpdateFluxPoints(
      {@required this.rewardTransID,
      @required this.amount,
      @required this.timestamp,
      @required this.rewardPartnerID,
      @required this.rewardID,
      @required this.shopID,
      @required this.userID,
      @required this.appEvent,
      @required this.servicePoints});
}
