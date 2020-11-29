import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  static int notifications = 0;

  static test(){
    if (SLS.notifications != 0){
      final icon =  SvgPicture.asset('assets/notifications_icon.svg');
      return icon;
    }
    else{
      final icon = SvgPicture.asset('assets/no_notification_bell.svg');
      return icon;
    }
  }

  static bool isAdming(String Email){
    if (Email == 'aminebr70@gmail.com'){
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
