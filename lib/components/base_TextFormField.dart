
import 'package:flutter/material.dart';

// ignore: camel_case_types
class base_TextFormField extends StatelessWidget {
  const base_TextFormField({
    Key? key,
    required this.nombreTextController,
    this.labelText,
  }) : super(key: key);

  final TextEditingController nombreTextController;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        controller: nombreTextController,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }
}
