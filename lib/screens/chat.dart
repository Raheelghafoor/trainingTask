import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/bottomnavbar.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int _selectedindex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chat',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: const Icon(Icons.search_rounded),
                    hintText: "Search...",
                    filled: true,
                    fillColor: const Color.fromARGB(255, 213, 210, 210),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomListTile(
                  avatarImagePath: 'assets/images/avatar.png',
                  title: "Noman",
                  subtitle: "subtitle",
                  time: "10:30 am",
                  trailingIcon: Icons.done),
              const SizedBox(height: 20),
              const CustomListTile(
                  avatarImagePath: 'assets/images/avatar.png',
                  title: "Ibrahim",
                  subtitle: "subtitle",
                  time: "10:30 am",
                  trailingIcon: Icons.done),
              const SizedBox(height: 20),
              const CustomListTile(
                  avatarImagePath: 'assets/images/avatar.png',
                  title: "Hamza",
                  subtitle: "subtitle",
                  time: "10:30 am",
                  trailingIcon: Icons.done),
              const SizedBox(height: 20),
              const CustomListTile(
                  avatarImagePath: 'assets/images/avatar.png',
                  title: "rafay",
                  subtitle: "subtitle",
                  time: "10:30 am",
                  trailingIcon: Icons.done),
              const SizedBox(height: 20),
              const CustomListTile(
                  avatarImagePath: 'assets/images/avatar.png',
                  title: "john doe",
                  subtitle: "subtitle",
                  time: "10:30 am",
                  trailingIcon: Icons.done),
              const SizedBox(height: 20),
              const CustomListTile(
                  avatarImagePath: 'assets/images/avatar.png',
                  title: "john doe",
                  subtitle: "subtitle",
                  time: "10:30 am",
                  trailingIcon: Icons.done),
              const SizedBox(height: 20),
            ],
          ),
        ),
        bottomNavigationBar:
            BottomNavBar(currentIndex: _selectedindex, onTap: _onItemTapped));
  }
}
// import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String avatarImagePath;
  final String title;
  final String subtitle;
  final String time;
  final IconData? trailingIcon;

  const CustomListTile({
    Key? key,
    required this.avatarImagePath,
    required this.title,
    required this.subtitle,
    required this.time,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(right: 16.0),
      leading: CircleAvatar(
        backgroundImage: AssetImage(avatarImagePath),
        radius: 30,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            time,
            style: const TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
          if (trailingIcon != null)
            Icon(
              trailingIcon,
              color: Colors.grey,
            ),
        ],
      ),
    );
  }
}
