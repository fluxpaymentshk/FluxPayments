
import 'package:flux_payments/models/helpers/transaction.dart';

class Service {
  String? accId;
  String? dueDate;
  List<Transaction>? transactions;

  Service({this.accId, this.dueDate, this.transactions});

  Service.fromJson(Map<String, dynamic> json) {
    accId = json['accId'];
    dueDate = json['dueDate'];
    if (json['transactions'] != null) {
      transactions =  [];
      json['transactions'].forEach((v) {
        transactions?.add(new Transaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accId'] = this.accId;
    data['dueDate'] = this.dueDate;
    if (this.transactions != null) {
      data['transactions'] = this.transactions?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}