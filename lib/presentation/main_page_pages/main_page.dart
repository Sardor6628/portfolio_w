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

  }

  /// Parses the current URL and initializes the section
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 32),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: BlocBuilder<MainPageCubit, MainPageState>(
                          builder: (context, state) {
                            if (state is MainPageInitial) {
                              return Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor
                                      .withOpacity(0.4),
                                  border: Border.all(
                                      color: const Color(0xff3d424a), width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        HoverableRow(
                                          onTap: () {
                                            context
                                                .read<MainPageCubit>()
                                                .updateSection('');
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
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: HoverableTextButton(
                                            label: 'About Me',
                                            onPressed: () {
                                              context
                                                  .read<MainPageCubit>()
                                                  .updateSection('about');
                                            },
                                          ),
                                        ),
                                        HoverableTextButton(
                                          label: 'My Blog',
                                          onPressed: () {
                                            context
                                                .read<MainPageCubit>()
                                                .updateSection('blog');
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
                      ),
                      BlocBuilder<MainPageCubit, MainPageState>(
                        builder: (context, state) {
                          if (state is MainPageInitial) {
                            return ConstrainedBox(
                                constraints: BoxConstraints(
                                    minHeight:
                                    MediaQuery.of(context).size.height - 100),
                                child: _buildSectionContent(state.currentSection));
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
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
