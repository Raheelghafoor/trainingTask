import 'package:flutter/material.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/descriptionScreen.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/featuresScreen.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/images.dart';
import '../../../../CustomWidgets/customButton.dart';
import '../../../../CustomWidgets/customText.dart';
import '../../../../CustomWidgets/customTextField.dart';
import '../../../../Resources/resource.dart';

class PlateScreen extends StatefulWidget {
  const PlateScreen({super.key});

  @override
  State<PlateScreen> createState() => _PlateScreenState();
}

class _PlateScreenState extends State<PlateScreen> {

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    TextEditingController descrController =TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(appSize.height * 0.014),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: appSize.height * 0.030),
            Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DescriptionScreen()));
                    },
                    child: Icon(Icons.arrow_back,size: 23,color: Colors.black,))),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: "License plate",
                textColor: Colors.black,
                fontSize: appSize.height * 0.028,
                textAlign: TextAlign.left,
                isBold: true),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'Your license plate information won’t be publicly visible.',
                textColor: Resource.colors.gColor,
                fontSize: appSize.height * 0.020,
                textAlign: TextAlign.left,
                isBold: false),
            SizedBox(height: appSize.height * 0.050),
            CustomText(
                title: 'License plate number',
                textColor: Colors.black ,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: false),
            CustomTextField(
              hintText: "DAR 1",
              controller:descrController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.050),
            CustomText(
                title: 'State / province',
                textColor: Colors.black ,
                fontSize: appSize.height * 0.022,
                textAlign: TextAlign.left,
                isBold: false),
            CustomTextField(
              hintText: "Puebla estado",
              controller:descrController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: appSize.height * 0.30),
            Padding(
              padding: EdgeInsets.all(appSize.height * 0.023),
              child: CustomButton(
                  width: 430,
                  height: 50,
                  text: "Continue",
                  textColor: Resource.colors.whiteColor,
                  backgroundColor: Resource.colors.mainColor,
                  fontSize: appSize.height * 0.022,
                  borderRadius: appSize.height * 0.032,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImagesScreen()));
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
