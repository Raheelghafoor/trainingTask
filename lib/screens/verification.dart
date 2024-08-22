import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/location.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_text_field/pin_code_text_field.dart';

class Verification extends StatefulWidget {
  final String email; // Add the email parameter

  const Verification({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool hasError = false;
  int pinLength = 4;
  final TextEditingController otpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> verifyOtp(String code) async {
    try {
      final response = await http.post(
        Uri.parse(
            "https://expresscarr.pythonanywhere.com/api/user/api/verify-otp/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'code': code,
        }),
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Location()),
        );
        print(
            "OTP Verified Successfully: ${response.statusCode} - ${response.body}");
        // Handle successful OTP verification here, e.g., navigate to another page
      } else {
        _showErrorDialog(
            "Error", "The OTP you entered is wrong. Please try again.");
        print(
            "Failed to verify OTP: ${response.statusCode} - ${response.body}");
        // Handle errors, e.g., show a message to the user
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      // Handle exception
    }
  }

  Future<void> resendOtp() async {
    try {
      final response = await http.post(
        Uri.parse(
            "https://expresscarr.pythonanywhere.com/api/user/api/resend_otp/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': widget.email,
        }),
      );

      if (response.statusCode == 200) {
        _showErrorDialog("Success", "OTP has been resent to your email.");
        print(
            "OTP Resent Successfully: ${response.statusCode} - ${response.body}");
        // Handle successful OTP resend here, e.g., show a confirmation message
      } else {
        _showErrorDialog("Error", "Failed to resend OTP. Please try again.");
        print(
            "Failed to resend OTP: ${response.statusCode} - ${response.body}");
        // Handle errors, e.g., show a message to the user
      }
    } catch (e) {
      print("Error----------------: ${e.toString()}");
      // Handle exception
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                'Verify Code',
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
                'Please enter the code we just sent you to email\nexample@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: Image.asset(
                'assets/images/g9.png',
                width: 250,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PinCodeTextField(
                    pinBoxRadius: 10,
                    autofocus: true,
                    controller: otpController,
                    hideCharacter: false,
                    highlight: true,
                    defaultBorderColor:
                        const Color.fromARGB(255, 153, 153, 153),
                    hasTextBorderColor:
                        const Color.fromARGB(255, 153, 153, 153),
                    highlightPinBoxColor:
                        const Color.fromARGB(255, 153, 153, 153),
                    maxLength: pinLength,
                    hasError: hasError,
                    onTextChanged: (text) {
                      setState(() {
                        hasError = false;
                      });
                    },
                    onDone: (text) {
                      print("DONE $text");
                      print("DONE CONTROLLER ${otpController.text}");
                    },
                    pinBoxWidth: 80,
                    pinBoxHeight: 60,
                    hasUnderline: false,
                    wrapAlignment: WrapAlignment.spaceEvenly,
                    pinBoxDecoration:
                        ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                    pinTextStyle: TextStyle(fontSize: 22.0),
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                    pinTextAnimatedSwitcherDuration:
                        Duration(milliseconds: 400),
                    highlightAnimationBeginColor:
                        const Color.fromARGB(255, 153, 153, 153),
                    highlightAnimationEndColor: Colors.white12,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Didn't receive the OTP?",
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () {
                resendOtp(); // Call resendOtp when button is pressed
              },
              child: const Text(
                "Resend Code",
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                verifyOtp(otpController.text.toString());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 51, 49, 49),
                fixedSize: const Size(350, 60),
              ),
              child: const Text(
                "Verify",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
