import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/models/postes.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';
import 'package:viplive/screens/HOMEPAGE/messages.dart';
import 'package:viplive/screens/Productes/manageProduct.dart';
import 'package:viplive/widgets/customRaisedButton.dart';
import 'package:viplive/widgets/customTextFeild.dart';
import 'package:viplive/services/store.dart';
import '../../constants.dart';
import '../HOMEPAGE/notifications.dart';
import '../HOMEPAGE/profile_screen.dart';
import '../HOMEPAGE/profile_screen_sp.dart';

import '../../SLS.dart';

class editProduct extends StatefulWidget {
  static String id = "editProduct";

  @override
  _editProductState createState() => _editProductState();
}

class _editProductState extends State<editProduct> {
  String _Name , _Price , _Description , _Category , _Location , _Quantity;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _store = store();

  @override
  Widget build(BuildContext context) {
    Postes product =  ModalRoute.of(context).settings.arguments;
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(400),
                  height: ScreenUtil().setHeight(100),
                  child: TextFormField(
                    onSaved: (val){
                      setState(() {
                        _Name = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Product Name',
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
                Container(
                  width: ScreenUtil().setWidth(400),
                  height: ScreenUtil().setHeight(100),
                  child: TextFormField(
                    onSaved: (val){
                      setState(() {
                        _Price = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Product Price',
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
                Container(
                  width: ScreenUtil().setWidth(400),
                  height: ScreenUtil().setHeight(100),
                  child: TextFormField(
                    onSaved: (val){
                      setState(() {
                        _Description = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Product Description',
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
                Container(
                  width: ScreenUtil().setWidth(400),
                  height: ScreenUtil().setHeight(100),
                  child: TextFormField(
                    onSaved: (val){
                      setState(() {
                        _Category = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Product Category',
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
                Container(
                  width: ScreenUtil().setWidth(400),
                  height: ScreenUtil().setHeight(100),
                  child: TextFormField(
                    onSaved: (val){
                      setState(() {
                        _Location = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Product Location',
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
                Container(
                  width: ScreenUtil().setWidth(400),
                  height: ScreenUtil().setHeight(100),
                  child: TextFormField(
                    onSaved: (val){
                      setState(() {
                        _Quantity = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Product quantity',
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
                  height: ScreenUtil().setHeight(5),
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
                          'Edit',style: TextStyle(
                          fontSize: 14,
                          fontFamily: SLS.font,
                        ),
                        ),
                        onPressed: (){
                          if(_globalKey.currentState.validate()){
                            _globalKey.currentState.save();
                            _store.editPost(({
                             KProductName: _Name,
                             KProductPrice: _Price,
                             KProductDescription: _Description,
                             KProductCategory: _Category,
                             KProductLocation: _Location,
                             KProductQuantity: _Quantity

                            }),product);

                          }
                          Navigator.pushReplacementNamed(context, manageProduct.id);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
