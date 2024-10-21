import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio_page/color.dart';
import 'package:portfolio_page/component/projects_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutMeComponent(),
          ProjectSliderComponent(),
          GetInTouchComponent(),
        ],
      ),
    );
  }
}

class AboutMeComponent extends StatelessWidget {
  const AboutMeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.color2,
      ),
      child: SizedBox(
        height: screenSize.height * .6,
        width: screenSize.width,
        child: Center(
          child: SizedBox(
            height: screenSize.height * .4,
            width: screenSize.width * .8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 8),
                  child: Row(
                    mainAxisAlignment: screenSize.width < 600
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi, I\'m ',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: AppColors.brightYellowShade,
                                  fontSize: 54,
                                ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Yahya Bekir Canevi',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: AppColors.textColor,
                          fontSize: 54,
                        ),
                  ),
                ),
                Text(
                  'I am a software engineer specializing in building high-quality applications. Here are some of my projects.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.color3),
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.brightYellow,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                Text(
                                  'Get A Quote',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: AppColors.darkPurpleShade,
                                        fontSize: 16,
                                      ),
                                ),
                                const SizedBox(width: 16),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.darkPurpleShade,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GetInTouchComponent extends StatelessWidget {
  const GetInTouchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.color5,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Get In Touch",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.lightPurple,
                          fontSize: 24,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.lightPurple,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          "Linkedin & Github",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Let Me Know",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: AppColors.lightPurple,
                          fontSize: 24,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.lightPurple,
                        ),
                  ),
                  const _ContactField(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactField extends HookWidget {
  const _ContactField();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final emailController = useTextEditingController();
    final nameController = useTextEditingController();
    final messageController = useTextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
        child: SizedBox(
          width: screenSize.width * .8,
          child: Column(
            children: [
              const SizedBox(height: 24),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'E-Mail'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Name Surname'),
              ),
              const SizedBox(height: 12),
              TextField(
                minLines: 5,
                maxLines: 5,
                controller: messageController,
                decoration: const InputDecoration(hintText: 'Message'),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.maxFinite,
                child: buildConttractMeMethod(context),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget? buildConttractMeMethod(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.brightYellow,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Get A Quote',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.darkPurpleShade, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
