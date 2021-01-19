import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/SLS.dart';
import 'package:viplive/constants.dart';
import 'package:viplive/services/store.dart';

// ignore: camel_case_types
class homeFeeds extends StatefulWidget {
  static String id = 'homeFeeds';

  @override
  _homeFeedsState createState() => _homeFeedsState();
}

// ignore: camel_case_types
class _homeFeedsState extends State<homeFeeds> {
  final _store = store();
  int _tabBarindex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[200],
          elevation: 0.0,
          title: Center(
            child: Container(
              child: Text(
                "VISIT Card",
                style: TextStyle(
                    color: Colors.black, fontFamily: KFont, letterSpacing: 2),
              ),
            ),
          ),
        ),
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.teal[300],
      ),
    );
  }
}
