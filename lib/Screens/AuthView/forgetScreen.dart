import 'package:flutter/material.dart';
import 'package:training_task/Screens/AuthView/signInScreen.dart';


import '../../CustomWidgets/CustomText.dart';
import '../../CustomWidgets/customField.dart';
import '../../Resource/resources.dart';
import '../../Utills/validator.dart';
import '../HomeScreen/homeScreen.dart';


class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController emailController = TextEditingController();

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
              MaterialPageRoute(builder: (context) => SigninScreen()),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0,left: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  title: Resource.texts.forgot,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.032,
                  textAlign: TextAlign.center, isBold: false,
                ),
                SizedBox(height: appSize.height * 0.01),
                Center(
                  child: Text(
                    'Don’t worry! we will help you to recover\nyour password.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                SizedBox(height: appSize.height * 0.07),
                Image.asset("assets/images/Forgot.png",height: appSize.height*0.170,),
                SizedBox(height: appSize.height * 0.05),

                CustomTextField(
                  hintText: "  example@gmail.com",
                  controller: emailController,
                  obscureText: false,
                  validator: FieldValidator.validateEmail,
                  keyboardType: TextInputType.text,
                  hintTextColor: Resource.colors.gColor,
                  labelText: 'Email',
                  labelTextColor: Resource.colors.textColor,
                ),
               SizedBox(height: appSize.height * 0.07),

                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(HomeScreen())));

                  },
                  child: Container(
                    height: 55,
                    width: 390,
                    decoration: BoxDecoration(
                      color: Resource.colors.mainColor,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                      child: Text('Reset password',style: TextStyle(color: Resource.colors.whiteColor,fontSize: 18),),

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
