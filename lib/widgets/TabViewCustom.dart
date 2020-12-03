import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viplive/constants.dart';
import 'package:viplive/models/postes.dart';
import 'package:viplive/services/store.dart';
import 'package:viplive/widgets/customRaisedButton.dart';

import '../SLS.dart';

class TabView extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  final _store = store();
  int _tabview = 0;
  bool _like = false;
  bool _comment = false;
  bool _share = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child : DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: TabBar(
                onTap: (val)
                {
                  setState(() {
                    _tabview = val;
                  });
                },
                tabs: [
                  Text('Feeds',style: TextStyle(
                    color: _tabview == 0 ? Colors.black : Colors.grey,
                    fontFamily: KFont,
                  ),),
                  Text('Streams',style: TextStyle(
                    color: _tabview == 1 ? Colors.black : Colors.grey,
                    fontFamily: KFont,
                  ),),
                ],
              ),
              body: TabBarView(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(100),
                    width: ScreenUtil().setWidth(100),
                      child: Feeds(),
                  ),
                  Streams(),
                ],
              ),
            ),
        ),
    );
  }

  Widget Streams() {
    return StreamBuilder<QuerySnapshot>(
        stream: _store.loadPost(),
        builder: (context , snapshot) {
          if(snapshot.hasData) {
            List<Postes> products = [];
            for (var doc in snapshot.data.docs) {
              var data = doc.data();
              products.add(Postes(
                  pName: data[KProductName],
                  pPrice: data[KProductPrice],
                  pQuantity: data[KProductQuantity],
                  pCategory: data[KProductCategory],
                  pLocation: data[KProductLocation],
                  pDescription: data[KProductDescription]
              ));
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  childAspectRatio: .9
              ),
              itemBuilder: (context, index) => Padding(
                padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10) , vertical: ScreenUtil().setHeight(10)),
                child: GestureDetector(
                  onTapUp: (details) async {
                    double dx = details.globalPosition.dx;
                    double dy = details.globalPosition.dy;
                    showMenu(context: context,
                      position: RelativeRect.fromLTRB(
                          ScreenUtil().setWidth(dx),
                          ScreenUtil().setHeight(dy),
                          ScreenUtil().setWidth(dx),
                          ScreenUtil().setHeight(dy)),
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Text(
                        products[index].pName,
                      ),
                      Positioned.fill(
                        child: new Image(
                          image: new AssetImage(products[index].pLocation),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Opacity(
                          opacity: .5,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: ScreenUtil().setHeight(65),
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5) , vertical: ScreenUtil().setHeight(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    products[index].pName,
                                    style: TextStyle(
                                        fontFamily:KFont
                                    ),
                                  ),
                                  Text(
                                    products[index].pPrice + '\$',
                                    style: TextStyle(
                                      fontFamily:KFont,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: products.length,
            );
          }else{
            return Center(child: Text("Loading ..."),);
          }
        }
    );
  }

  Widget Feeds() {
    return Container(
      height: ScreenUtil().setHeight(20),
      width: ScreenUtil().setWidth(20),
      color: Colors.grey[200],
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/profilePicHolder_icon.svg'),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(75) , top: ScreenUtil().setHeight(20) ),
            child: Text(
                '${SLS.username}',style: TextStyle(
              fontFamily: KFont,
              color: Colors.black,
            ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(230) , top: ScreenUtil().setHeight(10)),
            child: customRaisedButton(
              color: Colors.grey,
              height: ScreenUtil().setHeight(8),
              width: ScreenUtil().setWidth(16),
              font: 12,
              text: 'Follow',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(350), top: ScreenUtil().setHeight(30)),
            child: GestureDetector(
              onTap: (){},
              child: SvgPicture.asset('assets/threeDots.svg'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(80) , top: ScreenUtil().setHeight(350)),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  _like = true;
                });
              },
              child: SvgPicture.asset('assets/likeIcon.svg' , color: _like == true ? Colors.blue : null,),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(130)),
            child: VerticalDivider(
              indent: 260,
              endIndent: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(180) , top: ScreenUtil().setHeight(350)),
            child: GestureDetector(
              child: SvgPicture.asset('assets/CommentIcon.svg' , color: _comment == true ? Colors.blue : null),
              onTap: (){
                setState(() {
                  _comment = true;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(230)),
            child: VerticalDivider(
              indent: 260,
              endIndent: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(280) , top: ScreenUtil().setHeight(350)),
            child: GestureDetector(
              child: SvgPicture.asset('assets/ShareIcon.svg' , color: _share == true ? Colors.blue : null),
              onTap: (){
                setState(() {
                  _share = true;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(300)),
            child: Divider(
            ),
          ),
        ],
      ),
    );
  }
}
