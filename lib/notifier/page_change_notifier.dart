import 'package:flutter/material.dart';
import 'package:portfolio_page/component/durations.dart';
import 'package:portfolio_page/model/page.dart';
import 'package:portfolio_page/routes.dart';

class PageChangeNotifier extends ChangeNotifier {
  PageModel _page = AppRoutes.home;
  final PageController _pageController = PageController(initialPage: 0);

  PageChangeNotifier() {
    _pageController.addListener(() {
      if (_pageController.page != null &&
          _pageController.page?.toInt() != _page.index) {
        _page = AppRoutes.getModel(_pageController.page!.toInt());
        notifyListeners();
      }
    });
  }

  PageModel get currentPage => _page;

  PageController get pageController => _pageController;

  void navigateToPage(PageModel page) {
    _page = page;
    notifyListeners();
    animatePage();
  }

  void animatePage() {
    _pageController.animateToPage(
      _page.index,
      duration: 300.ms,
      curve: Curves.easeInCirc,
    );
  }
}
