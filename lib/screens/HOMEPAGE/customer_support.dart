import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';

// ignore: camel_case_types
class customer_support extends StatefulWidget {
  static String id = 'customer_support';

  @override
  _customer_supportState createState() => _customer_supportState();
}

// ignore: camel_case_types
class _customer_supportState extends State<customer_support> {
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
            width: ScreenUtil().setWidth(270),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Customer Support',
                  style: TextStyle(
                    color: Color(0xFF063E7E),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(50),
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
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(100),
                vertical: ScreenUtil().setHeight(200)),
            child: Column(
              children: [
                Text(
                  'Call us in :',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF063E7E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '+34 45 56 67 78',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Email us in :',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF063E7E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Support@sls.com',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
