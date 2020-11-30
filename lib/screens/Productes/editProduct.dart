import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:viplive/models/product.dart';
import 'package:viplive/screens/HOMEPAGE/profile_screen.dart';
import 'package:viplive/services/store.dart';
import 'package:viplive/constants.dart';

class editProduct extends StatefulWidget {
  static String id ="editProduct";
  @override
  _editProductState createState() => _editProductState();
}

class _editProductState extends State<editProduct> {
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
                pID: data[pid],
                pQuantity: data[KProductQuantity],
                pCategory: data[KProductCategory],
              ));
            }
            return ListView.builder(
              itemBuilder: (context, index) => Center(child: Text(products[index].pName)),
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
