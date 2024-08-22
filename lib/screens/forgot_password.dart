import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
            child: Text(
              'Forgot Password',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
              child: Text(
            "Don't worry we will help you to recover",
            style:
                TextStyle(color: Color.fromARGB(255, 73, 67, 67), fontSize: 16),
          )),
          const Center(
              child: const Text(
            "your password",
            style:
                TextStyle(color: Color.fromARGB(255, 73, 67, 67), fontSize: 16),
          )),
          const SizedBox(
            height: 70,
          ),
          SizedBox(
            child: Image.asset(
              'assets/images/ForgotPassword.jpg',
              width: 300,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextField(
            label: "Email",
            hintText: "example@gmail.com",
            obscureText: false,
            isPasswordField: false,
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Reset Password",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(
                255,
                51,
                49,
                49,
              ),
              fixedSize: const Size(350, 60),
            ),
          ),
        ],
      ),
    );
  }
}
