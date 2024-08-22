import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/chat.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 20, top: 30),
        child: Column(
          children: [
            CustomListTile(
                avatarImagePath: 'assets/images/notification.png',
                title: "Welcome to Express Rental",
                subtitle:
                    "Thanks for joining express rental community Your adventure starts here\nYesterday, 9:15 pm",
                time: ""),
            SizedBox(
              height: 10,
            ),
            CustomListTile(
                avatarImagePath: 'assets/images/notification.png',
                title: "Great News",
                subtitle:
                    "Your account has been created successfully\nThursday, 29 Feb, 9:15 pm",
                time: ""),
          ],
        ),
      ),
    );
  }
}
