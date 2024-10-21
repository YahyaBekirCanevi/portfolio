import 'package:flutter/material.dart';
import 'package:portfolio_page/model/page.dart';
import 'package:portfolio_page/notifier/page_change_notifier.dart';
import 'package:portfolio_page/routes.dart';
import 'package:provider/provider.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Colors.white,
      title: Consumer<PageChangeNotifier>(
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: AppRoutes.list
                .map((page) => _NavItem(
                      page,
                      value.currentPage == page,
                      onClick: () => value.navigateToPage(page),
                    ))
                .toList(),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavItem extends StatelessWidget {
  const _NavItem(
    this.pageModel,
    this.isSelected, {
    required this.onClick,
  });

  final bool isSelected;
  final PageModel pageModel;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          if (!isSelected) {
            onClick();
          }
        },
        child: Text(
          pageModel.title,
          style: TextStyle(
            fontSize: 18,
            color: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
