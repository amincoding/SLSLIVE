import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:viplive/constants.dart';
import 'package:viplive/models/Streamers.dart';
import 'package:viplive/models/postes.dart';

class stream {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addProduct(Streamers Streamers) {
    _firestore.collection(KStream).add({
      KStreamStoreName: Streamers.StoreName,
      KStreamtime: Streamers.time,
      KStreamUID: Streamers.UID,
    });
  }

}