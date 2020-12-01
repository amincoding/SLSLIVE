import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viplive/models/product.dart';
import 'package:viplive/screens/HOMEPAGE/profile_screen.dart';
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
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadProduct(),
        builder: (context , snapshot) {
          if(snapshot.hasData) {
            List<Product> products = [];
            for (var doc in snapshot.data.docs) {
              var data = doc.data();
              products.add(Product(
                pName: data[KProductName],
                pPrice: data[KProductPrice],
                pID: doc.id,
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
                             Navigator.pushNamed(context, editProduct.id,arguments: products[index]);
                           },
                           child: Text("Edit"),
                         ),
                          MyPopUpMenuItem(
                            onClick: (){
                              _store.deleteProduct(products[index].pID);
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