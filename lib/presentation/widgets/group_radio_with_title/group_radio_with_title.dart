import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupRadioTitle extends StatefulWidget {
  var value1;

  var value2;

  var groupvalue;

  var onChanged1;

  var onChanged2;

  Function(String) onUpdate;
  String title;

  GroupRadioTitle(
      {Key? key,
      required this.title,
      this.value1,
      this.value2,
      this.groupvalue,
      this.onChanged1,
      required this.onUpdate,
      this.onChanged2})
      : super(key: key);

  @override
  _GroupRadioTitleState createState() => _GroupRadioTitleState();
}

class _GroupRadioTitleState extends State<GroupRadioTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.title.isNotEmpty)
          Text(widget.title ?? "",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp),),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                child: Row(
                  children: [
                    AbsorbPointer(
                      absorbing: true,
                      child: Radio(
                          value: widget.value1,
                          groupValue: widget.groupvalue,
                          onChanged: widget.onChanged1),
                    ),
                    Text(widget.value1),
                  ],
                ),
                onTap: () {
                  setState(() {
                    widget.onUpdate(widget.value1);
                  });
                },
              )),
              Expanded(
                  child: InkWell(
                child: Row(
                  children: [
                    AbsorbPointer(
                      absorbing: true,
                      child: Radio(
                          value: widget.value2,
                          groupValue: widget.groupvalue,
                          onChanged: widget.onChanged2),
                    ),
                    Text(widget.value2),
                  ],
                ),
                onTap: () {
                  setState(() {
                    widget.onUpdate(widget.value2);
                  });
                },
              ))
            ],
          )
        ],
      ),
    );
  }
}
