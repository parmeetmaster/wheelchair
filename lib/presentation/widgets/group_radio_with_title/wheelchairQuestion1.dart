import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheelchair/model/form/form_model.dart';
import 'package:wheelchair/presentation/widgets/common_space_element.dart';
import 'package:wheelchair/presentation/widgets/common_text_field.dart';

class WheelChairQuestion1 extends StatefulWidget {
  Function(WheelChairQuestion1Model)? onUpdate;

  WheelChairQuestion1Model model;

  WheelChairQuestion1({required this.model, this.onUpdate});

  @override
  _WheelChairQuestion1State createState() => _WheelChairQuestion1State();
}

class _WheelChairQuestion1State extends State<WheelChairQuestion1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Where will you use or go with Wheel chair",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
          ),
          Wrap(
            children: [
              GestureDetector(
                child: AbsorbPointer(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: widget.model.home,
                        onChanged: (bool? value) {},
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("Home"),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.model.home = !(widget.model.home);
                  });
                },
              ),
              GestureDetector(
                child: AbsorbPointer(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: widget.model.community,
                        onChanged: (bool? value) {},
                      ),
                      Text("Community"),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.model.community = !(widget.model.community);
                  });
                },
              ),
              GestureDetector(
                child: AbsorbPointer(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: widget.model.work,
                        onChanged: (bool? value) {},
                      ),
                      Text("Work"),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.model.work = !(widget.model.work);
                  });
                },
              ),
              GestureDetector(
                child: AbsorbPointer(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: widget.model.publicTransportation,
                        onChanged: (bool? value) {},
                      ),
                      Text("Public Transport"),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.model.publicTransportation =
                        !(widget.model.publicTransportation);
                  });
                },
              ),
              GestureDetector(
                child: AbsorbPointer(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: widget.model.ruralAreas,
                        onChanged: (bool? value) {},
                      ),
                      Text("Rural Areas"),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.model.ruralAreas = !(widget.model.ruralAreas);
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 20,
            width: MediaQuery.of(context).size.width - 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: AbsorbPointer(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: widget.model.other,
                          onChanged: (bool? value) {},
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("Other"),
                        SizedBox(
                          width: 5.w,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      widget.model.other = !(widget.model.other);
                    });
                  },
                ),
              ],
            ),
          ),
          CommonSpaceElement(),
          if (widget.model.other)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                initialValue: widget.model.otherReason,
                decoration: InputDecoration(
                  hintText: "Enter your custom Reason",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (s) {
                  widget.model.otherReason = s;
                },
              ),
            ),
          if (widget.model.other)
            CommonSpaceElement()
        ],
      ),
    );
  }
}
