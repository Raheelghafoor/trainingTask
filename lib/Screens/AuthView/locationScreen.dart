import 'package:flutter/material.dart';
import 'package:traning_task/Screens/HomeScreen/homeScreen.dart';

import '../../CustomWidgets/CustomText.dart';
import '../../Resource/resources.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Resource.colors.whiteColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                title: Resource.texts.islocation,
                textColor: Resource.colors.textColor,
                fontSize: appSize.height * 0.032,
                textAlign: TextAlign.center,
                isBold: false,
              ),
              SizedBox(height: appSize.height * 0.01),
              Text(
                'We need to know your location in order to suggest nearby places.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: appSize.height * 0.05),
              Image.asset("assets/images/location.png"),
              SizedBox(height: appSize.height * 0.05),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 55,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Resource.colors.mainColor,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Center(
                    child: Text(
                      'Allow location access',
                      style: TextStyle(
                        color: Resource.colors.whiteColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: appSize.height * 0.02),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: const Text("Skip Now",style: TextStyle(color: Colors.black54),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}