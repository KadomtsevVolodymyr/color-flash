import 'package:color_flash/presentation/color_flash/color_flash_layout.dart';
import 'package:flutter/material.dart';

/// The main screen widget for the ColorFlash app.
///
/// This widget represents the main screen of the ColorFlash app and
/// displays the [ColorFlashLayout] widget.
class ColorFlashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorFlashLayout(),
    );
  }
}
