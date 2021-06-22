
class Transaction {
  String? accId;
  String? billId;
  String? category;
  String? dueDate;
  String? billPaidDate;
  int? rewardPoints;

  Transaction(
      {this.accId,
      this.billId,
      this.category,
      this.dueDate,
      this.billPaidDate,
      this.rewardPoints});

  Transaction.fromJson(Map<String, dynamic> json) {
    accId = json['accId'];
    billId = json['billId'];
    category = json['category'];
    dueDate = json['dueDate'];
    billPaidDate = json['billPaidDate'];
    rewardPoints = json['rewardPoints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accId'] = this.accId;
    data['billId'] = this.billId;
    data['category'] = this.category;
    data['dueDate'] = this.dueDate;
    data['billPaidDate'] = this.billPaidDate;
    data['rewardPoints'] = this.rewardPoints;
    return data;
  }
}