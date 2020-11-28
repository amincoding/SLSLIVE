import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/DASHBOARD/Admin_new_mambers.dart';
import 'package:viplive/screens/HOMEPAGE/profile_screen.dart';

import '../../SLS.dart';
import 'home_feeds.dart';

class Messages extends StatefulWidget {
  static String id ='messages';
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        leading: new IconButton(
          icon: SvgPicture.asset(
            'assets/back_appBar.svg',
            color: Colors.grey[400],
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: ScreenUtil().setWidth(245),
                    top: ScreenUtil().setHeight(2)),
                child: GestureDetector(
                  child: IconButton(
                    icon: SvgPicture.asset('assets/home_icon.svg'),
                    onPressed: () {
                      Navigator.pushNamed(context, homeFeeds.id);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(50),
                    top: ScreenUtil().setHeight(2)),
                child: GestureDetector(
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/search_icon.svg',
                      color: Colors.black,
                    ),
                    onPressed: () {
                      showSearch(context: context, delegate: DataSearch());
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(160),
                    top: ScreenUtil().setHeight(2)),
                child: GestureDetector(
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/messages_icon.svg',
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(210),
                    top: ScreenUtil().setHeight(2)),
                child: GestureDetector(
                  child: Container(
                    child: IconButton(
                      icon: SvgPicture.asset('assets/notifications_icon.svg'),
                      onPressed: () {
                        Navigator.pushNamed(context, Admin_new_mambers.id);
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(260),
                    top: ScreenUtil().setHeight(2)),
                child: GestureDetector(
                  child: Container(
                    child: IconButton(
                      icon:
                      SvgPicture.asset('assets/profilePicHolder_icon.svg'),
                      onPressed: () {
                        Navigator.pushNamed(context, profile_screen.id);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child:Text(
                      'Messages',style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child:Text(
                      'You Have ${SLS.new_messages} new messages',style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                    ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Container(
                    height: ScreenUtil().setHeight(12),
                    child: FlatButton(onPressed: () {}, child: Text('Clear All',style: TextStyle(fontSize: 10 , color: Colors.blue),)))
              ],),
              Divider(),
              Row(),
            ]
          )
        ],
      ),
    );
  }
}
