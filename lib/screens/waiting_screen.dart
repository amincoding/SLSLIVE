import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

// ignore: camel_case_types
class waiting_screen extends StatefulWidget {
  static String id = 'waiting_screen';

  @override
  _waiting_screenState createState() => _waiting_screenState();
}

// ignore: camel_case_types
class _waiting_screenState extends State<waiting_screen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
        backgroundColor: (KBackGroundColor),
        body: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(75),
                right: ScreenUtil().setWidth(30),
                top: ScreenUtil().setHeight(115),
                bottom: ScreenUtil().setHeight(50)),
            child: Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // Image(
                  //   image: AssetImage('assets/logo.ico'),
                  // ),
                  Center(
                    heightFactor: ScreenUtil().setHeight(4),
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
          Center(
            child: CircularProgressIndicator(),
          ),
        ]));
  }
}
