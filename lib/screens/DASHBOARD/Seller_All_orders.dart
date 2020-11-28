import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';

// ignore: camel_case_types
class Seller_All_orders extends StatefulWidget {
  static String id = 'Seller_All_orders';

  @override
  _Seller_All_ordersState createState() => _Seller_All_ordersState();
}

// ignore: camel_case_types
class _Seller_All_ordersState extends State<Seller_All_orders> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold();
  }
}
