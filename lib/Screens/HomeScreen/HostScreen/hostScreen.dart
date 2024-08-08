import 'package:flutter/material.dart';
import 'package:training_task/CustomWidgets/customButton.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/licenseScreen.dart';
import '../../../CustomWidgets/customText.dart';
import '../../../Resources/resource.dart';

class HostScreen extends StatefulWidget {
  const HostScreen({super.key});

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
             Image.asset(Resource.images.host),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: Resource.texts.host,
                      textColor: Resource.colors.textColor,
                      fontSize: appSize.height * 0.025,
                      textAlign: TextAlign.start,
                      isBold: false,
                    ),
                    SizedBox(height: appSize.height * 0.010),
                    CustomText(
                      title: Resource.texts.unlock,
                      textColor: Colors.grey.shade400,
                      fontSize: appSize.height * 0.020,
                      textAlign: TextAlign.start,
                      isBold: false,
                    ),
                    SizedBox(height: appSize.height * 0.090),
                    CustomButton(
                        width: 150,
                        height: 52,
                        text: "Starting Host",
                        textColor: Resource.colors.whiteColor,
                        backgroundColor: Resource.colors.mainColor,
                        fontSize: appSize.height * 0.022,
                        borderRadius: appSize.height * 0.032,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LicenseScreen()));
                        })
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
