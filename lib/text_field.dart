import 'package:flutter/material.dart';

@immutable
class RoundedTextField extends StatelessWidget {
  const RoundedTextField(
      {Key? key,
      this.controller,
      required this.label,
      required this.hintText,
      this.obscure = false,
      this.initialValue,
      this.validator,
      this.onChanged,
      this.keyboardType})
      : super(key: key);

  final TextEditingController? controller;
  final String? initialValue;
  final String label;
  final String hintText;
  final bool obscure;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      obscureText: obscure,
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.black),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.black.withOpacity(0.08),
        errorStyle: TextStyle(
          color: Colors.black.withOpacity(0.7),
        ),
        border: _textFieldBorder(0.3),
        enabledBorder: _textFieldBorder(0.3),
        focusedBorder: _textFieldBorder(0.3),
        errorBorder: _textFieldBorder(0.7),
        focusedErrorBorder: _textFieldBorder(0.7),
      ),
    );
  }

  OutlineInputBorder _textFieldBorder(double opacity) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.black.withOpacity(opacity),
      ),
    );
  }
}
