import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login/login_page.dart';

class SignnUpPage extends StatefulWidget {
  const SignnUpPage({super.key});

  @override
  State<SignnUpPage> createState() => _SignnUpPageState();
}

class _SignnUpPageState extends State<SignnUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final fAuth = FirebaseAuth.instance;

  bool loading = false;

  createAccount() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      await fAuth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        setState(() {
          loading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginUpPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Enter a text";
                    } else if (e.isNotEmpty) {
                      const pattern =
                          r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                      final regex = RegExp(pattern);

                      return e!.isNotEmpty && !regex.hasMatch(e)
                          ? 'Enter a valid email address'
                          : null;
                    }
                  },
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
                  validator: (password) {
                    // Password length greater than 6
                    if (password!.length < 6) {
                      return 'Password must be longer than 6 characters.\n';
                    }

                    // Contains at least one uppercase letter
                    if (!password.contains(RegExp(r'[A-Z]'))) {
                      return '• Uppercase letter is missing.\n';
                    }

                    // Contains at least one lowercase letter
                    if (!password.contains(RegExp(r'[a-z]'))) {
                      return '• Lowercase letter is missing.\n';
                    }

                    // Contains at least one digit
                    if (!password.contains(RegExp(r'[0-9]'))) {
                      return '• Digit is missing.\n';
                    }

                    // Contains at least one special character
                    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
                      return '• Special character is missing.\n';
                    }

                    // If there are no error messages, the password is valid
                    return null;
                  },
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
                    createAccount();
                  },
                  color: Colors.black,
                  child: Text("Sign up", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(
                  height: 24,
                ),
                loading
                    ? Container(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator())
                    : const SizedBox.shrink(),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginUpPage()),
                      );
                    },
                    child: const SizedBox(
                        height: 100, width: 200, child: Text("Sign In")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
