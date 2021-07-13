import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flux_payments/repository/bot_repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../main.dart';

class SupportBotScreen extends StatefulWidget {
  const SupportBotScreen({Key? key}) : super(key: key);

  @override
  _SupportBotScreenState createState() => _SupportBotScreenState();
}

class _SupportBotScreenState extends State<SupportBotScreen> {
  final _user = const types.User(id: '1234556');
  final _bot = const types.User(id: "123");

  BotRepository _botRepository = BotRepository();

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _addMessage(types.Message message) async {
    setState(() {
      messages.insert(0, message);
    });
    log("${message.toJson()["text"]}");
    var data = await _botRepository.accessBot(message.toJson()["text"]);
    log("#####${data}");
    setState(() {
      messages.insert(0, botMessageReply(data));
    });
  }

  types.Message botMessageReply(String message) {
    return types.TextMessage(
      author: _bot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message,
    );
  }

  void _handleSendPressed(types.PartialText message) {
    // FocusScope.of(context).unfocus();
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    // final response = await rootBundle.loadString('assets/messages.json');
    // final messages = (jsonDecode(response) as List)
    //     .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
    //     .toList();
    List<types.Message> messagesList = [];
    Future.delayed(Duration(milliseconds: 600), () {
      messagesList.add(types.TextMessage(
        author: _bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text:
            "Type: \n 'BILLS'- To get info about your bills \n 'COUPON'- To solve issues related to Coupons \n 'ISSUE'- To help me solve your other issues",
      ));
      messagesList.add(types.TextMessage(
        author: _bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: "Hello. My name is Mimi- your support bot. How can I help you?",
      ));
      setState(() {
        messages = messagesList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back, color: Colors.blue),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Column(
        children: [
          SizedBox(height: 40),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Bot Mimi",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "A bot especially made to solve your issues and complaints",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Chat(
              messages: messages,
              showUserNames: true,
              onSendPressed: _handleSendPressed,
              user: _user,
            ),
          ),
        ],
      ),
    );
  }
}
