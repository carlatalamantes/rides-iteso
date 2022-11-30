import 'package:flutter/material.dart';

// ignore: camel_case_types
class base_TextFormField extends StatefulWidget {
  base_TextFormField(
      {Key? key,
      required this.textController,
      this.labelText,
      this.keyboardType,
      this.isRequired = false,
      this.isPassword = false})
      : super(key: key);

  final TextEditingController textController;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool isRequired;
  final bool isPassword;

  @override
  State<base_TextFormField> createState() => _base_TextFormFieldState();
}

class _base_TextFormFieldState extends State<base_TextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        obscureText: widget.isPassword ? _obscureText : false,
        controller: widget.textController,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: widget.labelText,
          suffixIcon: widget.isPassword
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      size: 24,
                    ),
                  ),
                )
              : null,
        ),
        validator: (value) => widget.isRequired && value!.isEmpty
            ? 'Este campo es requerido'
            : null,
      ),
    );
  }
}
