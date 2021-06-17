import 'package:flux_payments/models/user_model.dart';


abstract class BillsState {}

class InitialBills extends BillsState {}

class LoadedBills extends BillsState {
  List<Bills> bills;
  LoadedBills({required this.bills});
}

class ErrorState extends BillsState {}