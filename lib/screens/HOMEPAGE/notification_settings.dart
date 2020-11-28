import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';

// ignore: camel_case_types
class notification_settings extends StatefulWidget {
  static String id = 'notification_settings';

  @override
  _notification_settingsState createState() => _notification_settingsState();
}

// ignore: camel_case_types
class _notification_settingsState extends State<notification_settings> {
  bool isSwitched0 = true;
  bool isSwitched1 = true;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = true;
  bool isSwitched5 = true;
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
            width: ScreenUtil().setWidth(260),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Notification Settings',
                  style: TextStyle(
                    color: Color(0xFF063E7E),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(45),
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
            Center(
              heightFactor: ScreenUtil().setHeight(1.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '''    Allow Post Notifications 
    For Profiles You Are Following''',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF063E7E),
                        ),
                      ),
                      Switch(
                        value: isSwitched0,
                        onChanged: (value) {
                          setState(() {
                            isSwitched0 = value;
                            print(isSwitched0);
                          });
                        },
                        activeTrackColor: Color(0xFF063E7E),
                        activeColor: Colors.blue[200],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '    Allow live Notification',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF063E7E),
                        ),
                      ),
                      Switch(
                        value: isSwitched1,
                        onChanged: (value) {
                          setState(() {
                            isSwitched1 = value;
                            print(isSwitched1);
                          });
                        },
                        activeTrackColor: Color(0xFF063E7E),
                        activeColor: Colors.blue[200],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '''    Allow delivered orders 
    Notification''',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF063E7E),
                        ),
                      ),
                      Switch(
                        value: isSwitched2,
                        onChanged: (value) {
                          setState(() {
                            isSwitched2 = value;
                            print(isSwitched2);
                          });
                        },
                        activeTrackColor: Color(0xFF063E7E),
                        activeColor: Colors.blue[200],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '''    Allow cancelled orders 
    Notification''',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF063E7E),
                        ),
                      ),
                      Switch(
                        value: isSwitched3,
                        onChanged: (value) {
                          setState(() {
                            isSwitched3 = value;
                            print(isSwitched3);
                          });
                        },
                        activeTrackColor: Color(0xFF063E7E),
                        activeColor: Colors.blue[200],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '    Allow new message',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF063E7E),
                        ),
                      ),
                      Switch(
                        value: isSwitched4,
                        onChanged: (value) {
                          setState(() {
                            isSwitched4 = value;
                            print(isSwitched4);
                          });
                        },
                        activeTrackColor: Color(0xFF063E7E),
                        activeColor: Colors.blue[200],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '    Allow reply comment',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF063E7E),
                        ),
                      ),
                      Switch(
                        value: isSwitched5,
                        onChanged: (value) {
                          setState(() {
                            isSwitched5 = value;
                            print(isSwitched5);
                          });
                        },
                        activeTrackColor: Color(0xFF063E7E),
                        activeColor: Colors.blue[200],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
