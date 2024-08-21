import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:traning_task/Screens/AuthView/profileScreen.dart';
import 'package:traning_task/Screens/HomeScreen/homeScreen.dart';
import '../../CustomWidgets/CustomText.dart';
import '../../CustomWidgets/customField.dart';
import '../../Resource/resources.dart';
import '../../Utils/validator.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController deviceTokenController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isChecked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void signup() async {
    try {
      final response = await http.post(
        Uri.parse("https://expresscarr.pythonanywhere.com/api/user/register/"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': emailController.text,
          'name': nameController.text,
          'password': passwordController.text,
          'password2': password2Controller.text,
          'contact': contactController.text,
          'role': 'user',
          'device_token': deviceTokenController.text,
          'tc': _isChecked.toString(),
          'is_registered': false,
        }),
      );

      if (response.statusCode == 201) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        print("Signup successful: ${response.statusCode}");
      } else {
        print("Unsuccessful response: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an account?"),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text("Sign in"))
        ],
      ),
      backgroundColor: Resource.colors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: appSize.height * 0.04),
                CustomText(
                  title: Resource.texts.create,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.035,
                  textAlign: TextAlign.center,
                  isBold: false,
                ),
                SizedBox(height: appSize.height * 0.01),
                Center(
                  child: Text(
                    'Fill your information below or register\nwith your social account',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                SizedBox(height: appSize.height * 0.05),
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
                  hintText: "name",
                  controller: nameController,
                  obscureText: false,
                  validator: FieldValidator.validateName,
                  keyboardType: TextInputType.text,
                  labelText: 'Name',
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
                SizedBox(height: appSize.height * 0.02),
                CustomTextField(
                  hintText: "********",
                  controller: password2Controller,
                  obscureText: !_isPasswordVisible,
                  validator: FieldValidator.validatePassword,
                  keyboardType: TextInputType.text,
                  labelText: 'Confirm Password',
                  labelTextColor: Resource.colors.textColor,
                ),
                SizedBox(height: appSize.height * 0.02),
                CustomTextField(
                  hintText: "Contact",
                  controller: contactController,
                  obscureText: false,
                  validator: FieldValidator.validatePassword,
                  keyboardType: TextInputType.text,
                  labelText: 'Contact',
                  labelTextColor: Resource.colors.textColor,
                ),
                SizedBox(height: appSize.height * 0.02),
                CustomTextField(
                  hintText: "Device Token",
                  controller: deviceTokenController,
                  obscureText: false,
                  validator: FieldValidator.validatePassword,
                  keyboardType: TextInputType.text,
                  labelText: 'Device Token',
                  labelTextColor: Resource.colors.textColor,
                ),
                SizedBox(height: appSize.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: _toggleCheckbox,
                      activeColor: const Color.fromARGB(230, 51, 49, 49),
                      checkColor: Colors.white,
                    ),
                    const Text("Agree with"),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          color: Colors.black54,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: appSize.height * 0.05),
                GestureDetector(
                  onTap: signup,
                  child: Container(
                    height: 55,
                    width: 390,
                    decoration: BoxDecoration(
                      color: Resource.colors.mainColor,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                      child: CustomText(
                        title: Resource.texts.signup,
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
                    SizedBox(width: appSize.width * 0.01),
                    const Text("Or Sign up with"),
                    SizedBox(width: appSize.width * 0.01),
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
        width: 1.0,
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



