import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:opolo_hub/firebase_options.dart';
import 'package:opolo_hub/views/splash/splash_screen.dart';

import 'views/chats/chats_screen.dart';
import 'views/updates/updates_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const OpoloHubApp());
}

class OpoloHubApp extends StatelessWidget {
  const OpoloHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreenn(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPosition = 1;

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
