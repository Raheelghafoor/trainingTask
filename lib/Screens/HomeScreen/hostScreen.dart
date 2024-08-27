import 'package:flutter/material.dart';


import '../../CustomWidgets/customText.dart';
import '../../Resource/resources.dart';

class HostScreen extends StatefulWidget {
  const HostScreen({super.key});

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Resource.colors.whiteColor,
      body: Column(
        children: [
          Image.asset(Resource.images.host),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: Resource.texts.host,
                  textColor: Resource.colors.textColor,
                  fontSize: appSize.height * 0.025,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
                SizedBox(height: appSize.height * 0.010),
                CustomText(
                  title: Resource.texts.unlock,
                  textColor: Colors.grey.shade400,
                  fontSize: appSize.height * 0.020,
                  textAlign: TextAlign.start,
                  isBold: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}