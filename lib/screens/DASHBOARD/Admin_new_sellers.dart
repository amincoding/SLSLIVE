import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';

// ignore: camel_case_types
class Admin_new_sellers extends StatefulWidget {
  static String id = 'Admin_new_sellers';

  @override
  _Admin_new_sellersState createState() => _Admin_new_sellersState();
}

// ignore: camel_case_types
class _Admin_new_sellersState extends State<Admin_new_sellers> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold();
  }
}
