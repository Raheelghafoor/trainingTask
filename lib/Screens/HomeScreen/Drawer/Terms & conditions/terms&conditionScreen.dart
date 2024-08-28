import 'package:flutter/material.dart';

import '../../../../Resource/resources.dart';
import '../drawer.dart';


class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Resource.colors.whiteColor,
        appBar: AppBar(
        backgroundColor: Resource.colors.whiteColor,
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Resource.colors.textColor),
          onPressed: () {
          Navigator.push(
            context,
         MaterialPageRoute(builder: (context) => CustomDrawer()),
        );
        },
        ),
        ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Agreement",style: TextStyle(color: Resource.colors.gColor,
                fontSize: appSize.height*0.018),textAlign: TextAlign.start,),
            SizedBox(height: appSize.height*0.01,),
            Text("Terms & conditions",style: TextStyle(color: Resource.colors.textColor,
                fontSize: appSize.height*0.032),textAlign: TextAlign.start,),
            SizedBox(height: appSize.height*0.01,),
            Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
            SizedBox(height: appSize.height*0.01,),

            Text("These Terms and Conditions govern your use of the Express Car Rental App provided",
              style: TextStyle(color: Resource.colors.gColor,
                fontSize: appSize.height*0.016),textAlign: TextAlign.start,),
            SizedBox(height: appSize.height*0.02,),
            SizedBox(height: appSize.height*0.01,),
            Text("1. Acceptance of Terms: By downloading, installing,accessing, or using the Express Car Rental App,you agree to be bound by these Terms."
                " TheCompany reserves the right to update, modify, or replace these Terms at any time without prior notice. Your continued use of "
                "the App after any changes to these Terms constitutes acceptance of such changes.",
              style: TextStyle(color: Resource.colors.gColor,
                  fontSize: appSize.height*0.016),textAlign: TextAlign.start,),
            SizedBox(height: appSize.height*0.01,),

            Text("2.Registration: To access certain features of the Express Car Rental App, you may be required to register and provide personal"
                " information. You agree to provide accurate, current, and complete information during the registration process and to update"
                " such information to keep it accurate urrent, and complete. You are solely responsible for maintaining the confidentiality of "
                "your account credentials and for all activities that occur under," ,style: TextStyle(color: Resource.colors.gColor,
                  fontSize: appSize.height*0.016),textAlign: TextAlign.start,),
            SizedBox(height: appSize.height*0.01,),
            Text("3. Use of the App: The Express Car Rental App is intended for personal, non-commercial use only.You agree not to use"
                " the App for any unlawful or prohibited purpose or in any manner that could damage, disable, overburden, or impair the "
                "functionality of the App." ,style: TextStyle(color: Resource.colors.gColor,
                fontSize: appSize.height*0.016),textAlign: TextAlign.start,),
            SizedBox(height: appSize.height*0.01,),



          ],

        ),
      ),

    );
  }
}
