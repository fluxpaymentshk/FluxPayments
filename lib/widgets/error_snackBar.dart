import 'package:flutter/material.dart';

SnackBar errorSnackBar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 5),
  );
}
