// import 'dart:convert'; // For jsonEncode
// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Services/ApiBaseServices/api_base_services.dart';
import 'package:flutter_application_2/screens/login.dart';
// import 'package:flutter_application_2/screens/profileEdit.dart';
// import 'package:http/http.dart' as http; // Import HTTP package
import 'package:flutter_application_2/screens/profile.dart';
import 'package:flutter_application_2/components/textfield.dart'; // Assuming you have a custom text field

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passswordController = TextEditingController();

  bool _isChecked = false; // Checkbox state

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  void signup(String email, String password) async {
    // var result = await ApiService(baseUrl: '').getRequest(context, "");

    // var rsponse = json.decode(result.body);

    // if (result.statusCode == 200 && rsponse['success'] == true) {}

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Profile(
          email: email,
          password: password,
          password2: password,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 19, 18, 18),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Fill your information below or register\nwith your social account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              CustomTextField(
                label: 'Email',
                hintText: 'example@gmail.com',
                obscureText: false,
                controller: _emailController,
              ),
              CustomTextField(
                label: 'Password',
                hintText: 'Enter your password',
                isPasswordField: true,
                obscureText: true,
                controller: _passswordController,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 0, 10),
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: _toggleCheckbox,
                      activeColor: const Color.fromARGB(255, 51, 49, 49),
                      checkColor: Colors.white,
                    ),
                  ),
                  const Text("Agree with "),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Terms and Conditions"),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    signup(_emailController.text.toString(),
                        _passswordController.text.toString());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 51, 49, 49),
                    fixedSize: const Size(350, 60),
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 10),
                    child: SizedBox(
                      width: 110, // Set the width of the left divider
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ),
                  Text("Or Sign up with"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 110, // Set the width of the left divider
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageWithEllipse(
                    imagePath: 'assets/images/g10.png',
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                    onTap: () {},
                  ),
                  const SizedBox(width: 20),
                  ImageWithEllipse(
                    imagePath: 'assets/images/Group.png',
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                    onTap: () {},
                  ),
                  const SizedBox(width: 10),
                  ImageWithEllipse(
                    imagePath: 'assets/images/Group_18.png',
                    padding: const EdgeInsets.fromLTRB(20, 40, 10, 40),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text("Sign in"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageWithEllipse extends StatelessWidget {
  final String imagePath;
  final EdgeInsets padding;
  final VoidCallback onTap;

  ImageWithEllipse({
    required this.imagePath,
    required this.padding,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromARGB(255, 231, 218, 218),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 231, 218, 218).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
