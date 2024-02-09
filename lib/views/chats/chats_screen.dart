import "package:flutter/material.dart";

import "../../models/chatlist_model.dart";

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: messageList,
      ),
    );
  }
}
