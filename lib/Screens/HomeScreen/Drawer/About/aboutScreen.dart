import 'package:flutter/material.dart';

import '../../../../CustomWidgets/customField.dart';
import '../../../../CustomWidgets/customText.dart';
import '../../../../Resource/resources.dart';
import '../../../../Utils/validator.dart';
import '../drawer.dart';

class Aboutscreen extends StatefulWidget {
  const Aboutscreen({super.key});

  @override
  State<Aboutscreen> createState() => _AboutscreenState();
}

class _AboutscreenState extends State<Aboutscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController languagesController = TextEditingController();
  bool _isPasswordVisible = false;

  void saveForm() {
    String about = emailController.text;
    String lives = passwordController.text;
    String works = phoneController.text;
    String languages = languagesController.text;

    print('About: $about');
    print('Lives: $lives');
    print('Works: $works');
    print('Languages: $languages');
  }

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Resource.colors.whiteColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Resource.colors.textColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomDrawer()),
            );
          },
        ),
        title: CustomText(
          title: Resource.texts.aboutTitle,
          textColor: Resource.colors.textColor,
          fontSize: appSize.height * 0.024,
          textAlign: TextAlign.center,
          isBold: false,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Resource.colors.whiteColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: ListTile(
                title: CustomText(
                  title: Resource.texts.about,
                  textColor: Resource.colors.gColor,
                  fontSize: appSize.height * 0.016,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      hintText: "Tell people about yourself",
                      controller: emailController,
                      obscureText: false,
                      validator: FieldValidator.validateEmail,
                      keyboardType: TextInputType.text,
                      hintTextColor: Resource.colors.gColor,
                      labelText: 'About',
                      labelTextColor: Resource.colors.textColor,
                    ),
                    SizedBox(height: appSize.height * 0.02),
                    CustomTextField(
                      hintText: "California, United State Of America",
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      validator: FieldValidator.validatePassword,
                      keyboardType: TextInputType.text,
                      labelText: 'Lives',
                      labelTextColor: Resource.colors.textColor,
                    ),
                    SizedBox(height: appSize.height * 0.02),
                    CustomTextField(
                      hintText: "Amazon Virtual Assistant",
                      controller: phoneController,
                      obscureText: false,
                      validator: FieldValidator.validatePhone,
                      keyboardType: TextInputType.text,
                      hintTextColor: Resource.colors.gColor,
                      labelText: 'Works',
                      labelTextColor: Resource.colors.textColor,
                    ),
                    SizedBox(height: appSize.height * 0.02),
                    CustomTextField(
                      hintText: "English, Arabic, Spanish",
                      controller: languagesController,
                      obscureText: false,
                      validator: FieldValidator.validatePhone,
                      keyboardType: TextInputType.text,
                      hintTextColor: Resource.colors.gColor,
                      labelText: 'Languages',
                      labelTextColor: Resource.colors.textColor,
                    ),
                    SizedBox(height: appSize.height * 0.070),
                    SizedBox(
                      width: double.infinity,
                      height: appSize.height*0.060,
                      child: ElevatedButton(
                        onPressed: saveForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Resource.colors.mainColor,
                        ),
                        child: CustomText(
                          title: "Save",
                          textColor: Colors.white,
                          fontSize: appSize.height * 0.022,
                          textAlign: TextAlign.center,
                          isBold: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}