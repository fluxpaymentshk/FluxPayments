import 'package:flutter/foundation.dart';

abstract class FavoriteSearchEvent {}

class LoadFavoriteSearch extends FavoriteSearchEvent {
  final String? query;
  LoadFavoriteSearch({@required this.query});
}
