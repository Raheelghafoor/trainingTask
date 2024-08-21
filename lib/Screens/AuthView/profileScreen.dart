
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../CustomWidgets/CustomText.dart';
import '../../CustomWidgets/customField.dart';
import '../../Resource/resources.dart';
import '../../Utils/validator.dart';
import 'otpScreen.dart';

class ProfileScreen extends StatefulWidget {
  final String email, password,password2;
  const ProfileScreen({super.key, required this.email, required this.password, required this.password2});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();


  UserProfile? userProfile;
  bool isLoading = true;

  Future<void> submitDetails(String name, String number) async {
    try {
      final response = await http.post(
        Uri.parse("https://expresscarr.pythonanywhere.com/api/user/register/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': widget.email,
          'password': widget.password,
          'password2': widget.password2,
          'contact': number,
          'name': name,
          'role': 'user',
          'device_token': '',
          'tc': 'True',
          'is_registered': 'false',
        }),
      );

      if (response.statusCode == 201) {
        print("Successfull: ${response.statusCode} - ${response.body}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  OtpScreen()),
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: appSize.height * 0.05),
                CustomText(
                  title: Resource.texts.complete,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.032,
                  textAlign: TextAlign.center,
                  isBold: false,
                ),
                SizedBox(height: appSize.height * 0.01),
                Text(
                  'Give the information to make you a trusted user',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: appSize.height * 0.01),
                Image.asset("assets/images/profile.png"),
                SizedBox(height: appSize.height * 0.03),
                CustomTextField(
                  hintText: userProfile?.name ?? "Ex. Mark smith",
                  controller: nameController,
                  obscureText: false,
                  validator: FieldValidator.validateName,
                  keyboardType: TextInputType.text,
                  hintTextColor: Resource.colors.gColor,
                  labelText: 'Name',
                  labelTextColor: Resource.colors.textColor,
                ),
                SizedBox(height: appSize.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    children: [
                      Text('Phone number'),
                    ],
                  ),
                ),
                IntlPhoneField(
                  controller: numberController,
                  decoration: InputDecoration(
                    counterText: "",
                    filled: true,
                    hintText: userProfile?.contact ?? 'Enter Phone number',
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  initialCountryCode: 'PK',
                  onChanged: (phone) {},
                ),
                SizedBox(height: appSize.height * 0.08),
                GestureDetector(
                  onTap: () {
                    submitDetails(
                      nameController.text.toString(),
                      numberController.text.toString(),
                    );
                  },
                  child: Container(
                    height: 55,
                    width: 390,
                    decoration: BoxDecoration(
                      color: Resource.colors.mainColor,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Resource.colors.whiteColor, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserProfile {
  final int id;
  final String email;
  final String name;
  final String contact;
  final bool isActive;
  final bool isAdmin;
  final String createdAt;
  final String updatedAt;
  final String? image;
  final bool isRegistered;
  final bool isDeleted;

  UserProfile({
    required this.id,
    required this.email,
    required this.name,
    required this.contact,
    required this.isActive,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    this.image,
    required this.isRegistered,
    required this.isDeleted,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      contact: json['contact'].toString(),
      isActive: json['is_active'],
      isAdmin: json['is_admin'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      image: json['image'],
      isRegistered: json['is_registered'],
      isDeleted: json['is_deleted'],
    );
  }
}


