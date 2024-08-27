import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../CustomWidgets/CustomText.dart';
import '../../Resource/resources.dart';
import '../../Services/ApiBaseServices/apiBaseServices.dart';
import 'locationScreen.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  bool isLoading = false;


  Future<void> submitDetails(String code) async {
    if (code.isEmpty) {
      _showErrorDialog("Invalid OTP", "Please enter the OTP code.");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      var response = await ApiService(
          baseUrl: "https://expresscarr.pythonanywhere.com/api/user/api/")
          .postRequest("verify-otp/", <String, dynamic>{
        "code": code,
      });

      if (response.statusCode == 200) {
        print(
            "OTP Verified Successfully: ${response.statusCode} - ${response.body}");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LocationScreen()),
        );
      } else {
        _showErrorDialog("Invalid OTP",
            "The OTP you entered is incorrect. Please try again.");
      }
    } catch (e) {
      print("Error-------------------------------: ${e.toString()}===");
      _showErrorDialog(
          "Error", "Something went wrong. Please try again later.");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> resent() async {
    if (widget.email.isEmpty) {
      _showErrorDialog("Invalid Email", "Email cannot be empty.");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      var result = await ApiService(
          baseUrl: 'https://expresscarr.pythonanywhere.com/api/user/')
          .postRequest(
        'api/resend_otp/',
        {'email': widget.email},
      );

      if (result.statusCode == 200) {
        var response = jsonDecode(result.body);
        print("Otp sent Successfully------: ${result.statusCode} - $response");
      } else {
        _showErrorDialog("Error",
            "Failed to send OTP. Please try again. Error code: ${result.statusCode}");
      }
    } catch (e) {
      print("Error-----------------${e.toString()}");
      _showErrorDialog(
          "Error", "Something went wrong. Please try again later.");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Resource.colors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: appSize.height * 0.05),
              CustomText(
                title: Resource.texts.verifyCode,
                textColor: Resource.colors.textColor,
                fontSize: appSize.height * 0.032,
                textAlign: TextAlign.center,
                isBold: false,
              ),
              SizedBox(height: appSize.height * 0.01),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Please enter the code we just sent to\n',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: 'email ${widget.email}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Resource.colors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: appSize.height * 0.05),
              Image.asset("assets/images/otp.png"),
              SizedBox(height: appSize.height * 0.05),
              PinCodeTextField(
                appContext: context,
                length: 4,
                controller: otpController,
                obscureText: false,
                animationType: AnimationType.scale,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 60,
                  fieldWidth: 60,
                  activeFillColor: Colors.grey,
                  selectedFillColor: Colors.grey,
                  inactiveFillColor: Colors.grey,
                  activeColor: Colors.grey,
                  selectedColor: Colors.grey,
                  inactiveColor: Colors.grey,
                ),
                backgroundColor: Resource.colors.whiteColor,
                onChanged: (value) {},
                onCompleted: (value) {},
              ),
              SizedBox(height: appSize.height * 0.01),
              Text('Didn’t receive OTP?',
                  style: TextStyle(
                      color: Resource.colors.gColor, fontSize: 16)),
              TextButton(
                onPressed: () {
                  resent();
                },
                child: const Text("Resend code"),
              ),
              SizedBox(height: appSize.height * 0.04),
              isLoading
                  ? CircularProgressIndicator(
                color: Resource.colors.mainColor,
              )
                  : GestureDetector(
                onTap: () {
                  submitDetails(otpController.text.toString());
                },
                child: Container(
                  height: 55,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Resource.colors.mainColor,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Center(
                    child: Text('Verify',
                        style: TextStyle(
                            color: Resource.colors.whiteColor,
                            fontSize: 18)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}