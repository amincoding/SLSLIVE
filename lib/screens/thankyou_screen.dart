import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';
import 'package:viplive/screens/waiting_screen.dart';
import '../constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class thankyou_screen extends StatefulWidget {
  static String id = 'thankyou_screen';

  @override
  _thankyou_screenState createState() => _thankyou_screenState();
}

// ignore: camel_case_types
class _thankyou_screenState extends State<thankyou_screen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
      backgroundColor: (KBackGroundColor),
      body: ListView(children: <Widget>[
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(75),
                      top: ScreenUtil().setHeight(30)),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'SLS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Color(0xFFF899C0))),
                        TextSpan(
                            text: ' Livestream                 ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Color(0xFFF010101))),
                        TextSpan(
                            text: 'Something different, new, this is our app.',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                                color: Color(0xFFF899C0))),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(100)),
                  child: SvgPicture.asset('assets/checked.svg'),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(0.01),
              ),
              Container(
                width: ScreenUtil().setWidth(300),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: '''Thank you  
For Your Registration ''',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(0.04),
              ),
              Center(
                child: Divider(
                  thickness: 2,
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                  child: SvgPicture.asset('assets/exclamation.svg'),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(0.02),
              ),
              Container(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text:
                          'Your request is sending to an administrator, once accepted we will send you a confirmation by E-mail. And you can enter in the app.',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(0.1),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(150),
                      horizontal: ScreenUtil().setWidth(24)),
                  child: Container(
                    height: ScreenUtil().setHeight(50),
                    width: ScreenUtil().setHeight(327),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPressed: () {
                          Navigator.pushNamed(context, waiting_screen.id);
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.pushNamed(
                                context, homeFeeds.id);
                          });
                        },
                        color: KTextFeildSingUpColor,
                        child: Text('GO TO HOME SCREEN',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: KBackGroundColor,
                            ))),
                  )),
            ]),
      ]),
    );
  }
}
