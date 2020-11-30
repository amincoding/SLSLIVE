import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:viplive/screens/HOMEPAGE/home_feeds.dart';
import 'package:viplive/screens/Provider/modelHUD.dart';
import 'package:viplive/screens/signin_email.dart';
import 'package:viplive/screens/thankyou_screen.dart';
import 'package:viplive/screens/waiting_screen.dart';
import 'package:viplive/services/auth.dart';
import '../SLS.dart';
import '../constants.dart';


// ignore: camel_case_types
class signUpEmail extends StatefulWidget {
  static String id = 'signUpEmail';
  signUpEmail({this.auth , this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  _signUpEmailState createState() => _signUpEmailState();
}

// ignore: camel_case_types
class _signUpEmailState extends State<signUpEmail> {
  bool _checked = false;
  final _formkey = GlobalKey<FormState>();
  String _email ;
  String _username ;
  String _password ;
  String error;

  bool validateAndSave(){
    final form = _formkey.currentState;
    form.save();
    if (form.validate()){
      return true;
    }else{
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
                  'SIGN IN',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, signin_email.id);
              },
            ),
          ],
        ),
        backgroundColor: (KBackGroundColor),
        body: ChangeNotifierProvider<ModelHUD>(
          create: (context) => ModelHUD(),
          child: ListView(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 145),
                child: Padding(
                  padding: EdgeInsets.only(left: 70, right: 30, top: 20, bottom: 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        // Image(
                        //   image: AssetImage('assets/logo.ico'),
                        // ),
                        Positioned(
                          top: 1,
                          height: 50,
                          width: 240,
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
              ),
              Center(
                heightFactor: 0.3,
                child: Container(
                  child: SvgPicture.asset('assets/face.svg'),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
               Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter a UserName' : null,
                            onSaved: (val) {
                              setState(() => _username = val);
                            },
                            decoration: InputDecoration(
                                hintText: 'Username',
                                prefixIcon: Icon(
                                  Icons.supervised_user_circle,
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
                          height: height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            validator: (val) => val.endsWith('com') || !val.contains('@') || !val.contains('.') ? 'not valid' : null ,
                            onChanged: (val) {
                              setState(() => _email = val);
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
                          height: height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            validator: (val) =>
                                val.length < 8 ? 'Enter a password 8+ long' : null,
                            onChanged: (val) {
                              setState(() => _password = val);
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
                    )),
              SizedBox(
                height: height * 0.01,
              ),
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
                  builder:(context) => RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () async {
                        if (_checked == true) {
                          if(validateAndSave()){
                            try {
                              UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.trim(), password: _password);
                              print('Registred user: ${user.user.uid}');
                              if(user != null){
                                Navigator.pushNamed(context, waiting_screen.id);
                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.pushReplacementNamed(context, homeFeeds.id);
                                });
                              }
                            }catch(e){
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content:Text(
                                    e.message,
                                  )
                              ));
                            }
                          }
                        }else{
                          _checked = true;
                        }
                      },
                      color: KTextFeildSingUpColor,
                      child: Text('Sign up',
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
        ),
    );
  }
}
