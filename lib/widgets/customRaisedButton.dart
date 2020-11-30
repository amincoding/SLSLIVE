import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class customRaisedButton extends StatelessWidget {
  customRaisedButton({
    this.text,
    this.path,
    this.color,
    this.font,
    this.height,
    this.width
});

  final String text;
  final path;
  final Color color;
  final double font;
  final height;
  final width;


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
          child: Text(text,
            style: TextStyle(
              color: color,
              fontSize: font
            ),
          ),
          onPressed: (){

          }
          );
  }
}
