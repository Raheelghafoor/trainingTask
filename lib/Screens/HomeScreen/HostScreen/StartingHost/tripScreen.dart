import 'package:flutter/material.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/noticeScreen.dart';
import '../../../../CustomWidgets/customButton.dart';
import '../../../../CustomWidgets/customText.dart';
import '../../../../Resources/resource.dart';
import 'featuresScreen.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  int _daySelected = -1;
  int _maxDaySelected = -1;

  List<Map<String, dynamic>> minDays = [
    {'name': '1 day', 'value': false},
    {'name': '2 days', 'value': false},
    {'name': '3 days', 'value': false},
  ];

  List<Map<String, dynamic>> maxDays = [
    {'name': '5 days', 'value': false},
    {'name': '1 week', 'value': false},
    {'name': '2 weeks', 'value': false},
    {'name': '1 month', 'value': false},
    {'name': 'Any', 'value': false},
  ];

  TextEditingController countryController = TextEditingController();

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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NoticeScreen()));
                    },
                    child: Icon(Icons.arrow_back,size: 23,color: Colors.black,))),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: "Minimum trip duration",
                textColor: Colors.black,
                fontSize: appSize.height * 0.028,
                textAlign: TextAlign.left,
                isBold: true),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'What’s the shortest possible trip you’ll accept?',
                textColor: Resource.colors.gColor,
                fontSize: appSize.height * 0.020,
                textAlign: TextAlign.left,
                isBold: false),
            SizedBox(height: appSize.height * 0.050),

            // Minimum Trip Duration Containers
            for (int i = 0; i < minDays.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _daySelected = i;
                    for (int j = 0; j < minDays.length; j++) {
                      minDays[j]['value'] = j == i;
                    }
                  });
                },
                child: Container(
                  width: appSize.width * 0.9, // Adjusted width
                  height: appSize.height * 0.078,
                  margin: EdgeInsets.only(bottom: 16), // Adjusted margin
                  padding: EdgeInsets.all(appSize.height * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(appSize.height * 0.015),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "${minDays[i]['name']}",
                        textColor: Colors.black,
                        fontSize: appSize.height * 0.020,
                        textAlign: TextAlign.left,
                        isBold: false,
                      ),
                      Container(
                        width: appSize.height * 0.04,
                        height: appSize.height * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Center(
                          child: Container(
                            width: appSize.height * 0.025,
                            height: appSize.height * 0.020,
                            decoration: BoxDecoration(
                              color: _daySelected == i ? Colors.black : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            SizedBox(height: appSize.height * 0.040),
            CustomText(
                title: "Maximum trip duration",
                textColor: Colors.black,
                fontSize: appSize.height * 0.028,
                textAlign: TextAlign.left,
                isBold: true),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'What’s the longest possible trip you’ll accept?',
                textColor: Resource.colors.gColor,
                fontSize: appSize.height * 0.020,
                textAlign: TextAlign.left,
                isBold: false),
            SizedBox(height: appSize.height * 0.050),
            for (int i = 0; i < maxDays.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _maxDaySelected = i;
                    for (int j = 0; j < maxDays.length; j++) {
                      maxDays[j]['value'] = j == i;
                    }
                  });
                },
                child: Container(
                  width: appSize.width * 0.9,
                  height: appSize.height * 0.078,
                  margin: EdgeInsets.only(bottom: 16), // Adjusted margin
                  padding: EdgeInsets.all(appSize.height * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(appSize.height * 0.015),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "${maxDays[i]['name']}",
                        textColor: Colors.black,
                        fontSize: appSize.height * 0.020,
                        textAlign: TextAlign.left,
                        isBold: false,
                      ),
                      Container(
                        width: appSize.height * 0.04,
                        height: appSize.height * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Center(
                          child: Container(
                            width: appSize.height * 0.025,
                            height: appSize.height * 0.020,
                            decoration: BoxDecoration(
                              color: _maxDaySelected == i ? Colors.black : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: appSize.height * 0.050),

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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FeaturesScreen()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
