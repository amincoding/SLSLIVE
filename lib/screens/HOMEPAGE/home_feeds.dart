import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/SLS.dart';
import 'package:viplive/constants.dart';
import 'package:viplive/screens/signin_email.dart';
import 'package:viplive/services/RootPage.dart';
import 'package:viplive/services/store.dart';
import 'package:viplive/services/auth.dart';
import 'package:viplive/SLS.dart';

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
          backgroundColor: Colors.teal[300],
          elevation: 0.0,
          title: Center(
            child: Container(
              child: Text(
                "BUSINESS Card",
                style: TextStyle(
                    color: Colors.white54, fontFamily: KFont, letterSpacing: 2),
              ),
            ),
          ),
        ),
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.teal[300],
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0,50,0,0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(120,10,0,0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0XFFFFF7F50),
                  backgroundImage: NetworkImage("https://cdn.britannica.com/34/3034-004-1A765B57/Flag-Algeria.jpg"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(75,150,50,50),
                child: Container(
                  child:Text(
                    //'${SLS.username}',
                    'Mr Demri Mohamed',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: KFont,
                    ),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 25),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: Colors.teal,
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(10),
                              ),
                              Text(
                                '${SLS.Email}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.teal.shade900,
                                  fontFamily: KFont,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 25),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.teal,
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(10),
                              ),
                              Text(
                                '+ 213 06 06 60 60 06',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.teal.shade900,
                                  fontFamily: KFont,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
