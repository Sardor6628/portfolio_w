import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:website_p/bl/main/main_page_cubit.dart';
import 'package:website_p/widgets/animated_text_widget.dart';
import 'package:website_p/widgets/theme_toggler.dart';

var logger = Logger();

@RoutePage()
class MainDisplayPage extends StatefulWidget {
  const MainDisplayPage({super.key});

  @override
  State<MainDisplayPage> createState() => _MainDisplayPageState();
}

class _MainDisplayPageState extends State<MainDisplayPage> {
  @override
  void initState() {
    super.initState();

    // Parse the initial query parameters from the URL
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeSectionFromRoute();
    });
  }

  /// Parses the current URL and initializes the section
  void _initializeSectionFromRoute() {
    final uri = Uri.parse(context.router.currentPath); // Updated
    final section = uri.queryParameters['section'] ?? '';
    logger.d('Initial section: $section');
    logger.d('Full URI: $uri');

    // Initialize the Cubit with the section
    context.read<MainPageCubit>().updateSection(section);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Navigation Bar
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: BlocBuilder<MainPageCubit, MainPageState>(
                builder: (context, state) {
                  if (state is MainPageInitial) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                        border: Border.all(color: const Color(0xff3d424a), width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<MainPageCubit>().updateSection('');
                                  context.router.replaceNamed('/');
                                  logger.i('Current URI: ${context.router.currentPath}');
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.apple, color: Color(0xff21b4e1), size: 32),
                                    const Icon(Icons.arrow_forward_ios_outlined, size: 28),
                                    const Icon(Icons.home, size: 32),
                                  ],
                                ),
                              ),
                              AnimatedTextWidget(
                                text: state.animatedText,
                                key: Key(state.animatedText),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.read<MainPageCubit>().updateSection('about');
                                  context.router.replaceNamed('/?section=about');
                                  logger.i('Current URI: ${context.router.currentPath}');
                                },
                                child: const Text(
                                  'About Me',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<MainPageCubit>().updateSection('blog');
                                  context.router.replaceNamed('/?section=blog');
                                  logger.i('Current URI: ${context.router.currentPath}');
                                },
                                child: const Text(
                                  'My Blog',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              LightDarkToggle(),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),

            // Dynamic Content
            Expanded(
              child: BlocBuilder<MainPageCubit, MainPageState>(
                builder: (context, state) {
                  if (state is MainPageInitial) {
                    return _buildSectionContent(state.currentSection);
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Dynamically renders content based on the current section
  Widget _buildSectionContent(String section) {
    switch (section) {
      case 'about':
        return const Center(
          child: Text(
            'PLACE FOR ABOUT ME',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      case 'blog':
        return const Center(
          child: Text(
            'PLACE FOR BLOG',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      default:
        return const Center(
          child: Text(
            'PLACEHOLDER FOR MAIN',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
    }
  }
}