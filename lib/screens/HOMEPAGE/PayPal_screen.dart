import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';

import '../../constants.dart';

class PayPal_Screen extends StatefulWidget {
  static String id = 'PayPal_Screen';
  @override
  _PayPal_ScreenState createState() => _PayPal_ScreenState();
}

class _PayPal_ScreenState extends State<PayPal_Screen> {
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
                  'Payment method',
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      heightFactor: ScreenUtil().setHeight(10),
                      child: Container(
                        height: ScreenUtil().setHeight(75),
                        width: ScreenUtil().setWidth(150),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onPressed: () {},
                            color: KTextFeildSingUpColor,
                            child: Text('PayPal',
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
            )
          ],
        ),
      ),
    );
  }
}
