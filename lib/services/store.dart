import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:viplive/constants.dart';
import 'package:viplive/models/postes.dart';

class store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addPost(Postes postes) {
    _firestore.collection(KProductCollection).add({
      KProductName: postes.pName,
      KProductDescription: postes.pDescription,
      KProductLocation: postes.pLocation,
      KProductPrice: postes.pPrice,
      KProductCategory: postes.pCategory,
      KProductQuantity: postes.pQuantity,
    });
  }

  Stream <QuerySnapshot> loadPost() {
    return _firestore.collection(KProductCollection).snapshots();
  }
  deletePost(documentId){
    _firestore.collection(KProductCollection).doc(documentId).delete();
  }

  editPost(data , documentId){
      _firestore.collection(KProductCollection).doc(documentId).update(data);
    }
  }