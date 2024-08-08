import 'package:flutter/material.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/descriptionScreen.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/featuresScreen.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/plateScreen.dart';
import '../../../../CustomWidgets/customButton.dart';
import '../../../../CustomWidgets/customText.dart';
import '../../../../CustomWidgets/customTextField.dart';
import '../../../../Resources/resource.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PlateScreen()));
                    },
                    child: Icon(Icons.arrow_back,size: 23,color: Colors.black,))),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: "You’re all done",
                textColor: Colors.black,
                fontSize: appSize.height * 0.028,
                textAlign: TextAlign.left,
                isBold: true),
            SizedBox(height: appSize.height * 0.030),
            CustomText(
                title: 'Lets start your journey and increase your earnings.',
                textColor: Resource.colors.gColor,
                fontSize: appSize.height * 0.020,
                textAlign: TextAlign.left,
                isBold: false),
            SizedBox(height: appSize.height * 0.080),
            Center(
              child: Image.asset("assets/images/Group 48.png"),
            ),
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
                    title: "By tapping “Agree” below. you agree to the \nexpress car terms of service.",
                    textColor: Resource.colors.gColor ,
                    fontSize: appSize.height * 0.020,
                    textAlign: TextAlign.left,
                    isBold: false),
              ],
            ),
            SizedBox(height: appSize.height * 0.2),
            Padding(
              padding: EdgeInsets.all(appSize.height * 0.023),
              child: CustomButton(
                  width: 430,
                  height: 50,
                  text: "Take photos",
                  textColor: Resource.colors.whiteColor,
                  backgroundColor: Resource.colors.mainColor,
                  fontSize: appSize.height * 0.022,
                  borderRadius: appSize.height * 0.032,
                  onPressed: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => const FeaturesScreen()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
