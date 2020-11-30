import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../SLS.dart';

class customTextFeild extends StatelessWidget {
  customTextFeild({
    this.hint,
    this.icon,
    this.title,
    this.height,
    this.width,
    this.onSub
});
  final String hint;
  final Icon icon;
  final String title;
  final height;
  final width;
  var onSub;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        onSaved: (val) {
          onSub = val;
        },
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.blue,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.pink,
                )),
            hintText: hint,
            icon: icon,
            ),
      )
    );
  }
}
