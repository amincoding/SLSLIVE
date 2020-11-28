import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';

// ignore: camel_case_types
class Seller_Payment_details extends StatefulWidget {
  static String id = 'Seller_Payment_details';

  @override
  _Seller_Payment_detailsState createState() => _Seller_Payment_detailsState();
}

// ignore: camel_case_types
class _Seller_Payment_detailsState extends State<Seller_Payment_details> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold();
  }
}
