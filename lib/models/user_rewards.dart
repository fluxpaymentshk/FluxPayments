import 'package:flux_payments/models/helpers/reward_transaction.dart';

class UserRewards {
  String? favorites;
  List<UserRewardProvider>? userRewardProviders;

  UserRewards({this.favorites, this.userRewardProviders});

  UserRewards.fromJson(Map<String, dynamic> json) {
    favorites = json['favorites'];
    if (json['userRewardProviders'] != null) {
      userRewardProviders = [];
      json['userRewardProviders'].forEach((v) {
        userRewardProviders?.add(new UserRewardProvider.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorites'] = this.favorites;
    if (this.userRewardProviders != null) {
      data['userRewardProviders'] =
          this.userRewardProviders?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserRewardProvider {
  String? rewardPartner;
  List<RewardTransaction>? transactions;

  UserRewardProvider({this.rewardPartner, this.transactions});

  UserRewardProvider.fromJson(Map<String, dynamic> json) {
    rewardPartner = json['rewardPartner'];
    if (json['transactions'] != null) {
      transactions = [];
      json['transactions'].forEach((v) {
        transactions?.add(new RewardTransaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rewardPartner'] = this.rewardPartner;
    if (this.transactions != null) {
      data['transactions'] = this.transactions?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
