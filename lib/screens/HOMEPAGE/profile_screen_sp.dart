import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/main.dart';
import 'package:viplive/screens/DASHBOARD/Dashboard_Seller.dart';
import 'package:viplive/screens/DASHBOARD/Dashboard_Seller_checked.dart';
import 'package:viplive/screens/HOMEPAGE/My_orders.dart';
import 'package:viplive/screens/HOMEPAGE/customer_support.dart';
import 'package:viplive/screens/HOMEPAGE/edit_profile_screen.dart';
import 'package:viplive/screens/HOMEPAGE/notification_settings.dart';
import 'package:viplive/screens/HOMEPAGE/My_Orders_Empty.dart';
import 'package:viplive/screens/HOMEPAGE/payment_method.dart';
import 'package:viplive/screens/HOMEPAGE/shipping_adress_screen.dart';

import '../../SLS.dart';

// ignore: camel_case_types
class profile_screen_sp extends StatefulWidget {
  static String id = 'profile_screen_sp';
  @override
  _profile_screen_spState createState() => _profile_screen_spState();
}

// ignore: camel_case_types
class _profile_screen_spState extends State<profile_screen_sp> {
  String name = 'omar';

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
                        text: name,
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
              heightFactor: ScreenUtil().setHeight(29),
              child: Divider(
                thickness: 1,
                indent: 40,
                endIndent: 30,
                color: Color(0xFF3593FF),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(250)),
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
                          width: ScreenUtil().setWidth(40),
                        ),
                        SvgPicture.asset('assets/payment.svg'),
                        SizedBox(
                          width: ScreenUtil().setWidth(30),
                        ),
                        Text(
                          'Payment method',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF063E7E),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(104),
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
                      if (SLS.Orders == null) {
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
                    height: ScreenUtil().setHeight(30),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(25),
                        right: ScreenUtil().setWidth(25)),
                    child: Container(
                      height: ScreenUtil().setHeight(60),
                      width: ScreenUtil().setWidth(350),
                      child: RaisedButton(
                          color: Color(0xFF063E7E),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            'DASHBOARD',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            if (SLS.Revenue < 100) {
                              Navigator.pushNamed(context, Dashboard_Seller.id);
                            }
                            if (SLS.Revenue >= 100) {
                              Navigator.pushNamed(
                                  context, Dashboard_Seller_checked.id);
                            }
                          }),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(35),
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
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(5),
                            right: ScreenUtil().setWidth(160)),
                        child: GestureDetector(
                          onTap: () {},
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
