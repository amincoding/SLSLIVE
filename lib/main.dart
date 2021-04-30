import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:viplive/services/auth.dart';
import 'package:viplive/services/RootPage.dart';
import 'package:viplive/screens/Start.dart';
import 'package:viplive/screens/thankyou_screen.dart';
import 'package:viplive/screens/waiting_screen.dart';
import 'screens/Start.dart';
import 'screens/signup.dart';
import 'screens/signUpEmail.dart';
import 'screens/signin_email.dart';
import 'screens/HOMEPAGE/home_feeds.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RootPage(auth: Auth()),
        routes: {
          start.id: (context) => start(),
          signup.id: (context) => signup(),
          signUpEmail.id: (context) => signUpEmail(),
          signin_email.id: (context) => signin_email(),
          waiting_screen.id: (context) => waiting_screen(),
          thankyou_screen.id: (context) => thankyou_screen(),
          homeFeeds.id: (context) => homeFeeds(),
        },
    );
  }
}
