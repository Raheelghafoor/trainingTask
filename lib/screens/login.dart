import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/textfield.dart';
import 'package:flutter_application_2/screens/forgot_password.dart';
import 'package:flutter_application_2/screens/hero.dart';
// import 'package:flutter_application_2/screens/profile.dart';
import 'package:flutter_application_2/screens/signup.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void login(String email, String password) async {
    try {
      Response response = await http.post(
        Uri.parse("https://expresscarr.pythonanywhere.com/api/user/login/"),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Heroo()));
        print("Login successful:  ${response.statusCode}- ${response.body}");
      } else {
        print(
            "Unsuccessful response: ${response.statusCode}- ${response.body}");
        // Handle different status codes or errors
      }
    } catch (e) {
      print("Errorrrr: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Center(
              child: Text(
                'Sign in',
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 19, 18, 18),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Hi! Welcome back, you have been missed',
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
              controller: _emailController,
              label: 'Username',
              hintText: 'example@gmail.com',
              obscureText: false,
            ),
            CustomTextField(
              controller: _passwordController,
              label: 'Password',
              hintText: 'Enter your password',
              isPasswordField: true,
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()),
                        );
                      },
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: Color.fromARGB(255, 71, 69, 69),
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                login(_emailController.text.toString(),
                    _passwordController.text.toString());
              },
              child: const Text(
                "Sign in",
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
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 65, right: 10),
                  child: SizedBox(
                    width: 100, // Set the width of the left divider
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ),
                Text("Or Sign in with"),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 100, // Set the width of the left divider
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ImageWithEllipse(
                  imagePath:
                      'assets/images/g10.png', // Replace with your image asset
                  padding: const EdgeInsets.fromLTRB(70, 40, 10, 40),
                  onTap: () {},
                ),
                const SizedBox(width: 20),
                ImageWithEllipse(
                  imagePath:
                      'assets/images/Group.png', // Replace with your image asset
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                  onTap: () {},
                ),
                const SizedBox(width: 10),
                ImageWithEllipse(
                  imagePath:
                      'assets/images/Group_18.png', // Replace with your image asset
                  padding: const EdgeInsets.fromLTRB(20, 40, 10, 40),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Dont have an account?"),
                TextButton(onPressed: () {}, child: const Text("Sign up"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
