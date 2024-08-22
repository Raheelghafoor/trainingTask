import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/about.dart';
import 'package:flutter_application_2/screens/account.dart';
import 'package:flutter_application_2/screens/chat.dart';
import 'package:flutter_application_2/screens/detailsHero.dart';
import 'package:flutter_application_2/screens/favourite.dart';
import 'package:flutter_application_2/screens/forgot_password.dart';
import 'package:flutter_application_2/screens/hero.dart';
import 'package:flutter_application_2/screens/host.dart';
import 'package:flutter_application_2/screens/location.dart';
import 'package:flutter_application_2/screens/login.dart';
import 'package:flutter_application_2/screens/menu.dart';
import 'package:flutter_application_2/screens/notifications.dart';
import 'package:flutter_application_2/screens/profile.dart';
import 'package:flutter_application_2/screens/profileEdit.dart';
// import 'package:flutter_application_2/screens/login.dart';
import 'package:flutter_application_2/screens/signup.dart';
import 'package:flutter_application_2/screens/trips.dart';
import 'package:flutter_application_2/screens/verification.dart';
// import 'package:flutter_application_2/screens/home.dart';
// import 'package:flutter_application_2/login.dart';
// import 'package:flutter_application_2/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
      routes: {
        '/login': (context) => const Login(),
        '/forgot_password': (context) => const ForgotPassword(),
        '/profile': (context) => const Profile(
              email: '',
              password: '',
              password2: '',
            ),
        '/verification': (context) => const Verification(
              email: '',
            ),
        '/location': (context) => const Location(),
        '/hero': (context) => const Heroo(),
        '/host': (context) => const Host(),
        '/chat': (context) => const Chat(),
        '/trips': (context) => const Trips(),
        '/menu': (context) => const Menu(),
        '/notifications': (context) => const Notifications(),
        '/accounts': (context) => const Account(),
        'about': (context) => const About(),
        '/profileEdit': (context) => const Profileedit(),
        '/detailsHero': (context) => const Detailshero(),
        '/favourites': (context) => const Favourite()
      },
    );
  }
}
