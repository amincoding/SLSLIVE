import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';
import 'package:viplive/screens/HOMEPAGE/profile_screen.dart';

import '../../constants.dart';

// ignore: camel_case_types
class shipping_adress_screen extends StatefulWidget {
  static String id = 'shipping_adress_screen';

  @override
  _shipping_adress_screenState createState() => _shipping_adress_screenState();
}

// ignore: camel_case_types
class _shipping_adress_screenState extends State<shipping_adress_screen> {
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
            height: ScreenUtil().setHeight(25),
            width: ScreenUtil().setWidth(25),
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
                  'Shipping Adress',
                  style: TextStyle(
                    color: Color(0xFF063E7E),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(70),
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
            Positioned(
              top: ScreenUtil().setHeight(100),
              left: ScreenUtil().setWidth(15),
              child: Text(
                'Address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(125),
                  bottom: ScreenUtil().setHeight(0),
                  left: ScreenUtil().setWidth(5),
                  right: ScreenUtil().setWidth(5)),
              child: Container(
                height: ScreenUtil().setHeight(200),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Your Address For Shipping ',
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
                  left: ScreenUtil().setWidth(60),
                  top: ScreenUtil().setHeight(625)),
              child: Container(
                height: ScreenUtil().setHeight(50),
                width: ScreenUtil().setWidth(250),
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
      ),
    );
  }
}
