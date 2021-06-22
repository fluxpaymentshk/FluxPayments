
class RewardTransaction {
  String? tansactionId;
  String? date;
  String? time;
  int? amount;
  String? billNumber;
  String? serviceBought;

  RewardTransaction(
      {this.tansactionId,
      this.date,
      this.time,
      this.amount,
      this.billNumber,
      this.serviceBought});

  RewardTransaction.fromJson(Map<String, dynamic> json) {
    tansactionId = json['tansactionId'];
    date = json['date'];
    time = json['time'];
    amount = json['amount'];
    billNumber = json['billNumber'];
    serviceBought = json['serviceBought'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tansactionId'] = this.tansactionId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['amount'] = this.amount;
    data['billNumber'] = this.billNumber;
    data['serviceBought'] = this.serviceBought;
    return data;
  }
}

