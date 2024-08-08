import 'package:flutter/material.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/featuresScreen.dart';
import '../../../../CustomWidgets/customButton.dart';
import '../../../../CustomWidgets/customText.dart';
import '../../../../CustomWidgets/customTextField.dart';
import '../../../../Resources/resource.dart';
import 'plateScreen.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {

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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FeaturesScreen()));
                    },
                    child: Icon(Icons.arrow_back,size: 23,color: Colors.black,))),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: "Description",
                textColor: Colors.black,
                fontSize: appSize.height * 0.028,
                textAlign: TextAlign.left,
                isBold: true),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'Write a short description about your car and tell guests why they’ll love driving it.',
                textColor: Resource.colors.gColor,
                fontSize: appSize.height * 0.020,
                textAlign: TextAlign.left,
                isBold: false),
            SizedBox(height: appSize.height * 0.050),
            CustomTextField(
              hintText: "No need to include your contact info or pickup instructions, guests will receive it when they book your car.",
              controller:descrController,
              keyboardType: TextInputType.text,
              maxLines: 9,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PlateScreen()));
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
