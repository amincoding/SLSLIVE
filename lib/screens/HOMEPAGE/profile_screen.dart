import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/main.dart';
import 'package:viplive/screens/HOMEPAGE/My_orders.dart';
import 'package:viplive/screens/HOMEPAGE/customer_support.dart';
import 'package:viplive/screens/HOMEPAGE/edit_profile_screen.dart';
import 'package:viplive/screens/HOMEPAGE/notification_settings.dart';
import 'package:viplive/screens/HOMEPAGE/My_Orders_Empty.dart';
import 'package:viplive/screens/HOMEPAGE/payment_method.dart';
import 'package:viplive/screens/HOMEPAGE/profile_screen_sp.dart';
import 'package:viplive/screens/HOMEPAGE/shipping_adress_screen.dart';
import 'package:viplive/screens/Start.dart';
import 'package:viplive/screens/signin_email.dart';
import 'package:viplive/services/auth.dart';

import '../../SLS.dart';

// ignore: camel_case_types
class profile_screen extends StatefulWidget {
  static String id = 'profile_screen';
  @override
  _profile_screenState createState() => _profile_screenState();
}

// ignore: camel_case_types
class _profile_screenState extends State<profile_screen> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(0)),
                child: Center(
                  heightFactor: ScreenUtil().setHeight(0.9),
                  child: Container(
                    height: ScreenUtil().setHeight(350),
                    width: ScreenUtil().setWidth(350),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/face_shape_holder.svg',
                        color: Colors.pink,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(280),
                  top: ScreenUtil().setHeight(50)),
              child: Container(
                child: IconButton(
                  icon: SvgPicture.asset('assets/x_close_screen.svg'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Center(
              heightFactor: ScreenUtil().setHeight(1.1),
              child: Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(200),
                    bottom: ScreenUtil().setHeight(20)),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: SLS.username,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Color(0XFF063E7E)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              heightFactor: ScreenUtil().setHeight(30),
              child: Divider(
                thickness: 1,
                indent: 40,
                endIndent: 30,
                color: Color(0xFF3593FF),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(275)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, edit_profile_screen.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(40),
                        ),
                        SvgPicture.asset('assets/edit_profile.svg'),
                        SizedBox(
                          width: ScreenUtil().setWidth(30),
                        ),
                        Text(
                          'Edit profile',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF063E7E),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(150),
                        ),
                        SvgPicture.asset('assets/go_in.svg')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(25),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, shipping_adress_screen.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(40),
                        ),
                        SvgPicture.asset('assets/shipping_adress.svg'),
                        SizedBox(
                          width: ScreenUtil().setWidth(30),
                        ),
                        Text(
                          'Shipping adress',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF063E7E),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(115),
                        ),
                        SvgPicture.asset('assets/go_in.svg')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(25),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, payment_method.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        SvgPicture.asset('assets/payment.svg'),
                        SizedBox(
                          width: ScreenUtil().setWidth(27),
                        ),
                        Text(
                          'Payment method',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF063E7E),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(110),
                        ),
                        SvgPicture.asset('assets/go_in.svg')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(25),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (SLS.Orders == 0) {
                        Navigator.pushNamed(context, My_Orders_Empty.id);
                      } else {
                        Navigator.pushNamed(context, notification_settings.id);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(40),
                        ),
                        SvgPicture.asset('assets/my_oreder_icon.svg'),
                        SizedBox(
                          width: ScreenUtil().setWidth(30),
                        ),
                        Text(
                          'My orders',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF063E7E),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(158),
                        ),
                        SvgPicture.asset('assets/go_in.svg')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(25),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, notification_settings.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(40),
                        ),
                        SvgPicture.asset('assets/notification_icon_2.svg'),
                        SizedBox(
                          width: ScreenUtil().setWidth(30),
                        ),
                        Text(
                          'Notification settings',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF063E7E),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(88),
                        ),
                        SvgPicture.asset('assets/go_in.svg')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(25),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, customer_support.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(40),
                        ),
                        SvgPicture.asset('assets/customer_support_icon.svg'),
                        SizedBox(
                          width: ScreenUtil().setWidth(30),
                        ),
                        Text(
                          'Customer support',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF063E7E),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(100),
                        ),
                        SvgPicture.asset('assets/go_in.svg')
                      ],
                    ),
                  ),
                  Center(
                    heightFactor: ScreenUtil().setHeight(5),
                    child: Divider(
                      thickness: 1,
                      indent: 40,
                      endIndent: 30,
                      color: Color(0xFF3593FF),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1, right: 120),
                    child: Container(
                      height: ScreenUtil().setHeight(40),
                      width: ScreenUtil().setWidth(160),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            'Become a Seller',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0x0FF838282),
                            ),
                          ),
                          onPressed: () {

                          }),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(50),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/SIGN_OUT.svg',
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(6),
                      ),
                      GestureDetector(
                        onTap: () async {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacementNamed(context, signin_email.id);
                        },
                        child: Text(
                          'LOG OUT',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0x0FF838282),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
