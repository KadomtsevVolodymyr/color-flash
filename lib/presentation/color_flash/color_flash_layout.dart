import 'dart:math';

import 'package:color_flash/widgets/color_favorites.dart';
import 'package:color_flash/widgets/color_history.dart';
import 'package:flutter/material.dart';

/// A Flutter widget that displays a colorful flash layout.
///
/// This widget can be used to create a dynamic and colorful user interface.
class ColorFlashLayout extends StatefulWidget {
  @override
  _ColorFlashLayoutState createState() => _ColorFlashLayoutState();
}

class _ColorFlashLayoutState extends State<ColorFlashLayout> {
  static const int maxColorValue = 256;
  static const int fullOpacity = 255;
  static const double heightOfColor = 30;
  static const durationOfAnimation = 500;
  static const iconStar = Icon(Icons.star);
  static const iconHistory = Icon(Icons.history);
  static const textTheme = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  Color backgroundColor = Colors.white;

  List<Color> favoriteColors = [];
  List<Color> colorHistory = [];

  @override
  void initState() {
    super.initState();
    // Initialize with a random color
    backgroundColor = generateRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RGB Color"),
        actions: [
          IconButton(
            icon: iconStar,
            onPressed: showFavoriteColors,
          ),
          IconButton(
            icon: iconHistory,
            onPressed: showColorHistory,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: changeBackgroundColor,
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: durationOfAnimation,
          ),
          color: backgroundColor,
          child: const Center(
            child: Text(
              "Hello there",
              style: textTheme,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveFavoriteColor,
        child: iconStar,
      ),
    );
  }

  void changeBackgroundColor() {
    setState(() {
      final newColor = generateRandomColor();
      backgroundColor = newColor;
      colorHistory.add(newColor);
    });
  }

  void saveFavoriteColor() {
    setState(() {
      favoriteColors.add(backgroundColor);
    });
  }

  /// Generates a random color using RGB components.
  ///
  /// This function generates a random color by randomly selecting red, green,
  /// and blue components, resulting in a wide range of colors.
  /// The alpha (opacity) component is set to its full value (255).
  Color generateRandomColor() {
    final Random random = Random();
    final int red = random.nextInt(maxColorValue);
    final int green = random.nextInt(maxColorValue);
    final int blue = random.nextInt(maxColorValue);

    return Color.fromARGB(fullOpacity, red, green, blue);
  }

  void showFavoriteColors() {
    showDialog(
      context: context,
      builder: (context) {
        return ColorFavorites(
          favoriteColors: favoriteColors,
          heightOfColor: heightOfColor,
        );
      },
    );
  }

  void showColorHistory() {
    showDialog(
      context: context,
      builder: (context) {
        return ColorHistory(
          colorHistory: colorHistory,
          heightOfColor: heightOfColor,
        );
      },
    );
  }
}
