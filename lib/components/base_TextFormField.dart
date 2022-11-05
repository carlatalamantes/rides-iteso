
import 'package:flutter/material.dart';

// ignore: camel_case_types
class base_TextFormField extends StatelessWidget {
  const base_TextFormField({
    Key? key,
    required this.nombreTextController,
    this.labelText, this.keyboardType,
  }) : super(key: key);

  final TextEditingController nombreTextController;
  final String? labelText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        controller: nombreTextController,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }
}
