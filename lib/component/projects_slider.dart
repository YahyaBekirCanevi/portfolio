import 'package:flutter/material.dart';
import 'package:portfolio_page/color.dart';
import 'package:portfolio_page/component/durations.dart';
import 'package:portfolio_page/launch_url.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class SliderProvider with ChangeNotifier {
  int _currentIndex = 0;
  int length = 0;
  Timer? _timer;
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.6);

  int get currentIndex => _currentIndex;

  PageController get pageController => _pageController;

  void nextItem(int itemCount) {
    _currentIndex = (_currentIndex + 1) % itemCount;
    notifyListeners();
  }

  void previousItem(int itemCount) {
    _currentIndex = (_currentIndex - 1 + itemCount) % itemCount;
    animateToPage();
    notifyListeners();
  }

  void updateIndex(int newIndex) {
    _currentIndex = newIndex;
    animateToPage();
    notifyListeners();
  }

  void resetTimer(int length) {
    this.length = length;
    _timer = Timer.periodic(5.sec, (_) {
      nextItem(length);
      _pageController.animateToPage(
        _currentIndex,
        duration: 500.ms,
        curve: Curves.easeInOut,
      );
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  Future<void> animateToPage() async {
    await _pageController.animateToPage(
      _currentIndex,
      duration: 500.ms,
      curve: Curves.easeInOut,
    );
    stopTimer();
    resetTimer(length);
  }
}

class ProjectSliderComponent extends StatelessWidget {
  const ProjectSliderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> projects = [
      {"title": "Project 1", "github": "https://github.com/your_project_1"},
      {"title": "Project 2", "github": "https://github.com/your_project_2"},
      {"title": "Project 3", "github": "https://github.com/your_project_3"},
    ];

    return ChangeNotifierProvider(
      create: (_) => SliderProvider(),
      child: ColoredBox(
        color: AppColors.darkPurpleShade,
        child: Consumer<SliderProvider>(
          builder: (context, sliderProvider, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Projects',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: AppColors.textColor),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.accentColor,
                        ),
                        onPressed: () {
                          sliderProvider.previousItem(projects.length);
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.accentColor,
                        ),
                        onPressed: () {
                          sliderProvider.nextItem(projects.length);
                        },
                      ),
                    ],
                  ),
                ),
                _ProjectSlider(
                  projects: projects,
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ProjectSlider extends HookWidget {
  final List<Map<String, String>> projects;

  const _ProjectSlider({required this.projects});

  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<SliderProvider>(context);
    final currentIndex = sliderProvider.currentIndex;

    useEffect(() {
      sliderProvider.resetTimer(projects.length);
      return () => sliderProvider.stopTimer();
    }, []);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: PageView.builder(
        controller: sliderProvider.pageController,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) => sliderProvider.updateIndex(index),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          final isCenter = index == currentIndex;

          return AnimatedOpacity(
            duration: 500.ms,
            opacity: isCenter ? 1.0 : 0.5,
            child: ProjectSliderItem(
              project: project,
            ),
          );
        },
      ),
    );
  }
}

class ProjectSliderItem extends StatelessWidget {
  final Map<String, String> project;

  const ProjectSliderItem({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchURL(project['github']);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * .6,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                project['title']!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
