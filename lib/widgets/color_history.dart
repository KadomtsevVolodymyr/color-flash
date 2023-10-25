import 'package:flutter/material.dart';

/// A dialog that displays a list of colors history.
///
/// This widget is used to create a dialog that shows a list of colors history.
class ColorHistory extends StatelessWidget {
  /// The list of colors history to display in the dialog.
  final List<Color> colorHistory;

  /// The height of each color box in the list.
  final double heightOfColor;

  /// Creates a [ColorHistory] widget with the specified favorite colors and
  /// color height.
  const ColorHistory({
    required this.colorHistory,
    required this.heightOfColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Color History"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: colorHistory
              .map(
                (color) => ListTile(
                  title: Container(
                    height: heightOfColor,
                    color: color,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
