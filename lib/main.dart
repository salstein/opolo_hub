import 'package:flutter/material.dart';

void main() {
  runApp(const OpoloHubApp());
}

class OpoloHubApp extends StatelessWidget {
  const OpoloHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: currentPosition == 1
            ? FloatingActionButton(
                backgroundColor: Colors.teal,
                onPressed: () {},
                child: const Icon(Icons.message, color: Colors.white))
            : const SizedBox(),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            "WhatsApp",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 50,
                color: Colors.teal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        currentPosition = 0;
                        setState(() {});
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.people,
                            color: currentPosition == 0
                                ? Colors.white
                                : Colors.black,
                          )),
                    ),
                    InkWell(
                        onTap: () {
                          currentPosition = 1;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Chats",
                            style: TextStyle(
                              color: currentPosition == 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        )),
                    InkWell(
                        onTap: () {
                          currentPosition = 2;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Updates",
                            style: TextStyle(
                              color: currentPosition == 2
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        )),
                    InkWell(
                        // splashColor: Colors.black,
                        onTap: () {
                          currentPosition = 3;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Calls",
                            style: TextStyle(
                              color: currentPosition == 3
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        )),
                  ],
                )),
            currentPosition == 0
                ? CommunityScreen()
                : currentPosition == 1
                    ? ChatList()
                    : currentPosition == 2
                        ? UpdateScreen()
                        : CallsScreen()
          ],
        ));
  }
}

List<Widget> messageList = [
  const SizedBox(height: 10),
  const ChatItem(
    name: "My Love",
    lastMessage: "I miss you",
    time: "now",
    noMessages: "20",
  ),
  const ChatItem(
    name: "My Love",
    lastMessage: "I miss you",
    time: "now",
    noMessages: "20",
  ),
  const ChatItem(
    name: "My Love",
    lastMessage: "I miss you",
    time: "now",
    noMessages: "20",
  ),
  const ChatItem(
    name: "My Bestie",
    lastMessage: "I want to see you.",
    time: "2 min",
    noMessages: "2",
  ),
  const ChatItem(
    name: "JOML",
    lastMessage: "I need the money urgently...",
    time: "1day",
    noMessages: "20",
  ),
  const ChatItem(
    name: "My mom",
    lastMessage: "Share with all your contacts...",
    time: "3day",
    noMessages: "2K",
  ),
  const ChatItem(
    name: "My Love",
    lastMessage: "I miss you",
    time: "now",
    noMessages: "20",
  ),
  const ChatItem(
    name: "My Love",
    lastMessage: "I miss you",
    time: "now",
    noMessages: "20",
  ),
  const ChatItem(
    name: "My Bestie",
    lastMessage: "I want to see you.",
    time: "2 min",
    noMessages: "2",
  ),
  const ChatItem(
    name: "JOML",
    lastMessage: "I need the money urgently...",
    time: "1day",
    noMessages: "20",
  ),
  const ChatItem(
    name: "My mom",
    lastMessage: "Share with all your contacts...",
    time: "3day",
    noMessages: "2K",
  ),
  const ChatItem(
    name: "JOML",
    lastMessage: "I need the money urgently...",
    time: "1day",
    noMessages: "20",
  ),
  const ChatItem(
    name: "My mom",
    lastMessage: "Share with all your contacts...",
    time: "3day",
    noMessages: "2K",
  )
];

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

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Updates"),
    );
    ;
  }
}

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Calls"),
    );
    ;
  }
}

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Communities"),
    );
  }
}
