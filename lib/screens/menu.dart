import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/about.dart';
import 'package:flutter_application_2/screens/account.dart';
import 'package:flutter_application_2/screens/notifications.dart';
import 'package:flutter_application_2/screens/profileEdit.dart';
// import 'package:flutter_application_2/screens/hero.dart';
// import 'package:flutter_application_2/screens/chat.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "Menu",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
                radius: 30,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Ethan Johnnn',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profileedit()));
                    },
                    child: const Text(
                      'View and edit profile',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomClickableCard(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Account()));
            },
            icon: Icons.account_circle_outlined,
            text: 'Account',
          ),
          CustomClickableCard(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Notifications()));
            },
            icon: Icons.notifications_active_outlined,
            text: 'Notificatons',
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "Help Center",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomClickableCard(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const About()));
            },
            icon: Icons.support_agent_rounded,
            text: 'Contact Support',
          ),
          CustomClickableCard(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Heroo()));
            },
            icon: Icons.leave_bags_at_home_outlined,
            text: 'Legal',
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: const Divider(
              thickness: 2,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomClickableCard(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Heroo()));
            },
            icon: Icons.logout_sharp,
            text: 'Logout',
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "version 10.10.1",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClickableCard extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;

  const CustomClickableCard({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 500,
          height: 70,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: const Color.fromARGB(255, 103, 101, 101),
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 107, 104, 104)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
