import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class LoginUpPage extends StatefulWidget {
  const LoginUpPage({super.key});

  @override
  State<LoginUpPage> createState() => _LoginUpPageState();
}

class _LoginUpPageState extends State<LoginUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final fAuth = FirebaseAuth.instance;

  bool loading = false;

  signIn() async {
    setState(() {
      loading = true;
    });

    try {
      await fAuth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        setState(() {
          loading = false;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.pink,
                  enabledBorder: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide())),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide())),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              height: 50,
              minWidth: 200,
              onPressed: () {
                signIn();
              },
              color: Colors.black,
              child: Text("Sign in", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 24,
            ),
            loading
                ? Container(
                    height: 100,
                    width: 100,
                    child: const CircularProgressIndicator())
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
