import 'package:flutter/material.dart';
import 'package:flutter_application_2/Services/ApiBaseServices/api_base_services.dart';
import 'package:flutter_application_2/components/textfield.dart';
import 'package:flutter_application_2/screens/verification.dart';
// import 'package:http/http.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:flutter_application_2/screens/login.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';

class Profile extends StatefulWidget {
  final String email, password, password2;
  const Profile(
      {super.key,
      required this.email,
      required this.password,
      required this.password2});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final String apiToken =
      'dummy_device_token'; // Replace with your actual token

  Future<void> submitDetails(String name, String number) async {
    try {
      var result = await ApiService(
              baseUrl: "https://expresscarr.pythonanywhere.com/api/user/")
          .postRequest("register/", <String, dynamic>{
        'email': widget.email,
        'password': widget.password,
        'password2': widget.password,
        'contact': number,
        'name': name,
        'role': 'user',
        'device_token': 'dummy',
        'tc': 'true',
        'is_registered': 'true'
      });

      var response = json.decode(result.body);
      if (result.statusCode == 201) {
        print(
            "Successfully registered: ${response.statusCode} - ${response.body}");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Verification(
                    email: widget.email,
                  )),
        );
      } else {
        print("Registration failed: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Error-------- ${e.toString()}");
    }
  }

  // Future<void> submitDetails(String name, String number) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("https://expresscarr.pythonanywhere.com/api/user/register/"),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         'email': widget.email,
  //         'password': widget.password,
  //         'password2': widget.password2,
  //         'contact': number,
  //         'name': name,
  //         'role': 'user',
  //         'device_token': 'dummy_device_token',
  //         'tc': 'True',
  //         'is_registered': 'false',
  //       }),
  //     );

  //     if (response.statusCode == 201) {
  //       print("Successfull------: ${response.statusCode} - ${response.body}");
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => Verification(
  //                   email: widget.email,
  //                 )),
  //       );
  //     } else {
  //       print("Error------------: ${response.statusCode} - ${response.body}");
  //     }
  //   } catch (e) {
  //     print("------------Error: ${e.toString()}");
  //   }
  // }

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
                'Complete your Profile',
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
                'Give your information to make you a trusted user',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Image.asset(
                'assets/images/profile.png',
                width: 300,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
                controller: _nameController,
                label: "Name",
                hintText: "Ex. Mark smith",
                obscureText: false),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                      height:
                          8.0), // Space between the label and the input field
                  IntlPhoneField(
                    controller: _numberController,
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: const Color.fromARGB(255, 213, 210, 210),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    initialCountryCode: 'PK',
                    onChanged: (phone) {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                submitDetails(_nameController.text.toString(),
                    _numberController.text.toString());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                  255,
                  51,
                  49,
                  49,
                ),
                fixedSize: const Size(350, 60),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
