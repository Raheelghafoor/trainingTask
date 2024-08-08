import 'package:flutter/material.dart';

import '../../../../CustomWidgets/customText.dart';
import '../../../../Resource/resources.dart';
import '../drawer.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
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
      ),
      body: Container(
        color: Resource.colors.whiteColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: appSize.height * 0.065,
                      backgroundImage: AssetImage(Resource.images.menu),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: appSize.height * 0.040,
                        decoration: BoxDecoration(
                          color: Resource.colors.mainColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: appSize.height * 0.003,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          iconSize: appSize.height * 0.020,
                          padding: EdgeInsets.all(appSize.height * 0.005),
                          onPressed: () {

                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: appSize.height * 0.02),
                CustomText(
                  title: Resource.texts.john,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.024,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                Text(
                  'Joined Dec 2023',
                  style: TextStyle(
                    color: Resource.colors.gColor,
                    fontSize: appSize.height * 0.016,
                  ),
                ),
              ],
            ),
            SizedBox(height: appSize.height * 0.013),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: appSize.height * 0.02),
              child: Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10, right: 25, left: 40),
              child: CustomText(
                title: Resource.texts.ptext,
                textColor: Resource.colors.gColor,
                fontSize: appSize.height * 0.016,
                textAlign: TextAlign.start,
                isBold: false,
              ),
            ),
            SizedBox(height: appSize.height * 0.013),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: appSize.height * 0.02),
              child: Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
            ),
            ListTile(
              title: Text("Verified Info"),
            ),
            ListTile(
              title: Text("Email address"),
              trailing:
                Icon(Icons.gpp_good_outlined, color: Resource.colors.mainColor, size: 24),
              ),
            ListTile(
              title: Text("Phone number"),
              trailing:
              Icon(Icons.gpp_good_outlined, color: Resource.colors.mainColor, size: 24),
            ),
            ListTile(
              title: Text("Facebook"),
              trailing:CustomText(
                title: Resource.texts.connect,
                textColor: Resource.colors.textColor,
                fontSize: appSize.height * 0.016,
                textAlign: TextAlign.start,
                isBold: false,
              ),
            ),
            CustomText(
              title: Resource.texts.noreview,
              textColor: Resource.colors.textColor,
              fontSize: appSize.height * 0.018,
              textAlign: TextAlign.center,
              isBold: false,
            ),
            SizedBox(height: appSize.height * 0.018),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: appSize.height * 0.02),
              child: Divider(color: Resource.colors.gColor, thickness: appSize.height * 0.001),
            ),
            Container(
              alignment: Alignment.centerRight,

              child: Padding(
                padding: EdgeInsets.only(right: appSize.height * 0.02, top: appSize.height * 0.02),
                child: Container(
                  height: appSize.height * 0.055,
                  decoration: BoxDecoration(
                    color: Resource.colors.mainColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.edit, color:Resource.colors.whiteColor),
                    iconSize: appSize.height * 0.025,
                    padding: EdgeInsets.all(appSize.height * 0.005),
                    onPressed: () {

                    },
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}