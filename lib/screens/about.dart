import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/textfield.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 10),
            child: Center(
              child: Text(
                "Tell hosts and guests about yourself and why you’re a responsible, trustworthy person. share your favorite travel experiences, your hobbies, your dream car, or your driving experience. Feel free to include your LinkedIn, Twitter, or Facebook profiles so they get to know you even better.",
                style: TextStyle(color: Color.fromARGB(255, 113, 110, 110)),
              ),
            ),
          ),
          const CustomTextField(
              label: "About",
              hintText: "Tell people about yourself",
              obscureText: false),
          const CustomTextField(
              label: "Lives",
              hintText: "California, United States",
              obscureText: false),
          const CustomTextField(
              label: "Works",
              hintText: "Amazaon, Virtual Assistant",
              obscureText: false),
          const CustomTextField(
              label: "Languages",
              hintText: "English, Arabic, Spanish",
              obscureText: false),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () {},
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
              "Save",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
