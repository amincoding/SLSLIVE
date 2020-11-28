import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';
import 'package:viplive/widgets/New_Member_Custom.dart';

import '../../SLS.dart';
import '../../constants.dart';

// ignore: camel_case_types
class Admin_new_mambers extends StatefulWidget {
  static String id = 'Admin_new_mambers';

  @override
  _Admin_new_mambersState createState() => _Admin_new_mambersState();
}

// ignore: camel_case_types
class _Admin_new_mambersState extends State<Admin_new_mambers> {
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
                color: Colors.white,
                height: ScreenUtil().setHeight(20),
                width: ScreenUtil().setWidth(10),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            Container(
              height: ScreenUtil().setHeight(55.5),
              width: ScreenUtil().setWidth(240),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'New Members',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(60),
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
            child: Column(children: [
          for (var Member in SLS.MembersList)
            New_Members_Custom(
              fullname: Member,
              profile_pic: "assets/images/algeria.png",
            ),
        ])));
  }
}
