import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.theme,
    this.labelText,
    required this.onChanged,
    this.suffixIcon = 'assets/images/search.png',
    this.suffixIconPressed,
  }) : super(key: key);

  final ThemeData theme;
  final String? labelText;
  final Function(String value) onChanged;
  final String suffixIcon;
  final VoidCallback? suffixIconPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 25,
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
        hintText: labelText ?? 'Search',
        hintStyle: theme.textTheme.labelMedium,
        //fillColor: theme.accentColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
