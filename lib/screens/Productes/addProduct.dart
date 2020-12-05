import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/constants.dart';
import 'package:viplive/models/postes.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';
import 'package:viplive/screens/HOMEPAGE/messages.dart';
import 'package:viplive/widgets/customRaisedButton.dart';
import 'package:viplive/widgets/customTextFeild.dart';
import 'package:viplive/services/store.dart';
import '../HOMEPAGE/notifications.dart';
import '../HOMEPAGE/profile_screen.dart';
import '../HOMEPAGE/profile_screen_sp.dart';

import '../../SLS.dart';

class AddProduct extends StatefulWidget {
  static String id = "AddProduct";

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String  _PostText , _Location ;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _store = store();

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
                      Navigator.pushReplacementNamed(context, homeFeeds.id);
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
                    onPressed: () {
                      Navigator.pushNamed(context, Messages.id);
                    },
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
                      icon: SLS.test(),
                      onPressed: () {
                        Navigator.pushNamed(context, notifications.id);
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
                        var status = SLS.isAdming(SLS.Email);
                        if(SLS.isAdmin){
                          Navigator.pushNamed(context, profile_screen_sp.id);
                        }else{
                          Navigator.pushNamed(context, profile_screen.id);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Form(
        key: _globalKey,
          child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                      child: Container(
                        width: ScreenUtil().setWidth(400),
                        height: ScreenUtil().setHeight(100),
                        child: Padding(
                          padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: ScreenUtil().setHeight(120)),
                                child: Text(
                                  'Write A Post',style: TextStyle(
                                  fontFamily: KFont,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                ),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(40),
                              ),
                              GestureDetector(
                                  child: IconButton(
                                    icon: SvgPicture.asset("assets/x_close_screen.svg",
                                      color: Colors.black,
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(100),
                        bottom: ScreenUtil().setHeight(0),
                        left: ScreenUtil().setWidth(5),
                        right: ScreenUtil().setWidth(5)),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 9,
                      onSaved: (val){
                        setState(() {
                          _PostText = val;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'write your post',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.pink,
                              ))),
                      ),
                    ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(150),
                          child: RaisedButton(
                            color: Colors.green[100],
                            child:Text(
                              'Publish',style: TextStyle(
                              fontSize: 14,
                              fontFamily: SLS.font,
                              ),
                            ),
                            onPressed: (){
                              if(_globalKey.currentState.validate()){
                                _globalKey.currentState.save();
                                _store.addPost(Postes(
                                  pLocation: _Location,
                                  pText: _PostText,
                                ));
                              }
                            },
                          ),
                        ),
                    ],
                  ),
                ],
            ),
          ),
        ),
    );
  }
}
