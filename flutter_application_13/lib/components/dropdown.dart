import 'package:flutter/material.dart';

class DropDownComponent extends StatelessWidget {
  const DropDownComponent({
    Key? key,
    required this.items,
    required this.onChanged,
  }) : super(key: key);
  final List<String> items;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}