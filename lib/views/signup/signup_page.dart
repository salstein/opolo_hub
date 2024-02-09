import 'package:flutter/material.dart';

class SignnUpPage extends StatefulWidget {
  const SignnUpPage({super.key});

  @override
  State<SignnUpPage> createState() => _SignnUpPageState();
}

class _SignnUpPageState extends State<SignnUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup Page")),
      body: Column(),
    );
  }
}
