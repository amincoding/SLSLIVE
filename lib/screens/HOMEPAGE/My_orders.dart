import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';

// ignore: camel_case_types
class My_orders extends StatefulWidget {
  static String id = 'My_orders';
  @override
  _My_ordersState createState() => _My_ordersState();
}

// ignore: camel_case_types
class _My_ordersState extends State<My_orders> {
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
                'My Orders',
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
    ));
  }
}
