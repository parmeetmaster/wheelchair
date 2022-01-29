

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonSpaceElement extends StatelessWidget {
  final double? height;
  const CommonSpaceElement({Key? key,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: height??20.h,
    );
  }
}
