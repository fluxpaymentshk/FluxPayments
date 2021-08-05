import 'package:flutter/foundation.dart';

abstract class BanksEvent {
  const BanksEvent();
}

class GetBanks extends BanksEvent {
  final String? userID;
  const GetBanks({@required this.userID});
}
