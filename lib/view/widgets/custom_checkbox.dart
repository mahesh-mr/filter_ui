import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/colors.dart';

class CustomCheckboxWidget extends StatefulWidget {
  const CustomCheckboxWidget({
    Key? key,
    required this.onChange,
    required this.isChecked,
    required this.title,
    this.size,
    this.iconSize,
    this.selectedColor,
    this.selectedIconColor,
    this.borderColor,
    this.checkIcon,
  }) : super(key: key);
  final ValueChanged<bool?> onChange;
  final bool isChecked;
  final double? size;
  final double? iconSize;
  final Color? selectedColor;
  final Color? selectedIconColor;
  final Color? borderColor;
  final Icon? checkIcon;
  final String title;
  @override
  State<CustomCheckboxWidget> createState() => _CustomCheckboxWidgetState();
}

class _CustomCheckboxWidgetState extends State<CustomCheckboxWidget> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          widget.onChange(_isSelected);
        });
      },
      child: Row(
        children: [
          AnimatedContainer(
              margin: const EdgeInsets.all(4),
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastLinearToSlowEaseIn,
              decoration: BoxDecoration(
                
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        _isSelected ? widget.borderColor ?? appBrown : appGrey,
                    width: 2,
                  )),
             
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: _isSelected
                    ? const CircleAvatar(radius: 5, backgroundColor: appBrown)
                    : const SizedBox(
                        height: 11,
                        width: 11,
                      ),
              )),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.title,
            style: const TextStyle(
                color: appBlack, fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class CheckboxControllers extends GetxController {
  RxList<String> selectedItems = <String>[].obs;
}
