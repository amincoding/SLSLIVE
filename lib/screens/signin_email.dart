import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:viplive/SLS.dart';
import 'package:viplive/models/product.dart';
import 'package:viplive/screens/DASHBOARD/Dashboard_Admin_checked.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';
import 'package:viplive/screens/Start.dart';
import 'package:viplive/screens/signUpEmail.dart';
import 'package:viplive/screens/waiting_screen.dart';
import 'package:viplive/services/auth.dart';
import 'package:viplive/widgets/passWord_forget.dart';
import '../constants.dart';
import 'package:email_validator/email_validator.dart';


// ignore: camel_case_types
class signin_email extends StatefulWidget {
  signin_email({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  static String id = 'signin_email';
  static bool signedIn;




  @override
  _signin_emailState createState() => _signin_emailState();
}

enum FormType { login, register }

// ignore: camel_case_types
class _signin_emailState extends State<signin_email> {
  bool _checked = false;
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  bool forget = false;

  three(){
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            password_forget(),
          ]
      );
  }


  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = _formkey.currentState;
    form.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 14),
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, signUpEmail.id);
            },
          ),
        ],
      ),
      backgroundColor: (KBackGroundColor),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.2, right: 30, top: height * 0.22, bottom: 50),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // Image(
                  //   image: AssetImage('assets/logo.ico'),
                  // ),
                  Center(
                    heightFactor: 0.4,
                    child: Container(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'SLS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Color(0xFFF899C0))),
                            TextSpan(
                                text: ' Livestream                 ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Color(0xFFF010101))),
                            TextSpan(
                                text:
                                    'Something different, new, this is our app.',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Color(0xFFF899C0))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    validator: (val) => val.endsWith('com') || !val.contains('@') || !val.contains('.') ? 'not valide' : null,
                    onSaved: (val) {
                      setState(() {
                        SLS.Email = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'E-mail',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ))),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    validator: (val) =>
                        val.length < 8 ? 'Enter a password 8+ long' : null,
                    onSaved: (val) {
                      setState(() {
                        SLS.password = val;
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ))),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          three(),
          CheckboxListTile(
            title: Text("I accept the Terms of Use"),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked,
            onChanged: (bool value) {
              setState(() {
                _checked = value;
              });
            },
            activeColor: Colors.pink[200],
            checkColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Builder(
              builder: (context) => RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () async {
                    if (_checked == true) {
                      if (validateAndSave()) {
                        try {
                          String userId = await widget.auth.signInWithEmailAndPassword(SLS.Email.trim(), SLS.password);
                          UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: SLS.Email.trim(), password: SLS.password);
                          print("signed in : ${userId}");
                          if (user != null) {
                            if(SLS.Email.trim() == "aminebr70@gmail.com" && SLS.password == "Aminebr70") {
                              SLS.isAdmin = true;
                              print("admin");
                              Navigator.pushNamed(context, homeFeeds.id);
                            }else{
                              SLS.isUser = true;
                              print("user");
                              Navigator.pushNamed(context, homeFeeds.id);
                            }
                          }else {
                            print('already signed in');
                          }
                        } catch (e) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content:Text(
                              e.message
                            )
                          ));
                        }
                      }
                    }else {
                        _checked = true;
                      }
                    },
                  color: KTextFeildSingUpColor,
                  child: Text('Log In',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KBackGroundColor,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
