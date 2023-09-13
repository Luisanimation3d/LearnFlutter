import 'package:flutter/material.dart';

class DropDownComponent extends StatelessWidget {
  DropDownComponent({
    Key? key,
    value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);
  
  final String value = '';
  final List<String> items;
  final void Function(String?) onChanged;


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value == '' ? null : value,
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