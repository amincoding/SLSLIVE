import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/SLS.dart';
import 'package:viplive/models/postes.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';
import 'package:viplive/screens/HOMEPAGE/messages.dart';
import 'package:viplive/screens/HOMEPAGE/notifications.dart';
import 'package:viplive/screens/HOMEPAGE/profile_screen.dart';
import 'package:viplive/screens/HOMEPAGE/profile_screen_sp.dart';
import 'package:viplive/screens/Productes/editProduct.dart';
import 'package:viplive/services/store.dart';
import 'package:viplive/constants.dart';

class manageProduct extends StatefulWidget {
  static String id ="manageProduct";
  @override
  _manageProductState createState() => _manageProductState();
}

class _manageProductState extends State<manageProduct> {
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
      body: StreamBuilder<QuerySnapshot>(
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
                        items: [
                         MyPopUpMenuItem(
                           onClick: (){
                             Navigator.pushReplacementNamed(context, editProduct.id,arguments: products[index]);
                           },
                           child: Text("Edit"),
                         ),
                          MyPopUpMenuItem(
                            onClick: (){
                              _store.deletePost(products[index]);
                              Navigator.pop(context);
                            },
                           child: Text("Delete"),
                         )
                        ],
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
      )
      );
  }
}

class MyPopUpMenuItem<T> extends PopupMenuItem<T>{
  final Widget child;
  final Function onClick;
  MyPopUpMenuItem({@required this.child ,@required this.onClick}):
    super(child : child);
  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MyPopUpMenuItemState();
  }
}

class MyPopUpMenuItemState<T,PopMenuItem> extends PopupMenuItemState<T,MyPopUpMenuItem<T>>{

  @override
  void handleTap() {
    widget.onClick();
  }
}