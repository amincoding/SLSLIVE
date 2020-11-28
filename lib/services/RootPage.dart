import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';
import 'package:viplive/screens/signUpEmail.dart';
import 'package:viplive/screens/signin_email.dart';
import 'package:viplive/screens/waiting_screen.dart';
import 'package:viplive/services/auth.dart';
import 'package:viplive/screens/Start.dart';
import 'package:viplive/models/user.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus { notSignedIn, SignedIn }

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  @override
  initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        authStatus =
            userId == null ? AuthStatus.notSignedIn : AuthStatus.SignedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.SignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new signin_email(auth: widget.auth, onSignedIn: _signedIn);
      case AuthStatus.SignedIn:
        return new homeFeeds();
    }
  }
}
