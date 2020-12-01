import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:viplive/constants.dart';
import 'package:viplive/models/product.dart';

class store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addProduct(Product product) {
    _firestore.collection(KProductCollection).add({
      KProductName: product.pName,
      KProductDescription: product.pDescription,
      KProductLocation: product.pLocation,
      KProductPrice: product.pPrice,
      KProductCategory: product.pCategory,
      KProductQuantity: product.pQuantity,
      KProductID: product.pID,
    });
  }

  Stream <QuerySnapshot> loadProduct() {
    return _firestore.collection(KProductCollection).snapshots();
  }
  deleteProduct(documentId){
    _firestore.collection(KProductCollection).doc(documentId).delete();
  }

  editProduct(data , documentId){
      _firestore.collection(KProductCollection).doc(documentId).update(data);
    }
  }