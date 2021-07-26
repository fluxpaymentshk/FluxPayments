import 'package:flux_payments/models/banner.dart';

abstract class BannerState {
  const BannerState();
}

class BannerInitialState extends BannerState {
  const BannerInitialState();
}

class LoadingBannerState extends BannerState {
  const LoadingBannerState();
}

class LoadBannerState extends BannerState {
  final Banner banner;
  // final String? amount, desc, dueDate, imageurl;
  const LoadBannerState({required this.banner});
}

class BannerErrorState extends BannerState {
  final String? message;
  const BannerErrorState(this.message);
}
