import 'package:flutter/material.dart';

/// A dialog that displays a list of favorite colors.
///
/// This widget is used to create a dialog that shows a list of favorite colors.
class ColorFavorites extends StatelessWidget {
  /// The list of favorite colors to display in the dialog.
  final List<Color> favoriteColors;

  /// The height of each color box in the list.
  final double heightOfColor;

  /// Creates a [ColorFavorites] widget with the specified favorite colors and
  /// color height.
  const ColorFavorites({
    required this.favoriteColors,
    required this.heightOfColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Favorite Colors"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: favoriteColors
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
