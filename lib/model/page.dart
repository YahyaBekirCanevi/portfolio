import 'package:flutter/material.dart';

class PageModel {
  final String value;
  final String title;
  final int index;
  final Widget? page;

  const PageModel({
    required this.index,
    required this.page,
    required this.value,
    required this.title,
  });
}
