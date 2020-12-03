import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/SLS.dart';
import 'package:viplive/constants.dart';
import 'package:viplive/models/postes.dart';
import 'package:viplive/screens/DASHBOARD/Admin_new_mambers.dart';
import 'package:viplive/screens/HOMEPAGE/profile_screen.dart';
import 'package:viplive/screens/HOMEPAGE/profile_screen_sp.dart';
import 'package:viplive/screens/Productes/addProduct.dart';
import 'package:viplive/screens/Productes/editProduct.dart';
import 'package:viplive/screens/Productes/manageProduct.dart';
import 'package:viplive/services/auth.dart';
import 'package:viplive/screens/HOMEPAGE/notifications.dart';
import 'package:viplive/services/store.dart';
import 'package:viplive/widgets/TabViewCustom.dart';

import 'messages.dart';

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
          backgroundColor: Colors.grey[200],
          elevation: 0.0,
          leading: new IconButton(
            icon: SvgPicture.asset(
              'assets/back_appBar.svg',
              color: Colors.grey[400],
            ),

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
                          if (SLS.isAdmin) {
                            Navigator.pushNamed(context, profile_screen_sp.id);
                          } else {
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
        resizeToAvoidBottomPadding: true,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: ScreenUtil().setHeight(180),
                  width: ScreenUtil().setWidth(120),
                  child: Row(
                    children: [
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: FlatButton(
                        onPressed: (){
                          Navigator.pushNamed(context, AddProduct.id);
                        },
                        child: Container(
                          width: ScreenUtil().setWidth(120),
                          child: Text(
                            'Say Somthing',style: TextStyle(
                                fontFamily: KFont,
                            color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(250)),
                child: Row(
                  children: [
                    TabView(),
                  ],
                ),
              ),
          ],
        ),
        backgroundColor: Colors.blue[200],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final productes = ['amin', 'khail', 'aladin', 'youccef','mama'];
  final reacentSearch = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  // ignore: missing_return
  Widget buildResults(BuildContext context) {
    // show some results based on selections
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Card(
          color: Colors.red,
          shape: StadiumBorder(),
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show whe nsome one searches for anithing
    final suggestionList = query.isEmpty
        ? reacentSearch
        : productes.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)),
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

