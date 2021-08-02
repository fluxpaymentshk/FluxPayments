import 'package:flux_payments/models/ExternalAdvertisers.dart';
import 'package:flux_payments/models/InternalAdvertisers.dart';

abstract class AdvertiserEvent {
  const AdvertiserEvent();
}

class GetExternalAdvertiserEvent extends AdvertiserEvent {
  final List<ExternalAdvertisers> externalAdvertiserList;
  final int page;
  const GetExternalAdvertiserEvent(
      {required int this.page, required this.externalAdvertiserList});
}

class GetInternalAdvertiserEvent extends AdvertiserEvent {
  final List<InternalAdvertisers> internalAdvertiserList;
  final int page;
  const GetInternalAdvertiserEvent(
      {required int this.page, required this.internalAdvertiserList});
}
