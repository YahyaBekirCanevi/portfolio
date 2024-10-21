import 'package:flutter/material.dart';
import 'package:portfolio_page/component/appbar.dart';
import 'package:portfolio_page/notifier/page_change_notifier.dart';
import 'package:portfolio_page/routes.dart';
import 'package:provider/provider.dart';

class ManagePage extends StatelessWidget {
  const ManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageChangeNotifier(),
      child: Scaffold(
        appBar: const TopBar(),
        body: Consumer<PageChangeNotifier>(builder: (context, page, child) {
          return PageView.builder(
            controller: page.pageController,
            itemCount: 2,
            itemBuilder: (_, i) => AppRoutes.getPage(i),
          );
        }),
      ),
    );
  }
}
