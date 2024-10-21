import 'package:flutter/material.dart';
import 'package:portfolio_page/model/page.dart';
import 'package:portfolio_page/pages/home_page.dart';
import 'package:portfolio_page/pages/projects_page.dart';

class AppRoutes {
  static const List<PageModel> list = [home, projects];
  static const PageModel home = PageModel(
    index: 0,
    page: HomePage(),
    value: "/home",
    title: "HOME",
  );
  static const PageModel projects = PageModel(
    index: 1,
    page: ProjectsPage(),
    value: "/projects",
    title: "PROJECTS",
  );

  static int getIndex(PageModel route) =>
      switch (route) { AppRoutes.home => 0, AppRoutes.projects => 1, _ => 0 };

  static Widget? getPage(int index) => switch (index) {
        0 => const HomePage(),
        1 => const ProjectsPage(),
        _ => const HomePage()
      };

  static PageModel getModel(int index) =>
      switch (index) { 0 => home, 1 => projects, _ => home };
}
