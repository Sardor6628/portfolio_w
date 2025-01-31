import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sardordev_consulting/bl/main/main_page_cubit.dart';
import 'package:sardordev_consulting/presentation/about-me/about_me_page.dart';
import 'package:sardordev_consulting/presentation/contact/contact_us.dart';
import 'package:sardordev_consulting/presentation/main_page_pages/main_content.dart';
import 'package:sardordev_consulting/widgets/animated_text_widget.dart';
import 'package:sardordev_consulting/widgets/bottom_navigation_bar.dart';
import 'package:sardordev_consulting/widgets/responsive.dart';
import 'package:sardordev_consulting/widgets/theme_toggler.dart';
import '../../bl/main/widgets/hover_custom_buttoms_widget.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'SardorDev Consulting',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_outline, color: Colors.blue,),
              title: Text('About Me'),
              onTap: () {
                Navigator.pop(context);
                context.read<MainPageCubit>().updateSection('about');
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.blue,),
              title: Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                context.read<MainPageCubit>().updateSection('contact');
              },
            ),
          ],
        ),
      ),
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
                      const SizedBox(height: 32),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: BlocBuilder<MainPageCubit, MainPageState>(
                          builder: (context, state) {
                            if (state is MainPageInitial) {
                              return Container(
                                height: 60,
                                margin: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context)?16:0),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        Visibility(
                                          visible:
                                              Responsive.isDesktop(context) ||
                                                  Responsive.isTablet(context),
                                          child: Row(
                                            children: [
                                              MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: HoverableTextButton(
                                                  label: 'About',
                                                  onPressed: () {
                                                    context
                                                        .read<MainPageCubit>()
                                                        .updateSection('about');
                                                  },
                                                ),
                                              ),
                                              HoverableTextButton(
                                                label: 'Contact',
                                                onPressed: () {
                                                  context
                                                      .read<MainPageCubit>()
                                                      .updateSection('contact');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: Responsive.isMobile(context),
                                          child: Builder(
                                            builder: (context) {
                                              return IconButton(
                                                icon: Icon(Icons.menu),
                                                onPressed: () {
                                                  Scaffold.of(context)
                                                      .openDrawer();
                                                },
                                              );
                                            },
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
                      BlocBuilder<MainPageCubit, MainPageState>(
                        builder: (context, state) {
                          if (state is MainPageInitial) {
                            return _buildSectionContent(state.currentSection);
                          }
                          return Container();
                        },
                      ),
                      const bottomNavBar()
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
        return AboutMePage();
      case 'contact':
        return const Center(
          child: ContactUsPage(),
        );
      default:
        return MainContentWidget();
        // return ContactUsPage();
        // return AboutMePage();
    }
  }
}
