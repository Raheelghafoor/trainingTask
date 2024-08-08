import 'package:flutter/material.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/licenseScreen.dart';

import '../../../../CustomWidgets/customButton.dart';
import '../../../../CustomWidgets/customText.dart';
import '../../../../CustomWidgets/customTextField.dart';
import '../../../../Resources/resource.dart';
import 'noticeScreen.dart';
class CarScreen extends StatefulWidget {
  const CarScreen({super.key});

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  bool isChecked = false;
  TextEditingController countryController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(appSize.height * 0.018),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: appSize.height * 0.030),
            Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LicenseScreen()));
                    },
                    child: Icon(Icons.arrow_back,size: 23,color: Colors.black,))),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: "Tell us about your car",
                textColor: Colors.black ,
                fontSize: appSize.height * 0.028,
                textAlign: TextAlign.left,
                isBold: true),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'Where is your car located?',
                textColor: Colors.black ,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: false),
            CustomTextField(
              hintText: "Puebla, Mexico",
              controller: countryController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'What car do you have?',
                textColor: Colors.black ,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: false),
            CustomTextField(
              hintText: "Toyota RAV4 2016",
              controller: countryController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'VIN number',
                textColor: Colors.black ,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: false),
            CustomTextField(
              hintText: "**************123",
              controller: countryController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'Transmission',
                textColor: Colors.black ,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: false),
            CustomTextField(
              hintText: "Manual",
              controller: countryController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'Odometer',
                textColor: Colors.black ,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: false),
            CustomTextField(
              hintText: "110-120k miles",
              controller: countryController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.030),
            CustomText(
                title: "Have you paid sales tax on this vehicle?",
                textColor: Colors.black ,
                fontSize: appSize.height * 0.020,
                textAlign: TextAlign.left,
                isBold: false),
            SizedBox(height: appSize.height * 0.020),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                  activeColor: Resource.colors.mainColor,
                  checkColor: Colors.white,
                ),
                CustomText(
                    title: "I certify i paid applicable sales or related\ntaxes on the purchase of this vehicle.",
                    textColor: Resource.colors.gColor ,
                    fontSize: appSize.height * 0.020,
                    textAlign: TextAlign.left,
                    isBold: false),
              ],
            ),
            SizedBox(height: appSize.height * 0.050),
            Padding(
              padding:  EdgeInsets.all(appSize.height*0.023),
              child: CustomButton(
                  width: 430,
                 height: 50,
                  text: "Continue",
                  textColor: Resource.colors.whiteColor,
                  backgroundColor: Resource.colors.mainColor,
                  fontSize: appSize.height * 0.022,
                  borderRadius: appSize.height * 0.032,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NoticeScreen()));
                  }, ),
            ),

          ],
        ),
      ),
    );
  }
}
