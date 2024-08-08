import 'package:flutter/material.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/carScreen.dart';
import '../../../../CustomWidgets/customButton.dart';
import '../../../../CustomWidgets/customText.dart';
import '../../../../Resources/resource.dart';
import 'tripScreen.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key});

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  List<Map<String, dynamic>> days = [
    {'name': '6 hours', 'value': false},
    {'name': '12 hours', 'value': false},
    {'name': '1 day', 'value': false},
  ];

  int _daySelected = -1;

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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CarScreen()));
                    },
                    child: Icon(Icons.arrow_back,size: 23,color: Colors.black,))),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: "Advance notice",
                textColor: Colors.black,
                fontSize: appSize.height * 0.028,
                textAlign: TextAlign.left,
                isBold: true),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'How much advance notice do you want before a trip starts.',
                textColor: Resource.colors.gColor,
                fontSize: appSize.height * 0.020,
                textAlign: TextAlign.left,
                isBold: false),
            SizedBox(height: appSize.height * 0.050),


            for (int i = 0; i < days.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _daySelected = i;
                    for (int j = 0; j < days.length; j++) {
                      days[j]['value'] = j == i;
                    }
                  });
                },
                child: Container(
                  width: appSize.height * 0.770,
                  height: appSize.height * 0.078,
                  padding: EdgeInsets.all(appSize.height * 0.02),
                  margin: EdgeInsets.only(bottom: appSize.height * 0.020),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(appSize.height * 0.015),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: days[i]['name'],
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TripScreen()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
