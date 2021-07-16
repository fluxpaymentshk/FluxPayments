import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as chat;
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
  final _bot = const types.User(
    id: "123",
  );

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
      resizeToAvoidBottomInset: true,
      body: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: createChat(messages)
          // chat.Chat(
          //   messages: messages,
          //   showUserNames: true,
          //   showUserAvatars: true,
          //   onSendPressed: _handleSendPressed,
          //   user: _user,
          // ),
          ),
    );
  }

  Widget createChat(List<types.Message> messages) {
    log("!!!!${messages.toString()}");
    var result = messages[0].toJson();
    print(result);
    final TextEditingController _messageController =
        new TextEditingController();
    final _formKey = GlobalKey<FormState>();
    var controller = ScrollController();
    return SingleChildScrollView(
      // reverse:true,
      controller: controller,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        color: Color(0xffF2F2FF),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  controller: controller,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> r = messages[index].toJson();
                    return Container(
                      padding: EdgeInsets.only(
                          left: r["author"]["id"].toString() == "123" ? 0 : 14,
                          right: r["author"]["id"].toString() == "123" ? 14 : 0,
                          top: 5,
                          bottom: 5),
                      child: Align(
                        alignment: (r["author"]["id"].toString() == "123"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          horizontalTitleGap: 4,
                          minLeadingWidth: 5,
                          minVerticalPadding: 1,
                          leading: r["author"]["id"].toString() == "123"
                              ? CircleAvatar(
                                  child:
                                      Image.asset("assets/icons/mimi_bot.png"),
                                  backgroundColor: Colors.white,
                                )
                              : null,
                          trailing: r["author"]["id"].toString() != "123"
                              ? CircleAvatar(
                                  child: Image.asset(
                                      "assets/icons/user_avatar.png"))
                              : null,
                          title: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(35),
                              ),
                            ),
                            color: (r["author"]["id"].toString() == "123"
                                ? Color(0xffFFFFFF)
                                : Color(0xffD9D9FF)),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: (r["author"]["id"].toString() == "123"
                                    ? Color(0xffFFFFFF)
                                    : Color(0xffD9D9FF)),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Text(
                                r["text"],
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(21))),
                child: Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(21),
                    ),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                              hintText: "Type Here...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          log("-------------------------------${_messageController.value.text}");
                          if (_messageController.value.text.length > 0)
                            _handleSendPressed(types.PartialText(
                                text: _messageController.value.text));
                          _messageController.clear();
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        backgroundColor: Colors.blue,
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
