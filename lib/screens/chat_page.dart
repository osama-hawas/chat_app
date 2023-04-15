import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/custom_chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants.dart';

class ChatPage extends StatelessWidget {
  final _controllarScroll = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();
  static String id = 'chatpage';
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    height: 55,
                  ),
                  Text('Chat'),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controllarScroll,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email 
                          ? CustomChatBuble(message: messageList[index])
                          : CustomChatBubleForFriend(
                              message: messageList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        kMessage: data,
                        kCreatedAt: DateTime.now(),
                        kId: email,
                      });
                      controller.clear();
                      _controllarScroll.animateTo(0,
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeIn);
                    },
                    decoration: InputDecoration(
                        suffix: Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        hintText: 'Send a messege',
                        hintStyle: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                        )),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text('loading ...');
        }
      },
    );
  }
}
