// import 'package:http/http.dart';

import 'package:flutter/material.dart';

class Profileedit extends StatefulWidget {
  const Profileedit({
    super.key,
  });

  @override
  State<Profileedit> createState() => _ProfileeditState();
}

class _ProfileeditState extends State<Profileedit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              ),
              Positioned(
                right: 150,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 178, 87, 45), // Background color of the border
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 4.0,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit_outlined),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Ethan Johns",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const Center(
            child: Text(
              "Joined Dec 2023",
              style: TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 112, 108, 108)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(
              thickness: 2,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          const Center(
            child: Text(
              "Profile with personal info and connected social\n               media appear more trustworthy",
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 112, 108, 108)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(
              thickness: 2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
            child: Text(
              "Verified Info",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              width: double.infinity,
              height: 40,
              color: Color.fromARGB(255, 255, 255, 255),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email Address',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.verified_outlined,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              width: double.infinity,
              height: 40,
              color: Color.fromARGB(255, 255, 255, 255),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.verified_outlined,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              width: double.infinity,
              height: 40,
              color: Color.fromARGB(255, 255, 255, 255),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email Address',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Connect",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "No Reviews yet",
              style: TextStyle(fontSize: 21),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(
              thickness: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(370, 0, 10, 0),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                    255, 178, 87, 45), // Background color of the border
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 4.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_outlined),
                      color: Colors.white,
                      iconSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
