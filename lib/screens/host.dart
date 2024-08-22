import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/bottomnavbar.dart';

class Host extends StatefulWidget {
  const Host({super.key});

  @override
  State<Host> createState() => _HostState();
}

class _HostState extends State<Host> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/host.png',
            width: MediaQuery.of(context)
                .size
                .width, // Set width to full screen width
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 70),
            child: Text(
              "Become a host",
              style:
                  TextStyle(fontSize: 25, color: Color.fromARGB(255, 7, 7, 7)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Unlock the potential of your vehicle and turn it into a source of income by becoming a host with our car rental platform. Join our community of hosts and start earning money by renting out your car to travelers and locals alike',
              style: TextStyle(color: Color.fromARGB(255, 99, 98, 98)),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
