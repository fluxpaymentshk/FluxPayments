import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/bill_bloc/bill_event.dart';
import 'package:flux_payments/bloc/bill_bloc/bill_state.dart';
import 'package:flux_payments/models/user_model.dart';
import 'package:flux_payments/services/data.dart';

class BillsBloc extends Bloc<BillsEvent, BillsState> {
  BillsBloc() : super(InitialBills());
  @override
  Stream<BillsState> mapEventToState(BillsEvent event) async* {
    try {
     
      if (event is LoadBills) {
       // List<Bills> bills=[];
       
      //  Data().getBillData(bills);

        yield (LoadedBills());//dummy
      }
    } catch (e) {
      yield ErrorState();
    }
    //throw UnimplementedError();
  }
}
