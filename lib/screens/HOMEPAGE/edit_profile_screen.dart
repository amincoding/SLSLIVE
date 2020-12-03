import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/main.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';
import 'package:viplive/screens/HOMEPAGE/profile_screen.dart';
import 'package:viplive/services/store.dart';

import '../../SLS.dart';
import '../../constants.dart';

// ignore: camel_case_types
class edit_profile_screen extends StatefulWidget {
  static String id = 'edit_profile_screen';

  @override
  _edit_profile_screenState createState() => _edit_profile_screenState();
}

// ignore: camel_case_types
class _edit_profile_screenState extends State<edit_profile_screen> {
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
            width: ScreenUtil().setWidth(240),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Color(0xFF063E7E),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(100),
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
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(0)),
            child: Center(
              heightFactor: ScreenUtil().setHeight(0.5),
              child: Container(
                height: ScreenUtil().setHeight(350),
                width: ScreenUtil().setHeight(350),
                child: SvgPicture.asset(
                  'assets/face_shape_holder.svg',
                  color: Colors.pink,
                ),
              ),
            ),
          ),
          Center(
            heightFactor: ScreenUtil().setHeight(1),
            child: Container(
              height: ScreenUtil().setHeight(150),
              width: ScreenUtil().setWidth(140),
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                child: SvgPicture.asset('assets/upload_Image.svg'),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(30),
                top: ScreenUtil().setHeight(140)),
            child: Text(
              'User name',
              style: TextStyle(color: Color(0xFF063E7E), fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(165),
                left: ScreenUtil().setWidth(25)),
            child: Container(
              height: ScreenUtil().setHeight(65),
              width: ScreenUtil().setWidth(310),
              child: TextField(
                decoration: InputDecoration(
                    hintText: SLS.username,
                    prefixIcon: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.grey,
                    ),
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
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(30),
                top: ScreenUtil().setHeight(240)),
            child: Text(
              'Full Name',
              style: TextStyle(color: Color(0xFF063E7E), fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(265),
                left: ScreenUtil().setWidth(25)),
            child: Container(
              height: ScreenUtil().setHeight(65),
              width: ScreenUtil().setWidth(310),
              child: TextField(
                decoration: InputDecoration(
                    hintText: SLS.fullname,
                    prefixIcon: Icon(
                      Icons.supervisor_account,
                      color: Colors.grey,
                    ),
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
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(30),
                top: ScreenUtil().setHeight(340)),
            child: Text(
              'Email',
              style: TextStyle(color: Color(0xFF063E7E), fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(365),
                left: ScreenUtil().setWidth(25)),
            child: Container(
              height: ScreenUtil().setHeight(65),
              width: ScreenUtil().setWidth(310),
              child: TextField(
                decoration: InputDecoration(
                    hintText: SLS.Email,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
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
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(30),
                top: ScreenUtil().setHeight(440)),
            child: Text(
              'Phone Number',
              style: TextStyle(color: Color(0xFF063E7E), fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(465),
                left: ScreenUtil().setWidth(25)),
            child: Container(
              height: ScreenUtil().setHeight(65),
              width: ScreenUtil().setWidth(310),
              child: TextField(
                decoration: InputDecoration(
                    hintText: SLS.PhoneNumber.toString(),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
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
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(30),
                top: ScreenUtil().setHeight(540)),
            child: Text(
              'Date of Birth',
              style: TextStyle(color: Color(0xFF063E7E), fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(565),
                left: ScreenUtil().setWidth(25)),
            child: Container(
              height: ScreenUtil().setHeight(65),
              width: ScreenUtil().setWidth(310),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'dd/mm/yyyy',
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                    ),
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
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(65),
                top: ScreenUtil().setHeight(650)),
            child: Container(
              height: ScreenUtil().setHeight(50),
              width: ScreenUtil().setWidth(250),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {

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
        ]),
      ),
    );
  }
}
