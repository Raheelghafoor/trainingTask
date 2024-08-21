import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../CustomWidgets/CustomText.dart';
import '../../Resource/resources.dart';
import '../HomeScreen/homeScreen.dart';
import 'locationScreen.dart';
import 'package:http/http.dart' as http;


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  Future<void> submitDetails(String name, String number) async {
    try {
      final response = await http.post(
        Uri.parse("https://expresscarr.pythonanywhere.com/api/user/register/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
           "code" : "",
        }),
      );

      if (response.statusCode == 200) {
        print("Successfull: ${response.statusCode} - ${response.body}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  LocationScreen()),
        );
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
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
                textAlign: TextAlign.center, isBold: false,
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
                        text: 'email example@gmail.com',
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
                onCompleted: (value) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              SizedBox(height: appSize.height * 0.01),
              Text('Didn’t receive OTP?',style: TextStyle(color: Resource.colors.gColor,fontSize: 16),),
              TextButton(
                onPressed: () {},
                child: const Text("Resend code"),
              ),
              SizedBox(height: appSize.height * 0.04),

              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(LocationScreen())));

                },
                child: Container(
                  height: 55,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Resource.colors.mainColor,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Center(
                    child: Text('Verify',style: TextStyle(color: Resource.colors.whiteColor,fontSize: 18),),

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
