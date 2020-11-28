import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../SLS.dart';

// ignore: camel_case_types
class New_Members_Custom extends StatelessWidget {
  New_Members_Custom({
    this.fullname,
    this.profile_pic,
    //this.Date,
    //this.Time,
  });
  final String fullname;
  final String profile_pic;
  //final String Time;
  //final String Date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Column(
          children: [
            Row(children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(7),
                    vertical: ScreenUtil().setHeight(25)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: ScreenUtil().setHeight(130),
                    width: ScreenUtil().setWidth(360),
                    color: Colors.blue[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(20),
                              left: ScreenUtil().setWidth(20)),
                          child: Container(
                            child: ClipOval(
                              child: Image.asset(
                                this.profile_pic,
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: ScreenUtil().setHeight(30),
                            width: ScreenUtil().setWidth(30),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(20),
                                  left: ScreenUtil().setWidth(10)),
                              child: Text(
                                this.fullname,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                            Text('22/11/2020' + ' - ' + '9:30'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RaisedButton(
                                color: Color(0xFF14C3A0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Container(
                                  height: ScreenUtil().setHeight(12),
                                  width: ScreenUtil().setWidth(40),
                                  child: Text(
                                    'ACCEPT',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () {}),
                            RaisedButton(
                                color: Color(0xFFFF5F5F),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Container(
                                  height: ScreenUtil().setHeight(12),
                                  width: ScreenUtil().setWidth(40),
                                  child: Text(
                                    'REJECT',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ],
    );
  }
}
