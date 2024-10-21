import 'package:flutter/material.dart';
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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppColors.darkPurple).copyWith(
          secondary: AppColors.brightYellow,
          surface: AppColors.darkPurple,
        ),
      ),
      home: const ManagePage(),
    );
  }
}
