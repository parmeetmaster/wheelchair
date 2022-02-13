import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageBox extends StatelessWidget {
  final String asset;

  final String text;

  const ImageBox({Key? key, this.asset = "", this.text = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        IntrinsicWidth(
          child: Row(
            children: [
              Column(
                children: [
                  Image.asset(
                    asset,
                    height: 120.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
              SizedBox(width: 10.w,),
              Expanded(child: Text(text,style: TextStyle(fontWeight: FontWeight.w600),))
            ],
          ),
        )
      ],
    );
  }
}
