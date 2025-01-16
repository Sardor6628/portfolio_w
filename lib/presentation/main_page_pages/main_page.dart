import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:website_p/bl/main/main_page_cubit.dart';
import 'package:website_p/presentation/main_page_pages/main_content.dart';
import 'package:website_p/widgets/animated_text_widget.dart';
import 'package:website_p/widgets/theme_toggler.dart';

import '../../bl/main/widgets/hover_custom_buttoms_widget.dart';
import '../../constants/constant_colors.dart';

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
    // logger.d('Initial section: $section');
    // logger.d('Full URI: $uri');

    // Initialize the Cubit with the section
    context.read<MainPageCubit>().updateSection(section);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Column(
            children: [
          ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: BlocBuilder<MainPageCubit, MainPageState>(
            builder: (context, state) {
              if (state is MainPageInitial) {
                return Container(
                  height: 60,
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
                          HoverableRow(
                            onTap: () {
                              context.read<MainPageCubit>().updateSection('');
                              context.router.replaceNamed('/');
                            },
                          ),
                          AnimatedTextWidget(
                            text: state.animatedText,
                            key: Key(state.animatedText),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          HoverableTextButton(
                            label: 'About Me',
                            onPressed: () {
                              context.read<MainPageCubit>().updateSection('about');
                              context.router.replaceNamed('/?section=about');
                            },
                          ),
                          HoverableTextButton(
                            label: 'My Blog',
                            onPressed: () {
                              context.read<MainPageCubit>().updateSection('blog');
                              context.router.replaceNamed('/?section=blog');
                            },
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
        ),              Expanded(
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
        return MainContentWidget();
    }
  }
}
