import 'package:flux_payments/models/curatedList.dart';

abstract class CuratedListEvent {
  const CuratedListEvent();
}

class LoadCuratedListEvent extends CuratedListEvent {
  final List<curatedList> curatedListData;
  final int page;
  const LoadCuratedListEvent(
      {required this.page, required this.curatedListData});
}
