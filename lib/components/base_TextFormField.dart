import 'package:flutter/material.dart';

// ignore: camel_case_types
class base_TextFormField extends StatelessWidget {
  const base_TextFormField(
      {Key? key,
      required this.nombreTextController,
      this.labelText,
      this.keyboardType,
      this.isRequired = false,
      this.isPassword = false})
      : super(key: key);

  final TextEditingController nombreTextController;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool isRequired;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        obscureText: isPassword,
        controller: nombreTextController,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: labelText,
        ),
        validator: (value) =>
            isRequired && value!.isEmpty ? 'Este campo es requerido' : null,
      ),
    );
  }
}
