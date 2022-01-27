import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheelchair/model/form/form_model.dart';
import 'package:wheelchair/presentation/widgets/common_space_element.dart';
import 'package:wheelchair/presentation/widgets/common_text_field.dart';

class WheelChairQuestion2 extends StatefulWidget {
  Function(WheelChairQuestion2Model)? onUpdate;

  WheelChairQuestion2Model model;

  WheelChairQuestion2({required this.model, this.onUpdate});

  @override
  _WheelChairQuestion1State createState() => _WheelChairQuestion1State();
}

class _WheelChairQuestion1State extends State<WheelChairQuestion2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The client can get in and out of wheelchair",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
          ),

          GestureDetector(
            child: AbsorbPointer(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: widget.model.indepenent,
                    onChanged: (bool? value) {},
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text("Independently"),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                widget.model.indepenent = !(widget.model.indepenent);
              });
            },
          ),
          GestureDetector(
            child: AbsorbPointer(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: widget.model.assistance1,
                    onChanged: (bool? value) {},
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text("Assistance with 1 Person"),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                widget.model.assistance1 = !(widget.model.assistance1);
              });
            },
          ),
          GestureDetector(
            child: AbsorbPointer(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: widget.model.assistance2,
                    onChanged: (bool? value) {},
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text("Assistance with 2 Person"),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                widget.model.assistance2 = !(widget.model.assistance2);
              });
            },
          ),

        ],
      ),
    );
  }
}
