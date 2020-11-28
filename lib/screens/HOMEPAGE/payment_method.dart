import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/PayPal_screen.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';
import 'package:viplive/screens/HOMEPAGE/profile_screen.dart';

import '../../constants.dart';

// ignore: camel_case_types
class payment_method extends StatefulWidget {
  static String id = 'payment_method';

  @override
  _payment_methodState createState() => _payment_methodState();
}

// ignore: camel_case_types
class _payment_methodState extends State<payment_method> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        leading: new IconButton(
          icon: SvgPicture.asset(
            'assets/back_appBar.svg',
            color: Colors.grey[400],
            height: ScreenUtil().setHeight(20),
            width: ScreenUtil().setWidth(20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Container(
            height: ScreenUtil().setHeight(55.5),
            width: ScreenUtil().setWidth(260),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Payment method',
                  style: TextStyle(
                    color: Color(0xFF063E7E),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(60),
                ),
                GestureDetector(
                  child: SvgPicture.asset('assets/x_close_screen.svg'),
                  onTap: () {
                    Navigator.pushNamed(context, homeFeeds.id);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(10),
                          top: ScreenUtil().setHeight(25)),
                      child: Container(
                        height: ScreenUtil().setHeight(75),
                        width: ScreenUtil().setWidth(150),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onPressed: () {
                              Navigator.pushNamed(context, payment_method.id);
                            },
                            color: KTextFeildSingUpColor,
                            child: Text('Credit Card',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: KBackGroundColor,
                                ))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: ScreenUtil().setWidth(10),
                          top: ScreenUtil().setHeight(25)),
                      child: Container(
                        height: ScreenUtil().setHeight(75),
                        width: ScreenUtil().setWidth(150),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onPressed: () {
                              Navigator.pushNamed(context, PayPal_Screen.id);
                            },
                            color: Colors.white,
                            child: Text('PayPal',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF063E7E),
                                ))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(50)),
                Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Name On Card',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(10)),
                  child: Container(
                    height: ScreenUtil().setHeight(60),
                    width: ScreenUtil().setWidth(330),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Name On Card',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ))),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(25)),
                Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Card Number',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(10)),
                  child: Container(
                    height: ScreenUtil().setHeight(60),
                    width: ScreenUtil().setWidth(330),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Card Number',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ))),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(25)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: ScreenUtil().setWidth(0)),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'MM/YY',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(10)),
                          child: Container(
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setWidth(150),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'MM/YY',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'CVV',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(12)),
                          child: Container(
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setWidth(150),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'CVV',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(120),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(10),
                      bottom: ScreenUtil().setHeight(10)),
                  child: Container(
                    height: ScreenUtil().setHeight(50),
                    width: ScreenUtil().setWidth(300),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPressed: () {
                          Navigator.pushNamed(context, profile_screen.id);
                        },
                        color: KTextFeildSingUpColor,
                        child: Text('SAVE',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: KBackGroundColor,
                            ))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
