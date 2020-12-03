import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viplive/models/postes.dart';
import 'package:viplive/services/auth.dart';
import '../constants.dart';
import '../screens/Signup.dart';
import '../screens/signin_email.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore: camel_case_types
class start extends StatefulWidget {
  static final id = 'loginscreen';

  @override
  _startState createState() => _startState();
}

class _startState extends State<start> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: (KBackGroundColor),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.2, right: 30, top: height * 0.2, bottom: 50),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // Image(
                  //   image: AssetImage('assets/logo.ico'),
                  // ),
                  Center(
                    heightFactor: 0,
                    child: Container(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'SLS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Color(0xFFF899C0))),
                            TextSpan(
                                text: ' Livestream                 ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Color(0xFFF010101))),
                            TextSpan(
                                text:
                                    'Something different, new, this is our app.',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Color(0xFFF899C0))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.26,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    Navigator.pushNamed(context, signin_email.id);
                  },
                  color: KTextFeildSingUpColor,
                  child: Text('LOG IN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KBackGroundColor,
                      )))),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
              child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: KTextFeildSingUpColor,
                  child: Text('SING UP',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KBackGroundColor,
                      ))))
        ],
      ),
    );
  }
}
