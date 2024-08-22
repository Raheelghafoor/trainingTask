import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/hero.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 200),
          const Center(
            child: Text(
              'Where is your Location?',
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 19, 18, 18),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'We need to know your location in order to suggest\nnearby places',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            child: Image.asset(
              'assets/images/location.png',
              width: 250,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Heroo()));
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
              "Continue",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Skip Now',
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 139, 135, 135)),
              ))
        ],
      ),
    );
  }
}
