import 'package:flux_payments/models/curatedList.dart';

abstract class CuratedListState {
  const CuratedListState();
}

class InitialState extends CuratedListState {
  const InitialState();
}

class LoadingCuratedList extends CuratedListState {
  const LoadingCuratedList();
}

class LoadedCuratedList extends CuratedListState {
  final List<curatedList> curatedListData;
  const LoadedCuratedList({required this.curatedListData});
}

class ErrorCuratedist extends CuratedListState {
  final String? message;
  const ErrorCuratedist(this.message);
}
