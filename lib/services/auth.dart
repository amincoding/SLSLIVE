import 'package:firebase_auth/firebase_auth.dart';
import 'package:viplive/models/postes.dart';
import 'dart:async';
import 'package:viplive/services/auth.dart';



abstract class BaseAuth {

  Future<String> signInWithEmailAndPassword(String _email , String _password);
  Future<String> creatUserWithEmailAndPassword(String _email , String _password);
  Future<String> currentUser();
  Future<void> signOut();
}
class Auth implements BaseAuth{
  Future<String> signInWithEmailAndPassword(String _email , String _password) async {
    UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
    return user.user.uid;
  }

Future<String> creatUserWithEmailAndPassword(String _email , String _password) async {
  UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
  return user.user.uid;
  }

  Future<String> currentUser() async {
    final UserCredential user = FirebaseAuth.instance.currentUser as UserCredential;
    return user.user.uid;
  }

  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }
}