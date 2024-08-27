import 'package:flutter/material.dart';

import '../../../CustomWidgets/CustomText.dart';
import '../../../CustomWidgets/customAddVehicles.dart';
import '../../../Resource/resources.dart';
import '../Account/accountScreen.dart';
import '../Notification/notificationScreen.dart';
import '../homeScreen.dart';
import 'About/aboutScreen.dart';
import 'ProfileEdit/profileEdit.dart';
import 'Terms & conditions/terms&conditionScreen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: CustomText(
          title: Resource.texts.menu,
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
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(Resource.images.menu),
              ),
              title:  CustomText(
                title: Resource.texts.john,
                textColor: Resource.colors.textColor,
                fontSize: appSize.height * 0.020,
                textAlign: TextAlign.start,
                isBold: false,
              ),
              subtitle: CustomText(
                title: Resource.texts.edit,
                textColor: Resource.colors.gColor,
                fontSize: appSize.height * 0.016,
                textAlign: TextAlign.start,
                isBold: false,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileEdit()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Resource.colors.textColor),
              title: Text('Account', style: TextStyle(color: Resource.colors.textColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications_none, color: Resource.colors.textColor),
              title: Text('Notifications', style: TextStyle(color: Resource.colors.textColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline, color: Resource.colors.textColor),
              title: Text('About', style: TextStyle(color: Resource.colors.textColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Aboutscreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.description, color: Resource.colors.textColor),
              title: Text('Terms & conditions', style: TextStyle(color: Resource.colors.textColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsScreen()),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: ListTile(
                title: Text('Help Center', style: TextStyle(color:Resource.colors.textColor)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomAddVehicles()),
                  );
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.support_agent_rounded, color: Resource.colors.textColor),
              title: Text('Contact support', style: TextStyle(color:Resource.colors.textColor)),
              onTap: () {}
            ),
            ListTile(
              leading: Icon(Icons.padding, color: Resource.colors.textColor),
              title: Text('Legal', style: TextStyle(color:Resource.colors.textColor)),
              onTap: () {},
            ),
            SizedBox(height: appSize.height* 0.020,),

            Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
            SizedBox(height: appSize.height* 0.020,),
            ListTile(
              leading: Icon(Icons.logout, color: Resource.colors.textColor),
              title: Text('Log Out', style: TextStyle(color:Resource.colors.textColor)),
              onTap: () {},
            ),
            SizedBox(height: appSize.height* 0.020,),

            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: ListTile(
                title: Text('version 10.1.1', style: TextStyle(color:Resource.colors.textColor)),
                onTap: () {
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}