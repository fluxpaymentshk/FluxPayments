import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static double _blockWidth = 0;
  static double _blockHeight = 0;
  static String userID = "";
  static double textMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 0;
  static double widthMultiplier = 0;

  void init(BoxConstraints constraints) {
    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
    textMultiplier = widthMultiplier;

    print(_screenHeight);
    print(_screenWidth);
  }
}
