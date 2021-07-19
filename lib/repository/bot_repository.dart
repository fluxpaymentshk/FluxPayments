import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flux_payments/services/bot.dart';
import 'package:http/http.dart' as http;

class BotRepository {
  Bot _bot = Bot();
  Future<String> accessBot(String message) async {
    try {
      http.Response data = await _bot.callBot(message);
      Map result = jsonDecode(data.body);
      return result["message"];
    } catch (e) {
      throw e;
    }
  }
}
