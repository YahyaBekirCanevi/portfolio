import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_page/color.dart';
import 'package:portfolio_page/pages/manage_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Portfolio",
      theme: getThemeData(),
      home: const ManagePage(),
    );
  }
}

ThemeData getThemeData() {
  return ThemeData(
    useMaterial3: true,
    // Define the color scheme using your primary and secondary colors
    colorScheme: const ColorScheme(
      primary: AppColors.brightYellow,
      // Main actions (e.g., buttons, fab)
      onPrimary: AppColors.color1,
      // Text color when on primary
      secondary: AppColors.darkPurple,
      // Secondary action (e.g., icons, accents)
      onSecondary: AppColors.textColor,
      // Text on the default background
      surface: AppColors.color2,
      // For containers or cards (darker backgrounds)
      onSurface: AppColors.textColor,
      // Text on surface colors
      error: Colors.red,
      // Error color (e.g., form validation)
      onError: Colors.white,
      // Text on error backgrounds
      brightness: Brightness.dark, // Use dark theme by default
    ),
    // Apply global text theme
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      displayLarge: GoogleFonts.latoTextTheme().displayLarge?.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color:
                AppColors.brightYellow, // Highlight headings with brightYellow
          ),
      bodyLarge: GoogleFonts.latoTextTheme().bodyLarge?.copyWith(
            fontSize: 18,
            color: AppColors.textColor, // Main text color for dark backgrounds
          ),
      bodyMedium: GoogleFonts.latoTextTheme().bodyMedium?.copyWith(
            fontSize: 16,
            color: AppColors.color3, // Text on mid-tone backgrounds
          ),
      labelLarge: GoogleFonts.latoTextTheme().labelLarge?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.color1, // Button text on brightYellow buttons
          ),
    ),
    scaffoldBackgroundColor: AppColors.color1,
    // Set default scaffold background
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.color2, // AppBar uses a darker background
      foregroundColor: AppColors.textColor, // AppBar text and icon colors
      elevation: 0, // Flat AppBar design
    ),
    cardTheme: CardTheme(
      color: AppColors.color2, // Cards use dark backgrounds
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brightYellow, // Primary button color
        foregroundColor: AppColors.color1, // Text on buttons
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded buttons
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.brightYellow, // Default icon color
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.color3,
      // Background color for text fields
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none, // No border
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none, // Still no border when focused
      ),
      hintStyle: GoogleFonts.getFont("Lato").copyWith(
        color: AppColors.color1, // Lighter color for hint text
      ),
      labelStyle: GoogleFonts.getFont("Lato").copyWith(
        color: AppColors.color1, // Text input and label text in readable color
      ),
      // TextStyle when user types in the TextField
      counterStyle: GoogleFonts.getFont("Lato").copyWith(
        color: AppColors.color1, // For character counters or any auxiliary text
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.brightYellow, // FAB uses brightYellow
      foregroundColor: AppColors.color1, // Text or icon on FAB
    ),
  );
}
