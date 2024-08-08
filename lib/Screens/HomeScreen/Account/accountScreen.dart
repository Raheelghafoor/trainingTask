import 'package:flutter/material.dart';

import '../../../CustomWidgets/customField.dart';
import '../../../CustomWidgets/customText.dart';
import '../../../Resource/resources.dart';
import '../../../Utils/validator.dart';
import '../Drawer/drawer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isNotificationEnabled = false;
  bool _isManualtransmission = false;

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
          title: Resource.texts.account,
          textColor: Resource.colors.textColor,
          fontSize: appSize.height * 0.024,
          textAlign: TextAlign.center,
          isBold: false,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Resource.colors.whiteColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: ListTile(
                title: CustomText(
                  title: Resource.texts.asetting,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.022,
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
                      hintText: "example@gmail.com",
                      controller: emailController,
                      obscureText: false,
                      validator: FieldValidator.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      hintTextColor: Resource.colors.gColor,
                      labelText: 'Email',
                      labelTextColor: Resource.colors.textColor,
                    ),
                    SizedBox(height: appSize.height * 0.02),
                    CustomTextField(
                      hintText: "***********",
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      validator: FieldValidator.validatePassword,
                      keyboardType: TextInputType.text,
                      labelText: 'Password',
                      labelTextColor: Resource.colors.textColor,
                    ),
                    SizedBox(height: appSize.height * 0.02),
                    CustomTextField(
                      hintText: "(415)555-0132",
                      controller: phoneController,
                      obscureText: false,
                      validator: FieldValidator.validatePhone,
                      keyboardType: TextInputType.phone,
                      hintTextColor: Resource.colors.gColor,
                      labelText: 'Phone number',
                      labelTextColor: Resource.colors.textColor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: appSize.height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: appSize.width * 0.06, right: appSize.width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: Resource.texts.google,
                    textColor: Resource.colors.textColor,
                    fontSize: appSize.height * 0.020,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  CustomText(
                    title: Resource.texts.nconnected,
                    textColor: Resource.colors.gColor,
                    fontSize: appSize.height * 0.017,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                  SizedBox(height: appSize.height * 0.02),
                  CustomText(
                    title: Resource.texts.face,
                    textColor: Resource.colors.textColor,
                    fontSize: appSize.height * 0.020,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  CustomText(
                    title: Resource.texts.nconnected,
                    textColor: Resource.colors.gColor,
                    fontSize: appSize.height * 0.017,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                  SizedBox(height: appSize.height * 0.02),
                  CustomText(
                    title: Resource.texts.payset,
                    textColor: Resource.colors.textColor,
                    fontSize: appSize.height * 0.020,
                    textAlign: TextAlign.start,
                    isBold: true,
                  ),
                  SizedBox(height: appSize.height * 0.02),
                  CustomText(
                    title: Resource.texts.add,
                    textColor: Resource.colors.textColor,
                    fontSize: appSize.height * 0.018,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  CustomText(
                    title: Resource.texts.travel,
                    textColor: Resource.colors.gColor,
                    fontSize: appSize.height * 0.018,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                  SizedBox(height: appSize.height * 0.02),
                  CustomText(
                    title: Resource.texts.notisetting,
                    textColor: Resource.colors.textColor,
                    fontSize: appSize.height * 0.020,
                    textAlign: TextAlign.start,
                    isBold: true,
                  ),
                  SizedBox(height: appSize.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: Resource.texts.notification,
                        textColor: Resource.colors.textColor,
                        fontSize: appSize.height * 0.020,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      Switch(
                        value: _isNotificationEnabled,
                        activeColor: Resource.colors.whiteColor, //
                        activeTrackColor: Resource.colors.mainColor, //
                        onChanged: (value) {
                          setState(() {
                            _isNotificationEnabled = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                  SizedBox(height: appSize.height * 0.03),

                  CustomText(
                    title: Resource.texts.gsetting,
                    textColor: Resource.colors.textColor,
                    fontSize: appSize.height * 0.020,
                    textAlign: TextAlign.start,
                    isBold: true,
                  ),
                  SizedBox(height: appSize.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: Resource.texts.mtransmission,
                        textColor: Resource.colors.textColor,
                        fontSize: appSize.height * 0.020,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                      Switch(
                        value: _isManualtransmission,
                        activeColor: Resource.colors.whiteColor,
                        activeTrackColor: Resource.colors.mainColor,
                        onChanged: (value) {
                          setState(() {
                            _isManualtransmission = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                  SizedBox(height: appSize.height * 0.03),
                  CustomText(
                    title: Resource.texts.approvalstatus,
                    textColor: Resource.colors.textColor,
                    fontSize: appSize.height * 0.020,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  CustomText(
                    title: Resource.texts.notapp,
                    textColor: Resource.colors.gColor,
                    fontSize: appSize.height * 0.017,
                    textAlign: TextAlign.start,
                    isBold: false,
                  ),
                  Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                  SizedBox(height: appSize.height * 0.02),
                  GestureDetector(
                    child: CustomText(
                      title: Resource.texts.caccount,
                      textColor: Resource.colors.textColor,
                      fontSize: appSize.height * 0.020,
                      textAlign: TextAlign.start,
                      isBold: false,
                    ),
                    onTap: (){},
                  ),
                  SizedBox(height: appSize.height * 0.02),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}