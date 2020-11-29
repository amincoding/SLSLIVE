import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../SLS.dart';

// ignore: camel_case_types
class password_forget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(
          'Did you forget your password ?',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.red,
          ),
        ),
      ),
      onTap: (){

      },
    );
  }
}
