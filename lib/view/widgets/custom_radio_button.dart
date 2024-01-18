import 'package:flutter/material.dart';

import '../core/colors.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.groupValue,
    required this.value,
  }) : super(key: key);

  final String title;
  final void Function(String?) onChanged;
  final String groupValue;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          activeColor: const Color.fromARGB(255, 145, 62, 55),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: const TextStyle(
              color: appBlack, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
