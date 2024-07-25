import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:traning_task/CustomWidgets/customButton.dart';

import '../../CustomWidgets/customText.dart';
import '../../Resource/resources.dart';

class OverView extends StatefulWidget {
  const OverView({super.key});

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: appSize.height*0.060,),
                      CustomText(title: Resource.texts.express, textColor: Resource.colors.textColor,
                          fontSize: appSize.height*0.052 , textAlign: TextAlign.start, isBold: false ),
                      SizedBox(height: appSize.height*0.010,),
                      CustomText(title: Resource.texts.rent, textColor: Resource.colors.textColor,
                          fontSize: appSize.height*0.020 , textAlign: TextAlign.start, isBold: false ),
                    ],
                  ),
                  ),
                ),
                SizedBox(height: appSize.height*0.030,),
                Container(
                  child: Column(
                    children: [
                      Image.asset(Resource.images.car),
                    ],
                  ),
                ),
                Spacer(),


                Container(
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 30.0),
                         child: SwipeableButtonView(
                           buttonText: Resource.texts.slid,
                           buttonWidget: Container(
                             child: Icon(
                               Icons.arrow_forward_ios_rounded,
                               color: Colors.grey,
                             ),
                           ),
                           activeColor: Color(0xFF3C231D),
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
                       ),
                       SizedBox(height: appSize.height*0.040,),
                       Padding(
                         padding: const EdgeInsets.only(left: 30,right: 30),
                         child: CustomButton(text: Resource.texts.already,
                             textColor: Resource.colors.whiteColor, backgroundColor: Resource.colors.primaryColor,
                             fontSize: 18, borderRadius: 30 , onPressed: (){}),
                       ),
                       SizedBox(height: appSize.height*0.040,),

                     ],
                   ),
                ),



              ],
            ),
      ),


    );
  }
}
