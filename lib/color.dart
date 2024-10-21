import 'package:flutter/material.dart';

class AppColors {
  // Primary color codes
  static const Color darkPurple = Color(0xFF4D3A61);
  static const Color brightYellow = Color(0xFFE0E016);

  // Variations and shades (for theming)
  static const Color darkPurpleShade = Color(0xFF3A3051);
  static const Color brightYellowShade = Color(0xFFCCCC14);

  // Background and accent colors
  static const Color background = Color(0xFFF7F7F7);
  static const Color textColor = Colors.white;
  static const Color accentColor = brightYellow;

  // Conversion helper: Converts hex color to Color object
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
