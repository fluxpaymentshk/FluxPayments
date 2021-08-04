import 'package:flux_payments/models/ModelProvider.dart';

abstract class BanksState {
  const BanksState();
}

class BanksInitialState extends BanksState {
  const BanksInitialState();
}

class LoadingBanks extends BanksState {
  const LoadingBanks();
}

class LoadedBanks extends BanksState {
  final List<Bank>? banks;
  const LoadedBanks({this.banks});
}

class UpdatingBanks extends BanksState {
  const UpdatingBanks();
}

class ErrorBanks extends BanksState {
  final String? message;
  const ErrorBanks(this.message);
}
