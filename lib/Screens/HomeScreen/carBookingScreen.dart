import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:traning_task/Resource/resources.dart';

import '../../CustomWidgets/customText.dart';
import 'ChatView/chatView.dart';
import 'homeScreen.dart';

class CarBookingScreen extends StatefulWidget {
  const CarBookingScreen({super.key});
  @override
  State<CarBookingScreen> createState() => _CarBookingScreenState();
}

class _CarBookingScreenState extends State<CarBookingScreen> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  bool isFinished = false;


  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
  double _rating = 2.5;


  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> CustomChatView (data: {
            'name': 'Raheel Ghafoor',
          'contact': '1234567890',
          'profilePhoto': 'https://fastly.picsum.photos/id/318/200/300.jpg?hmac=WEC_ft7NGxXgRDHWhj1tz7_gmAOrnI9d5IiS98juw8I',
          },)));
        },
        backgroundColor: Resource.colors.gColor,
        child: Icon(Icons.message,color: Colors.white,),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: appSize.height * 0.300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Resource.images.car1),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 5,
                right: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                    height: appSize.height * 0.050,
                    width: appSize.width * 0.9,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Icon(Icons.arrow_back, color: Resource.colors.whiteColor),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            },
                          ),
                          GestureDetector(
                            child: Icon(Icons.favorite_border_outlined, color: Resource.colors.whiteColor),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: Resource.texts.gmc,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.020,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                SizedBox(height: appSize.height * 0.01),
                Row(
                  children: [
                    CustomText(
                      title: Resource.texts.rate,
                      textColor: Resource.colors.gColor,
                      fontSize: appSize.height * 0.020,
                      textAlign: TextAlign.start,
                      isBold: false,
                    ),
                    Icon(Icons.star, color: Colors.yellow.shade600, size: 16),
                    CustomText(
                      title: Resource.texts.trip,
                      textColor: Resource.colors.gColor,
                      fontSize: appSize.height * 0.020,
                      textAlign: TextAlign.start,
                      isBold: false,
                    ),
                  ],
                ),
                SizedBox(height: appSize.height * 0.02),
                Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                SizedBox(height: appSize.height * 0.02),
                CustomText(
                  title: Resource.texts.tripdate,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.020,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                SizedBox(height: appSize.height*0.02),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Starting Date", style: TextStyle(color: Resource.colors.textColor)),
                          SizedBox(height: 3),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade200,
                            ),
                            child: TextFormField(
                              style: TextStyle(color: Colors.grey),
                              controller: startDateController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.calendar_month_outlined,color: Colors.grey,),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                              ),
                              readOnly: true,
                              onTap: () => _selectDate(context, startDateController),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ending Date", style: TextStyle(color: Resource.colors.textColor)),
                          SizedBox(height: 3),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade200,
                            ),
                            child: TextFormField(
                              style: TextStyle(color: Colors.grey),
                              controller: endDateController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.calendar_month_outlined,color: Colors.grey,),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                              ),
                              readOnly: true,
                              onTap: () => _selectDate(context, endDateController),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: appSize.height * 0.02),
                Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                SizedBox(height: appSize.height * 0.02),
                CustomText(
                  title: Resource.texts.pickup,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.020,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                SizedBox(height: appSize.height*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(Resource.images.place, height: 35, width: 35, color: Colors.grey),
                        SizedBox(width: appSize.width*0.010,),
                        Padding(
                          padding: const EdgeInsets.only(top: 16,left: 10),
                          child: CustomText(
                            title: Resource.texts.zocalo,
                            textColor: Resource.colors.gColor,
                            fontSize: appSize.height * 0.018,
                            textAlign: TextAlign.start,
                            isBold: false,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomText(
                        title: Resource.texts.change,
                        textColor: Resource.colors.textColor,
                        fontSize: appSize.height * 0.020,
                        textAlign: TextAlign.start,
                        isBold: false,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: appSize.height*0.02),
                Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                SizedBox(height: appSize.height*0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: Resource.texts.distance,
                      textColor: Resource.colors.textColor,
                      fontSize: appSize.height * 0.020,
                      textAlign: TextAlign.start,
                      isBold: false,
                    ),
                    SizedBox(height: appSize.height*0.02),
                    CustomText(
                      title: Resource.texts.unlimited,
                      textColor: Resource.colors.gColor,
                      fontSize: appSize.height * 0.018,
                      textAlign: TextAlign.start,
                      isBold: false,
                    ),
                    SizedBox(height: appSize.height*0.02),
                    Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                    SizedBox(height: appSize.height*0.02),



                  ],
                ),
                CustomText(
                  title: Resource.texts.insurance,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.020,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                SizedBox(height: appSize.height*0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: Resource.texts.insurancevia,
                      textColor: Resource.colors.gColor,
                      fontSize: appSize.height * 0.018,
                      textAlign: TextAlign.start,
                      isBold: false,
                    ),
                    CustomText(
                      title: Resource.texts.read,
                      textColor: Resource.colors.textColor,
                      fontSize: appSize.height * 0.020,
                      textAlign: TextAlign.start,
                      isBold: false,
                    ),
                  ],
                ),
                SizedBox(height: appSize.height*0.02),
                Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                SizedBox(height: appSize.height*0.02),
                CustomText(
                  title: Resource.texts.carbasics,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.020,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                SizedBox(height: appSize.height*0.02),
                Padding(
                  padding: EdgeInsets.only(right: 20.0,left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(Resource.images.seat),
                          SizedBox(height: appSize.height*0.01),
                          Text("5 seats",style: TextStyle(color: Resource.colors.gColor,fontSize: appSize.height*0.014),textAlign: TextAlign.start,),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(Resource.images.door,),
                          SizedBox(height: appSize.height*0.01),
                          Text("4 doors",style: TextStyle(color: Resource.colors.gColor,fontSize: appSize.height*0.014),textAlign: TextAlign.start,),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(Resource.images.manual),
                          SizedBox(height: appSize.height*0.01),
                          Text("Manual",style: TextStyle(color: Resource.colors.gColor,fontSize: appSize.height*0.014),textAlign: TextAlign.start,),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(Resource.images.mpg),
                          SizedBox(height: appSize.height*0.01),
                          Text("30 mpg",style: TextStyle(color: Resource.colors.gColor,fontSize: appSize.height*0.014),textAlign: TextAlign.start,),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                SizedBox(height: appSize.height*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: Resource.texts.features,
                      textColor: Resource.colors.textColor,
                      fontSize: appSize.height * 0.020,
                      textAlign: TextAlign.start,
                      isBold: false,
                    ),
                    CustomText(
                      title: Resource.texts.seeall,
                      textColor: Resource.colors.textColor,
                      fontSize: appSize.height * 0.020,
                      textAlign: TextAlign.start,
                      isBold: false,
                    ),
                  ],
                ),
                SizedBox(height: appSize.height*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(Resource.images.high,height: 29,),
                        SizedBox(height: appSize.height*0.01),
                        Text("High Beams",style: TextStyle(color: Resource.colors.gColor,fontSize: appSize.height*0.013),textAlign: TextAlign.start,),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(Resource.images.area,height: 29,),
                        SizedBox(height: appSize.height*0.01),
                        Text("Spot Monitor",style: TextStyle(color: Resource.colors.gColor,fontSize: appSize.height*0.013),textAlign: TextAlign.start,),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(Resource.images.warning,height: 29,),
                        SizedBox(height: appSize.height*0.01),
                        Text("lane departurel",style: TextStyle(color: Resource.colors.gColor,fontSize: appSize.height*0.013),textAlign: TextAlign.start,),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(Resource.images.sensor,height: 29,),
                        SizedBox(height: appSize.height*0.01),
                        Text("Parking sensors",style: TextStyle(color: Resource.colors.gColor,fontSize: appSize.height*0.013),textAlign: TextAlign.start,),
                      ],
                    ),
                  ],
                ),
                Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                SizedBox(height: appSize.height*0.02),
                CustomText(
                  title: Resource.texts.description,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.020,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                SizedBox(height: appSize.height*0.02),
                CustomText(
                  title: Resource.texts.descriptions,
                  textColor: Resource.colors.gColor,
                  fontSize: appSize.height * 0.016,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                SizedBox(height: appSize.height*0.02),
                Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                SizedBox(height: appSize.height*0.01),
                Text("Ratings and reviews",style: TextStyle(color: Resource.colors.textColor,fontSize: appSize.height*0.020),textAlign: TextAlign.start,),
                SizedBox(height: appSize.height*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '$_rating',
                      style: const TextStyle(fontSize: 30.0),
                    ),
                    SizedBox(width: appSize.width*0.02,),

                    AnimatedRatingStars(
                      initialRating: 2.5,
                      onChanged: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      },
                      readOnly: true,
                      displayRatingValue: true,
                      interactiveTooltips: true,
                      customFilledIcon: Icons.star,
                      customHalfFilledIcon: Icons.star_half,
                      customEmptyIcon: Icons.star_border,
                      starSize: 30.0,
                      animationDuration: const Duration(milliseconds: 500),
                      animationCurve: Curves.easeInOut,
                    ),
                  ],
                ),
                SizedBox(height: appSize.height*0.01,),
                Text("Average ratings on this month",style: TextStyle(color: Resource.colors.gColor,
                    fontSize: appSize.height*0.018),textAlign: TextAlign.start,),
                SizedBox(height: appSize.height*0.01,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(Resource.images.circle1,),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Catherine Powell",
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              Image.asset(Resource.images.star, height: appSize.height * 0.017),
                              Image.asset(Resource.images.star, height: appSize.height * 0.017),
                              Image.asset(Resource.images.star, height: appSize.height * 0.017),
                              Image.asset(Resource.images.star, height: appSize.height * 0.017),
                              Image.asset(Resource.images.star, height: appSize.height * 0.017),
                              SizedBox(width: 5),
                              Text(
                                "| 2 weeks ago",
                                style: TextStyle(
                                  color: Resource.colors.gColor,
                                  fontSize: appSize.height * 0.018,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            "I had a fantastic experience with this service. "
                                "I was incredibly pleased with the results. The provider was highly responsive throughout the process.",
                            style: TextStyle(
                              color: Resource.colors.gColor,
                              fontSize: appSize.height * 0.016,
                            ),
                            textAlign: TextAlign.start,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: appSize.height*0.02),
                Text(
                  "See all reviews",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: appSize.height*0.02),
                Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                SizedBox(height: appSize.height*0.02),
                Text(
                  "Hosted by",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: appSize.height*0.02),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/hostedby.png'),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Alex Wayne",
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              Text(
                                "5.0",
                                style: TextStyle(
                                  color: Resource.colors.gColor,
                                  fontSize: appSize.height * 0.018,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(width: 5),
                              Image.asset(Resource.images.star, height: appSize.height * 0.017),
                              SizedBox(width: 5),
                              Text(
                                "(10245 trips)",
                                style: TextStyle(
                                  color: Resource.colors.gColor,
                                  fontSize: appSize.height * 0.018,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            "joined Jul 2020",
                            style: TextStyle(
                              color: Resource.colors.gColor,
                              fontSize: appSize.height * 0.018,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Typically responds within 1 minute",
                            style: TextStyle(
                              color: Resource.colors.gColor,
                              fontSize: appSize.height * 0.018,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: appSize.height*0.02),
                Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
                SizedBox(height: appSize.height*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Report listing",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: appSize.height*0.04),
                SwipeableButtonView(
                  buttonText: Resource.texts.slid,
                  buttonWidget: Container(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Resource.colors.mainColor,
                    ),

                  ),
                  activeColor: Colors.black26,
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        isFinished = true;
                      });
                    });
                  },
                  onFinish: () async {
                    setState(() {
                      isFinished = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}