import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viplive/models/product.dart';
import 'package:viplive/widgets/customRaisedButton.dart';
import 'package:viplive/widgets/customTextFeild.dart';
import 'package:viplive/services/store.dart';

import '../../SLS.dart';

class AddProduct extends StatefulWidget {
  static String id = "AddProduct";

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String _Name , _Price , _Description , _Category , _Location;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _store = store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SizedBox(
                    height: ScreenUtil().setHeight(5),
                  ),
                  Container(
                    color: Colors.red,
                    height: ScreenUtil().setHeight(50),
                    width: ScreenUtil().setWidth(300),
                    child: RaisedButton(
                      child:Text(
                        'Submit',style: TextStyle(
                        fontSize: 14,
                        fontFamily: SLS.font,
                        ),
                      ),
                      onPressed: (){
                        if(_globalKey.currentState.validate()){
                          _globalKey.currentState.save();
                          _store.addProduct(Product(
                            pName: _Name,
                            pPrice: _Price,
                            pDescription: _Description,
                            pLocation: _Location,
                            pCategory: _Category,
                          ));
                        }
                      },
                    ),
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
