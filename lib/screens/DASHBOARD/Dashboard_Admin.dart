import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';
import 'package:viplive/screens/Productes/addProduct.dart';

import '../../SLS.dart';
import '../../constants.dart';

// ignore: camel_case_types
class Dashboard_Admin extends StatefulWidget {
  static String id = 'Dashboard_Admin';

  @override
  _Dashboard_AdminState createState() => _Dashboard_AdminState();
}

// ignore: camel_case_types
class _Dashboard_AdminState extends State<Dashboard_Admin> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF063E7E),
          elevation: 0.5,
          leading: new IconButton(
              icon: SvgPicture.asset(
                'assets/back_appBar.svg',
                color: Color(0xFF063E7E),
                height: ScreenUtil().setHeight(20),
                width: ScreenUtil().setWidth(10),
              ),
              onPressed: () {}),
          actions: [
            Container(
              height: ScreenUtil().setHeight(55.5),
              width: ScreenUtil().setWidth(240),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'DASHBOARD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(70),
                  ),
                  GestureDetector(
                    child: SvgPicture.asset(
                      'assets/x_close_screen.svg',
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, homeFeeds.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF063E7E),
        body: SingleChildScrollView(
          child: Stack(children: [
            Divider(
              color: Colors.grey,
              thickness: 0.15,
            ),
            Column(
              children: [
                Row(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(12),
                        vertical: ScreenUtil().setHeight(25)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: ScreenUtil().setHeight(100),
                        width: ScreenUtil().setWidth(350),
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(15),
                                      top: ScreenUtil().setHeight(10)),
                                  child: Text(
                                    'Revenue',
                                    style: TextStyle(
                                      color: KColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(10),
                                ),
                                Text(
                                  SLS.Revenue.toString() + '€',
                                  style: TextStyle(
                                    color: Color(0xFF3593FF),
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(50),
                            ),
                            VerticalDivider(
                              color: KColor,
                              indent: 10,
                              endIndent: 10,
                              thickness: 1,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(15),
                                      top: ScreenUtil().setHeight(10)),
                                  child: Text(
                                    'Orders',
                                    style: TextStyle(
                                      color: KColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(10),
                                ),
                                Text(
                                  SLS.Orders.toString(),
                                  style: TextStyle(
                                    color: Color(0xFF3593FF),
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(25),
                            ),
                            VerticalDivider(
                              color: KColor,
                              indent: 10,
                              endIndent: 10,
                              thickness: 1,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(15),
                                      top: ScreenUtil().setHeight(10)),
                                  child: Text(
                                    'Followers',
                                    style: TextStyle(
                                      color: KColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(10),
                                ),
                                Text(
                                  SLS.Followers.toString(),
                                  style: TextStyle(
                                    color: Color(0xFF3593FF),
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                      // ignore: missing_required_param
                      child: RaisedButton(
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            height: ScreenUtil().setHeight(20),
                            width: ScreenUtil().setWidth(110),
                            child: Text(
                              'REQUEST PAYMENT',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(20),
                    ),
                    Text(
                      'Request payout At 100 € ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.25,
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(15)),
                        child: ClipRRect(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width: ScreenUtil().setHeight(420),
                              height: ScreenUtil().setWidth(50),
                              color: Color(0xFFEAF5FC),
                              child: GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: ScreenUtil().setWidth(20),
                                    ),
                                    SvgPicture.asset('assets/order_list.svg'),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(30),
                                    ),
                                    Text(
                                      'All Orders',
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
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(15),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                            width: ScreenUtil().setWidth(345),
                            height: ScreenUtil().setHeight(55),
                            color: Color(0xFFEAF5FC),
                            child: GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: ScreenUtil().setWidth(20),
                                    ),
                                    SvgPicture.asset('assets/payment.svg'),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(30),
                                    ),
                                    Text(
                                      'Payment Details',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF063E7E),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(107),
                                    ),
                                    SvgPicture.asset('assets/go_in.svg')
                                  ],
                                ))),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(15),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: ScreenUtil().setWidth(345),
                          height: ScreenUtil().setHeight(55),
                          color: Color(0xFFEAF5FC),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(20),
                                ),
                                SvgPicture.asset('assets/payout_wallet.svg'),
                                SizedBox(
                                  width: ScreenUtil().setWidth(30),
                                ),
                                Text(
                                  'Payout History',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF063E7E),
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(116),
                                ),
                                SvgPicture.asset('assets/go_in.svg')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(15),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: ScreenUtil().setWidth(345),
                          height: ScreenUtil().setHeight(55),
                          color: Color(0xFFEAF5FC),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(20),
                                ),
                                SvgPicture.asset('assets/New_members.svg'),
                                SizedBox(
                                  width: ScreenUtil().setWidth(30),
                                ),
                                Text(
                                  'New Members',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF063E7E),
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(116),
                                ),
                                SvgPicture.asset('assets/go_in.svg')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(15),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: ScreenUtil().setWidth(345),
                          height: ScreenUtil().setHeight(55),
                          color: Color(0xFFEAF5FC),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(20),
                                ),
                                SvgPicture.asset('assets/New_Sellers.svg'),
                                SizedBox(
                                  width: ScreenUtil().setWidth(30),
                                ),
                                Text(
                                  'New Sellers',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF063E7E),
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(140),
                                ),
                                SvgPicture.asset('assets/go_in.svg')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(35),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: ScreenUtil().setWidth(345),
                          height: ScreenUtil().setHeight(55),
                          color: Color(0xFFFF0202),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AddProduct.id);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(20),
                                ),
                                SvgPicture.asset('assets/suggest.svg'),
                                SizedBox(
                                  width: ScreenUtil().setWidth(30),
                                ),
                                Text(
                                  'GO LIVE',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(170),
                                ),
                                SvgPicture.asset(
                                  'assets/go_in.svg',
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ));
  }
}
