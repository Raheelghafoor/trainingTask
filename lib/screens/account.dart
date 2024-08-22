import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/textfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _isSwitched = false;
  bool _isSwitchedd = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });
  }

  void _toggleSwitchh(bool value) {
    setState(() {
      _isSwitchedd = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20), // Adjust left padding
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Login Settings',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                label: "Email",
                hintText: "example@gmail.com",
                obscureText: false,
                width: double.infinity,
                // Added marginLeft parameter
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(
                label: "Password",
                hintText: "Enter password",
                obscureText: true,
                width: double.infinity,
                // Added marginLeft parameter
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 5),
                child: Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    counterText: "",
                    filled: true,
                    fillColor: const Color.fromARGB(255, 213, 210, 210),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  initialCountryCode: 'PK',
                  onChanged: (phone) {},
                  cursorWidth: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 0),
                child: ListTile(
                  title: Text("Google"),
                  subtitle: Text("Not connected"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: double.infinity, // Set the width of the left divider
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 0),
                child: ListTile(
                  title: Text("Facebook"),
                  subtitle: Text("Not connected"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: double.infinity, // Set the width of the left divider
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 5),
                child: Text(
                  "Payment Settings",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 0),
                child: ListTile(
                  title: Text("Add Travel Credit"),
                  subtitle: Text("Travel credit : US 0.00"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: double.infinity, // Set the width of the left divider
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 5),
                child: Text(
                  "Notifications Settings",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Enable Notifications',
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                      value: _isSwitchedd,
                      onChanged: _toggleSwitchh,
                      activeColor: Color.fromARGB(255, 110, 62, 14),
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey[300],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: double.infinity, // Set the width of the left divider
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 5),
                child: Text(
                  "General Settings",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Manual Transmissions',
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                      value: _isSwitched,
                      onChanged: _toggleSwitch,
                      activeColor: Color.fromARGB(255, 110, 62, 14),
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey[300],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: double.infinity, // Set the width of the left divider
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 0),
                child: ListTile(
                  title: Text("Approved Status"),
                  subtitle: Text("Not Approved"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: double.infinity, // Set the width of the left divider
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 20),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Close your account",
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
