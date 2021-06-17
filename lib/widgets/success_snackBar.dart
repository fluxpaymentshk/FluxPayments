import 'package:flutter/material.dart';

SnackBar successSnackBar(String message) {
  return SnackBar(
    content: Text(
      "$message!",
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 5),
  );
}
