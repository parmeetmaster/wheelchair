import 'package:flutter/material.dart';

class DropDownContainer extends StatelessWidget {
  String? hint;
  String? selectedItem;
  List<String> dropDownItem;
  Function(String)? onChanged;

  DropDownContainer(
      {Key? key,
      this.hint,
      required this.dropDownItem,
        this.onChanged,
      required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.blueGrey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DropdownButton<String>(
            value: selectedItem,
            hint: Text(hint ?? ""),
            icon: Visibility(visible: false, child: Icon(Icons.arrow_downward)),
            underline: SizedBox(),
            disabledHint: SizedBox(),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            items: [
              ...dropDownItem
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            ],
            onChanged: (s) {
              selectedItem = s;
              onChanged!(s!);
            }),
      ),
    );
  }
}
