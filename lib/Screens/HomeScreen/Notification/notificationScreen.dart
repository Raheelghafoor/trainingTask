import 'package:flutter/material.dart';
import 'package:traning_task/Screens/HomeScreen/Drawer/drawer.dart';

import '../../../CustomWidgets/customText.dart';
import '../../../Resource/resources.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
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
        title: CustomText(
          title: Resource.texts.noti,
          textColor: Resource.colors.textColor,
          fontSize: appSize.height * 0.024,
          textAlign: TextAlign.center,
          isBold: false,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Resource.colors.whiteColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: ListTile(
                title: CustomText(
                  title: Resource.texts.to,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.024,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                onTap: () {},
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(Resource.images.noti),
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome to express rental",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: appSize.height * 0.018,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: " : Thanks for joining express rental community. Your adventure starts here.",
                      style: TextStyle(
                        color: Resource.colors.gColor,
                        fontSize: appSize.height * 0.016,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                "Yesterday, 9:15 pm",
                style: TextStyle(
                  fontSize: appSize.height * 0.016,
                  color: Resource.colors.gColor,
                  height: 1.5,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.stop_rounded, color: Resource.colors.mainColor, size: 16),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(Resource.images.noti),
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Great News ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: appSize.height * 0.018,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ": Your account has been created successfully.",
                      style: TextStyle(
                        color: Resource.colors.gColor,
                        fontSize: appSize.height * 0.016,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                "Thu, 29 Feb, 7:10 pm",
                style: TextStyle(
                  fontSize: appSize.height * 0.016,
                  color: Resource.colors.gColor,
                  height: 1.5,
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}