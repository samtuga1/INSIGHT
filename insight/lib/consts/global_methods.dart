import 'package:flutter/material.dart';

class GlobalMethods {
  // GLOBAL BUTTON
  static MaterialButton materialButton(
      {required Function() onPressed,
      required String child,
      required ThemeData theme}) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      minWidth: 100,
      padding: const EdgeInsets.symmetric(vertical: 20),
      enableFeedback: false,
      highlightElevation: 0,
      onPressed: onPressed,
      color: theme.primaryColor,
      child: Center(
          child: Text(
        child,
        style: theme.textTheme.button,
      )),
    );
  }
}
