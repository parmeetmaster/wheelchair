import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;

  IconData prefixIcon;

  final String label;
  final String hint;
  final String? helpertext;
  final String? counterText;
  final bool? readOnly;
  final Function? onTap;
  final Function(String)? validator;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmit;
  final AutovalidateMode? autovalidateMode;
  final int? maxLines;
  final TextInputType? type;


  CommonTextField(
      {Key? key,
      this.autovalidateMode,
      this.type,
      this.maxLines,
      required this.controller,
      required this.prefixIcon,
      required this.label,
      required this.hint,
      this.readOnly = false,
      this.helpertext,
      this.onTap,
      this.validator,
        this.onFieldSubmit,
      this.onChange,
      this.counterText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      onChanged: (s) {
        if (onChange != null) {
          return onChange!(s);
        }
      },
      validator: (s) {
        if (validator != null) {
          return validator!(s!);
        }
      },
      onTap: () {
        onTap != null ? onTap!() : (() {});
      },
      controller: controller,
      readOnly: readOnly!,
      maxLines: maxLines ?? 1,
      minLines: 1,
      keyboardType: type,
      onFieldSubmitted: (value) {
        onFieldSubmit!(value);
      },
      decoration: InputDecoration(
        isDense: true,
        filled: true,

        fillColor: Colors.white,
        border: OutlineInputBorder(),
        labelText: label,
        hintText: hint,
        helperText: helpertext,
        counterText: counterText,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.blue,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            controller.clear();
          },
          child: Icon(
            Icons.cancel_sharp,
            color: Colors.red,
            size: 25.h,
          ),
        ),
      ),
    );
  }
}
