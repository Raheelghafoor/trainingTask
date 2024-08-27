import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traning_task/Screens/AuthView/signUpScreen.dart';
import 'package:traning_task/Screens/HomeScreen/homeScreen.dart';
import '../../CustomWidgets/CustomText.dart';
import '../../CustomWidgets/customField.dart';
import '../../Resource/resources.dart';
import '../../Services/ApiBaseServices/apiBaseServices.dart';
import '../../Utils/validator.dart';
import 'package:http/http.dart' as http;

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  String? _errorMessage;



  Future<void> signup(String email, String password) async {
    try {
      var response = await ApiService(
          baseUrl: "https://expresscarr.pythonanywhere.com/api/user/")
          .postRequest("login/", <String, dynamic>{
        'email': email, 'password': password
      });
      if (response.statusCode == 200) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        print("Login successful:  ${response.statusCode}");
      } else {
        setState(() {
          _errorMessage = "Login failed. Please check your email & password";
        });
        print("Unsuccessful response: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      setState(() {
        _errorMessage = "An error occurred. Please try again.";
      });
      print("Error: ${e.toString()}");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }


  //
  // void signup(String email, String password) async {
  //   if (email.isEmpty || password.isEmpty) {
  //     setState(() {
  //       _errorMessage = "Please enter both email and password.";
  //     });
  //     return;
  //   }
  //
  //   setState(() {
  //     _isLoading = true;
  //     _errorMessage = null;
  //   });
  //
  //   try {
  //     var response = await http.post(
  //       Uri.parse("https://expresscarr.pythonanywhere.com/api/user/login/"),
  //       body: {'email': email, 'password': password},
  //     );
  //
  //     if (response.statusCode == 200) {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //       print("Login successful:  ${response.statusCode}");
  //     } else {
  //       setState(() {
  //         _errorMessage = "Login failed. Please check your email & password";
  //       });
  //       print("Unsuccessful response: ${response.statusCode}");
  //       print("Response body: ${response.body}");
  //     }
  //   } catch (e) {
  //     setState(() {
  //       _errorMessage = "An error occurred. Please try again.";
  //     });
  //     print("Error: ${e.toString()}");
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don’t have an account?"),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
              child: const Text(" Sign up"))
        ],
      ),
      backgroundColor: Resource.colors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: appSize.height * 0.04),
              CustomText(
                title: Resource.texts.signIn,
                textColor: Resource.colors.textColor,
                fontSize: appSize.height * 0.035,
                textAlign: TextAlign.center,
                isBold: false,
              ),
              SizedBox(height: appSize.height * 0.01),
              Center(
                child: Text(
                  'Hi! Welcome back, you’ve been missed',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: appSize.height * 0.07),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              CustomTextField(
                hintText: "example@gmail.com",
                controller: emailController,
                obscureText: false,
                validator: FieldValidator.validateEmail,
                keyboardType: TextInputType.text,
                hintTextColor: Resource.colors.gColor,
                labelText: 'Email',
                labelTextColor: Resource.colors.textColor,
              ),
              SizedBox(height: appSize.height * 0.02),
              CustomTextField(
                hintText: "********",
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                validator: FieldValidator.validatePassword,
                keyboardType: TextInputType.text,
                labelText: 'Password',
                labelTextColor: Resource.colors.textColor,
              ),
              SizedBox(height: appSize.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Forgot password functionality
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.black54,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: appSize.height * 0.05),
              _isLoading
                  ? const CupertinoActivityIndicator(
                radius: 20.0,
              )
                  : GestureDetector(
                    onTap: () {
                    signup(emailController.text.trim(),
                       passwordController.text.trim());
                   },
                    child: Container(
                     height: 55,
                    width: 390,
                     decoration: BoxDecoration(
                     color: Resource.colors.mainColor,
                    borderRadius: BorderRadius.circular(25.0),
                     ),
                     child: Center(
                     child: CustomText(
                      title: Resource.texts.signIn,
                      textColor: Resource.colors.whiteColor,
                      fontSize: 20,
                      textAlign: TextAlign.center,
                      isBold: false,
                    ),
                  ),
                ),
              ),
              SizedBox(height: appSize.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    width: appSize.width * 0.01,
                  ),
                  const Text("Or Sign up with"),
                  SizedBox(
                    width: appSize.width * 0.01,
                  ),
                  SizedBox(
                    width: 100,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: appSize.height * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCircleIcon('assets/images/g10.png'),
                  _buildCircleIcon('assets/images/Group 18.png'),
                  _buildCircleIcon('assets/images/Group (4).png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCircleIcon(String imagePath) {
  return Container(
    width: 75,
    height: 75,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.grey.shade300,
        width: 1.0, // Border width
      ),
    ),
    child: Center(
      child: Image.asset(
        imagePath,
        width: 28.47,
        height: 35,
      ),
    ),
  );
}