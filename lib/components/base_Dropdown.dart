import 'package:flutter/material.dart';

// ignore: camel_case_types
class base_Dropdown extends StatelessWidget {
  base_Dropdown({
    Key? key,
    required this.dropdownValue,
    required this.items,
    this.labelText,
  }) : super(key: key);

  String dropdownValue;
  final String? labelText;
  final List<Map<String, String>> items;
  late int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: DropdownButton<String>(
        hint: Text(labelText!),
        isExpanded: true,
        value: dropdownValue,
        items: items
            .map((e) => (DropdownMenuItem<String>(
                  value: e['value'],
                  child: Text(e['label']!),
                )))
            .toList(),
        onChanged: (value) {
          dropdownValue = value.toString();
        },
      ),
    );
  }
}
