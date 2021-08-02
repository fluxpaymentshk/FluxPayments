import 'package:flutter/material.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:qr_flutter/qr_flutter.dart';

Widget generateQRCode(BuildContext context, String? data) {
  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 0.9,
      child: QrImage(
        data: data ?? "testing",
        version: QrVersions.auto,
        size: 100.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        gapless: true,
      ),
    ),
  );
}
