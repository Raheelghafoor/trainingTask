import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/bottomnavbar.dart';

class Trips extends StatefulWidget {
  const Trips({super.key});

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  int selectedIndex = 3; // For BottomNavBar
  int tabIndex = 0; // For Booked/History tabs

  void _onBottomNavBarTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _onTabButtonPressed(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 70),
            child: Text(
              "Trips",
              style:
                  TextStyle(fontSize: 25, color: Color.fromARGB(255, 7, 7, 7)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAnimatedButton('Booked', 0),
                _buildAnimatedButton('History', 1),
              ],
            ),
          ),
          Expanded(
            child: tabIndex == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top:
                                  0), // Adjust the padding to move the image up
                          child: Image.asset('assets/images/location.png'),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'No Trips!',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 80, 78, 78),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Profile()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              51,
                              49,
                              49,
                            ),
                            fixedSize: const Size(350, 60),
                          ),
                          child: const Text(
                            "Find Vehicles",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: Text("History Content"),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
          currentIndex: selectedIndex, onTap: _onBottomNavBarTapped),
    );
  }

  Widget _buildAnimatedButton(String label, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: tabIndex == index
            ? Color.fromARGB(255, 255, 145, 0)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: tabIndex == index ? 20.0 : 10.0),
      child: TextButton(
        onPressed: () => _onTabButtonPressed(index),
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (tabIndex == index) {
                return const Color.fromARGB(255, 255, 255, 254);
              }
              return Color.fromARGB(255, 92, 88, 88);
            },
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
