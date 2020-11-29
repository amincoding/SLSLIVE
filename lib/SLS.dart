import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SLS extends StatefulWidget {
  static String fullname;
  static String username;
  static String Email;
  static String password;
  static int PhoneNumber;
  static int Orders = 0;
  static int Revenue = 0;
  static int Followers = 0;
  static int NewMembers = 0;
  static List<String> MembersList = [''];
  static int new_messages = 2;

  static bool isAdming(){
    if (SLS.Email == "aminebr70@gmail.com"){
      return true;
    }else{
      return false;
    }
  }




  @override
  _SLSState createState() => _SLSState();
}



class _SLSState extends State<SLS> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
