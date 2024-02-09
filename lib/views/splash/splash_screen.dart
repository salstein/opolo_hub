import 'dart:async';

import 'package:flutter/material.dart';

import '../../main.dart';
import '../signup/signup_page.dart';

class SplashScreenn extends StatefulWidget {
  const SplashScreenn({super.key});

  @override
  State<SplashScreenn> createState() => _SplashScreennState();
}

class _SplashScreennState extends State<SplashScreenn> {
  navigate() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignnUpPage()),
      );
    });
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 100),
          Text("OPOLO HUB",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
        ],
      ),
    ));
  }
}
