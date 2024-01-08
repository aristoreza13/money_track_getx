import 'package:flutter/material.dart';

import '../common/Colors.dart';

class CustomTextInput extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Widget? prefix;
  final Function(String)? onChange;

  const CustomTextInput({
    Key? key,
    required this.label,
    required this.textInputType,
    required this.textInputAction,
    this.controller,
    this.validator,
    this.onChange,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: controller,
      style: const TextStyle(fontSize: 14),
      cursorColor: AppColors.blackColor,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefix: prefix,
        labelText: label,
        hintText: label,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        floatingLabelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
      validator: validator,
    );
  }
}
