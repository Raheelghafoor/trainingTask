import 'package:flutter/material.dart';
import 'package:training_task/CustomWidgets/customText.dart';
import 'package:training_task/CustomWidgets/customTextField.dart';
import 'package:training_task/Resources/resource.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/hostScreen.dart';

import '../../../../CustomWidgets/customButton.dart';
import 'carScreen.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HostScreen()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back,size: 23,color: Colors.black,),
                        SizedBox(
                          width: appSize.width*0.2,
                        ),
                        CustomText(
                            title:"Driver’s license",
                            textColor: Colors.black,
                            fontSize: appSize.height * 0.023,
                            textAlign: TextAlign.left,
                            isBold: true),
                      ],
                    ))),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: Resource.texts.scan,
                textColor: Resource.colors.gColor,
                fontSize: appSize.height * 0.018,
                textAlign: TextAlign.left,
                isBold: false),
            SizedBox(height: appSize.height * 0.020),
            Container(
              width: appSize.height*0.770,
              height: appSize.height*0.078,
              decoration: BoxDecoration(
                color: Resource.colors.gColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                 Icon( Icons.camera_alt_outlined,color: Resource.colors.gColor,size: appSize.height*0.04,),
                  SizedBox(
                    width: appSize.width*0.02,
                  ),
                  CustomText(
                      title: 'Scan to autofill',
                      textColor: Resource.colors.gColor,
                      fontSize: appSize.height * 0.022,
                      textAlign: TextAlign.left,
                      isBold: false),
                ],
              ),
            ),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'Country',
                textColor: Resource.colors.black4,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: true),
               CustomTextField(
                   hintText: "Mexico",
                   controller: countryController,
                   keyboardType: TextInputType.text,
                  ),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'State',
                textColor: Resource.colors.black4,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: true),
            CustomTextField(
              hintText: "Puebla",
              controller: countryController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'First name',
                textColor: Resource.colors.black4,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: true),
            CustomTextField(
              hintText: "Ethan",
              controller: countryController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'Last name',
                textColor: Resource.colors.black4,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: true),
            CustomTextField(
              hintText: "John",
              controller: countryController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'Date of birth',
                textColor: Resource.colors.black4,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: true),
            CustomTextField(
              hintText: "20/05/2004",
              controller: countryController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'License number',
                textColor: Resource.colors.black4,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: true),
            CustomTextField(
              hintText: "65439806123",
              controller: countryController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'Expiration date',
                textColor: Resource.colors.black4,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: true),
            CustomTextField(
              hintText: "25/10/2030",
              controller: countryController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.060),
            Padding(
              padding:  EdgeInsets.all(appSize.height*0.023),
              child: CustomButton(
                  width: 430,
                  height: 50,
                  text: "Save",
                  textColor: Resource.colors.whiteColor,
                  backgroundColor: Resource.colors.mainColor,
                  fontSize: appSize.height * 0.022,
                  borderRadius: appSize.height * 0.032,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CarScreen()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
