import 'package:flutter/material.dart';
import '../../CustomWidgets/customButton.dart';
import '../../CustomWidgets/customText.dart';
import '../../Resource/resources.dart';
import 'homeScreen.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(alignment: Alignment.topLeft,
                child: CustomText(
                  title: Resource.texts.triph,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.030,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
              ),
            ),
            SizedBox(height: appSize.height * 0.020),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                    decoration: BoxDecoration(
                      color: selectedIndex == 0
                          ? Resource.colors.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Booked',
                      style: TextStyle(
                        color: selectedIndex == 0
                            ? Colors.white
                            : Resource.colors.gColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                    decoration: BoxDecoration(
                      color: selectedIndex == 1
                          ? Resource.colors.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'History',
                      style: TextStyle(
                        color: selectedIndex == 1
                            ? Colors.white
                            : Resource.colors.gColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
             Spacer(),
            Image.asset(Resource.images.notrip),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
              title: Resource.texts.notrip,
              textColor: Resource.colors.textColor,
              fontSize: appSize.height * 0.032,
              textAlign: TextAlign.start,
              isBold: false,
            ),
            // SizedBox(height: appSize.height * 0.090),
            Spacer(),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              // padding: const EdgeInsets.only(left: 30, right: 30),
              child: CustomButton(
                text: Resource.texts.find,
                textColor: Resource.colors.whiteColor,
                backgroundColor: Resource.colors.mainColor,
                fontSize: 18,
                borderRadius: 30,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: appSize.height * 0.100),

          ],
        ),
      ),
    );
  }
}