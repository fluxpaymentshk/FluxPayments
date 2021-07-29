import 'package:flutter/material.dart';
import 'package:flux_payments/config/theme.dart';

Widget backButton(BuildContext context, String tag, [Color? color]) {
  return Container(
    color: Colors.transparent,
    width: 35,
    height: 35,
    margin: const EdgeInsets.symmetric(
      vertical: 5.0,
      horizontal: 1,
    ),
    child: FloatingActionButton(
      heroTag: tag,
      shape: CircleBorder(
        side: BorderSide(
          color: AppTheme.main,
          width: 2.5,
        ),
      ),
      backgroundColor: color ?? Colors.white,
      mini: true,
      child: Icon(
        Icons.arrow_back_outlined,
        color: AppTheme.main,
        size: 24,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  );
}
