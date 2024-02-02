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
  int _currentValue = 0;

  onButttonPressed() {
    _currentValue++;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: onButttonPressed, child: Icon(Icons.add)),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Opolo Hub App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Click button to increment"),
            Text(_currentValue.toString())
          ],
        )));
  }
}
