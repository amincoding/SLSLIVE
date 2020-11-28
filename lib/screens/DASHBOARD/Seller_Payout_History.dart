import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';

// ignore: camel_case_types
class Seller_Payout_History extends StatefulWidget {
  static String id = 'Seller_Payout_History';

  @override
  _Seller_Payout_HistoryState createState() => _Seller_Payout_HistoryState();
}

// ignore: camel_case_types
class _Seller_Payout_HistoryState extends State<Seller_Payout_History> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold();
  }
}
