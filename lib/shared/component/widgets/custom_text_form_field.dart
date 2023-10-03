import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.type,
      this.onSubmitted,
      this.onChanged,
      required this.validate,
      required this.label,
      required this.prefix,
      this.suffix,
      this.obscureText = false,
      this.onPressedIconSuffix});

  final TextEditingController controller;
  final TextInputType type;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String?) validate;
  final String label;
  final IconData prefix;
  final IconData? suffix;
  final bool obscureText;
  final void Function()? onPressedIconSuffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.displayMedium,
      controller: controller,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      validator: validate,
      obscureText: obscureText,
      keyboardType: type,
      decoration: InputDecoration(
        hintText: label,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        prefixIcon: Icon(
          prefix,
          color: Colors.grey,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                  color: Colors.grey,
                ),
                onPressed: onPressedIconSuffix,
              )
            : null,
      ),
    );
  }
}
