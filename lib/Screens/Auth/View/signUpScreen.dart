import 'package:flutter/material.dart';
import 'package:training_task/CustomWidgets/customButton.dart';
import 'package:training_task/CustomWidgets/customtext.dart';
import 'package:training_task/Resources/resources.dart';
import 'package:training_task/Utills/validator.dart';
import '../../../CustomWidgets/customTextFiled.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isTermsAccepted = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(appSize.height * 0.03),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: appSize.height * 0.03),
                Center(
                  child: CustomText(
                    title: Resources.texts.create,
                    textColor: Resources.colors.mainColor,
                    fontSize: appSize.height * 0.040,
                    textAlign: TextAlign.center,
                    isBold: true,
                  ),
                ),
                CustomText(
                  title: Resources.texts.fill,
                  textColor: Resources.colors.black,
                  fontSize: appSize.height * 0.023,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: appSize.height * 0.07),

                CustomText(
                  title: Resources.texts.email,
                  textColor: Resources.colors.black,
                  fontSize: appSize.height * 0.022,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: appSize.height * 0.002),
                CustomTextField(
                  hintText: "example@gmail.com",
                  controller: emailController,
                  obscureText: false,
                  validator: FieldValidator.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  hintTextColor: Colors.grey,
                  prefixIconColor: Resources.colors.mainColor,
                ),
                SizedBox(height: appSize.height * 0.02),
                CustomText(
                  title: Resources.texts.password,
                  textColor: Resources.colors.black,
                  fontSize: appSize.height * 0.022,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: appSize.height * 0.002),
                CustomTextField(
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: !_isPasswordVisible,
                  validator: FieldValidator.validatePassword,
                  keyboardType: TextInputType.text,
                  suffixIcon: _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  onSuffixIconPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  hintTextColor: Colors.grey,
                  prefixIconColor: Resources.colors.mainColor,
                  suffixIconColor: Resources.colors.mainColor,
                ),
                SizedBox(height: appSize.height * 0.02),
                Row(
                  children: [
                    Checkbox(
                      fillColor: MaterialStateProperty.all(Resources.colors.mainColor),
                      value: _isTermsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _isTermsAccepted = value ?? false;
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isTermsAccepted = !_isTermsAccepted;
                        });
                      },
                      child: CustomText(
                        title: "Agree with Terms & Conditions",
                        textColor: Resources.colors.mainColor,
                        fontSize: appSize.height * 0.02,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: appSize.height * 0.05),
                CustomButton(
                  text: Resources.texts.signUp,
                  textColor: Colors.white,
                  backgroundColor: Resources.colors.mainColor,
                  fontSize: appSize.height * 0.026,
                  isBold: true,
                  borderRadius: appSize.height * 0.030,
                  onPressed: () {},
                ),
                SizedBox(height: appSize.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(Resources.images.line),
                    Center(
                      child: CustomText(
                        title: Resources.texts.signUpWith,
                        textColor: Resources.colors.black,
                        fontSize: appSize.height * 0.020,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(Resources.images.line),
                  ],
                ),
                SizedBox(height: appSize.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width:  appSize.height * 0.080,
                      height:appSize.height * 0.080,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/fb.png',
                          height: appSize.height * 0.030,
                        ),
                      ),
                    ),
                    SizedBox(width:  appSize.height * 0.030,),
                    Container(
                      width:  appSize.height * 0.080,
                      height:appSize.height * 0.080,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/google.png',
                          height:  appSize.height * 0.030,
                        ),
                      ),
                    ),
                    SizedBox(width:  appSize.height * 0.030,),
                    Container(
                      width:  appSize.height * 0.080,
                      height:appSize.height * 0.080,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/apple.png',
                          height: appSize.height * 0.030,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: appSize.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: Resources.texts.already,
                      textColor: Resources.colors.mainColor,
                      fontSize: appSize.height * 0.02,
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: CustomText(
                        title: Resources.texts.signUp,
                        textColor: Resources.colors.mainColor,
                        fontSize: appSize.height * 0.02,
                        textAlign: TextAlign.center,
                      ),
                    )
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
