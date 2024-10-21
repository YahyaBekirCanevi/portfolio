import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio_page/color.dart';
import 'package:portfolio_page/component/projects_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenSize.height * .9,
            width: screenSize.width,
            child: Center(
              child: SizedBox(
                height: screenSize.height * .6,
                width: screenSize.width * .8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 40),
                      child: Text(
                        'Hi, I\'m Yahya Bekir Canevi',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: AppColors.textColor),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'I am a software engineer specializing in building high-quality applications. Here are some of my projects.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.textColor),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.brightYellow,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
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
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          const ProjectSliderComponent(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Get In Touch",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.brightYellowShade,
                              fontSize: 24,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.brightYellowShade,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
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
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: AppColors.brightYellowShade,
                                  fontSize: 24,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.brightYellowShade,
                                ),
                      ),
                      const _ContactField(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
          child: Theme(
            data: ThemeData(
              useMaterial3: true,
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.textColor).copyWith(
                secondary: AppColors.textColor,
                surface: AppColors.textColor,
                primary: AppColors.textColor,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),
                _DecoratedTextInput(
                  label: 'E-Mail',
                  emailController: emailController,
                ),
                const SizedBox(height: 12),
                _DecoratedTextInput(
                  label: 'Name Surname',
                  emailController: nameController,
                ),
                const SizedBox(height: 12),
                _DecoratedTextInput(
                  label: 'Message',
                  minLines: 5,
                  emailController: messageController,
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

class _DecoratedTextInput extends StatelessWidget {
  const _DecoratedTextInput({
    this.minLines = 1,
    required this.label,
    required this.emailController,
  });

  final int? minLines;
  final String label;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: TextField(
          controller: emailController,
          decoration: InputDecoration(
            fillColor: AppColors.textColor,
            focusColor: AppColors.textColor,
            border: null,
            labelText: label,
          ),
          minLines: minLines,
          maxLines: minLines,
          cursorColor: AppColors.textColor,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: AppColors.textColor),
        ),
      ),
    );
  }
}
