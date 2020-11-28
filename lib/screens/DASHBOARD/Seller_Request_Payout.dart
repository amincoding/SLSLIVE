import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';

// ignore: camel_case_types
class Seller_Request_Payout extends StatefulWidget {
  static String id = 'Seller_Request_Payout';

  @override
  _Seller_Request_PayoutState createState() => _Seller_Request_PayoutState();
}

// ignore: camel_case_types
class _Seller_Request_PayoutState extends State<Seller_Request_Payout> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold();
  }
}
