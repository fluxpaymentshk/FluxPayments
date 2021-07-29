import 'package:flux_payments/models/ExternalAdvertisers.dart';
import 'package:flux_payments/models/InternalAdvertisers.dart';

abstract class AdvertiserState {
  const AdvertiserState();
}

class AdvertiserInitialState extends AdvertiserState {
  const AdvertiserInitialState();
}

class LoadingInternalAdvertiser extends AdvertiserState {
  const LoadingInternalAdvertiser();
}

class LoadedInternalAdvertiser extends AdvertiserState {
  final List<InternalAdvertisers> internalAdvertiser;
  const LoadedInternalAdvertiser({required this.internalAdvertiser});
}

class ErrorInternalAdvertiser extends AdvertiserState {
  final String? message;
  const ErrorInternalAdvertiser(this.message);
}

class LoadingExternalAdvertiser extends AdvertiserState {
  const LoadingExternalAdvertiser();
}

class LoadedExternalAdvertiser extends AdvertiserState {
  final List<ExternalAdvertisers> externalAdvertiser;
  const LoadedExternalAdvertiser({required this.externalAdvertiser});
}

class ErrorExternalAdvertiser extends AdvertiserState {
  final String? message;
  const ErrorExternalAdvertiser(this.message);
}
