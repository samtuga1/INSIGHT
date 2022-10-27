import 'package:flutter/material.dart';

class TextFormBox extends StatelessWidget {
  const TextFormBox({
    Key? key,
    required this.theme,
    this.labelText,
    this.prefixIcon,
    required this.validator,
    required this.onChanged,
    this.suffixIcon,
    this.suffixIconPressed,
    this.controller,
  }) : super(key: key);

  final ThemeData theme;
  final String? labelText;
  final String? prefixIcon;
  final Function validator;
  final Function onChanged;
  final String? suffixIcon;
  final Function()? suffixIconPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorHeight: 25,
      onChanged: (value) => onChanged(value),
      validator: (value) => validator(value),
      decoration: InputDecoration(
        suffixIcon: suffixIcon == null
            ? null
            : GestureDetector(
                onTap: () => suffixIconPressed,
                child: Image.asset(suffixIcon!),
              ),
        labelText: labelText ?? 'Enter here',
        labelStyle: theme.textTheme.labelMedium,
        prefixIcon: prefixIcon == null ? null : Image.asset(prefixIcon!),
        fillColor: const Color(0xFFF8F8F8),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xff575C60),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: theme.primaryColor,
            width: 0.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 0.2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xff575C60),
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
