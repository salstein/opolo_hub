import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(
      {super.key,
      required this.name,
      required this.lastMessage,
      required this.noMessages,
      required this.time});
  final String name;
  final String lastMessage;
  final String noMessages;
  final String time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(name),
      subtitle: Text(lastMessage),
      trailing: Column(
        children: [
          Text(time),
          Container(
            alignment: Alignment.center,
            height: 20,
            width: 20,
            decoration:
                BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
            child: Text(noMessages,
                style: TextStyle(fontSize: 8, color: Colors.white)),
          )
        ],
      ),
    );
  }
}
