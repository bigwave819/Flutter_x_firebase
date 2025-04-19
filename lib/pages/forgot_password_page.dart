import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Email Sent'),
            content: Text('Password reset link sent to ${_emailController.text.trim()}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              )
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("No such Email Found ${e.message.toString()}")
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple, elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: const Text(
              "Enter your email to be sent the reset password link",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          // email textfield
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: passwordReset,
            color: Colors.deepPurple,
            child: Text(
              'Reset Password',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}
