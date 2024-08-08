import 'package:flutter/material.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/descriptionScreen.dart';
import 'package:training_task/Screens/HomeScreen/HostScreen/StartingHost/tripScreen.dart';
import '../../../../CustomWidgets/customButton.dart';
import '../../../../CustomWidgets/customText.dart';
import '../../../../Resources/resource.dart';

class FeaturesScreen extends StatefulWidget {
  const FeaturesScreen({super.key});

  @override
  State<FeaturesScreen> createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends State<FeaturesScreen> {
  int? _selectedIndex;

  final List<Map<String, String>> _features = [
    {'image': 'assets/images/high 1.png', 'title': 'High Beams'},
    {'image': 'assets/images/area 1.png', 'title': 'Spot Monitor'},
    {'image': 'assets/images/warning 1.png', 'title': 'Lane Departure'},
    {'image': 'assets/images/sensor 1.png', 'title': 'Parking Sensors'},
    {'image': 'assets/images/Worldwide Location.png', 'title': 'GPS'},
    {'image': 'assets/images/Babys Room.png', 'title': 'Child Seat'},
    {'image': 'assets/images/Circled Play (1).png', 'title': 'Apple Play'},
    {'image': 'assets/images/Bluetooth 2.png', 'title': 'Bluetooth'},
    {'image': 'assets/images/Circled Play (1).png', 'title': 'Android Play'},
    {'image': 'assets/images/icons8-4wd-80 1.png', 'title': '4WD'},
  ];

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(appSize.height * 0.014),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: appSize.height * 0.030),
            Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                    onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TripScreen()));
                    },
                    child: Icon(Icons.arrow_back,size: 23,color: Colors.black,))),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: "Car features",
                textColor: Colors.black,
                fontSize: appSize.height * 0.028,
                textAlign: TextAlign.left,
                isBold: true),
            SizedBox(height: appSize.height * 0.020),
            CustomText(
                title: 'What features does your car have?',
                textColor: Resource.colors.gColor,
                fontSize: appSize.height * 0.020,
                textAlign: TextAlign.left,
                isBold: false),
            SizedBox(height: appSize.height * 0.030),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: appSize.width * 0.08,
                  mainAxisSpacing: appSize.height * 0.040,
                  childAspectRatio: 2,
                ),
                itemCount: _features.length,
                itemBuilder: (context, index) {
                  final feature = _features[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Resource.colors.gColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: _selectedIndex == index
                              ? Resource.colors.mainColor
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(appSize.height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              feature['image']!,
                              width: appSize.height * 0.04,
                              height: appSize.height * 0.03,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: appSize.width * 0.02),
                            Expanded(
                              child: CustomText(
                                title: feature['title']!,
                                textColor: Resource.colors.gColor,
                                fontSize: appSize.height * 0.022,
                                textAlign: TextAlign.left,
                                isBold: false,
                                 // Handle overflow
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: appSize.height * 0.060),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const DescriptionScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
