import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  static ScrollPhysics scrollPhysics(bool isIos) {
    return isIos
        ? const BouncingScrollPhysics()
        : const AlwaysScrollableScrollPhysics();
  }

  static Future pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }
    return File(image.path);
  }
}
