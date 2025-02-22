import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sardordev_consulting/bl/main/main_page_cubit.dart';
import 'package:sardordev_consulting/bl/theme/theme_cubit.dart';
import 'package:sardordev_consulting/widgets/gradient_button_widget.dart';
import 'package:sardordev_consulting/widgets/rich_text_main_page_widget.dart';
import 'package:sardordev_consulting/widgets/text_widgets.dart';

class MainContentWidget extends StatefulWidget {
  const MainContentWidget({super.key});

  @override
  State<MainContentWidget> createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {
  @override
  Widget build(BuildContext context) {
    var boldStyle = Theme.of(context)
        .textTheme
        .bodyLarge
        ?.copyWith(height: 2, fontWeight: FontWeight.bold);
    return ConstrainedBox(
      constraints:  BoxConstraints(maxWidth: 800, minHeight: MediaQuery.of(context).size.height - 150),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            titleWidgetWithHand(context),
            const SizedBox(height: 16),
            bodyTextWidget(context, boldStyle),
            const SizedBox(height: 20),
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                bool isDarkMode = themeMode == ThemeMode.dark;
                return Wrap(
                  children: [
                    GradientButtonWidget(
                        onTap: () {
                          context.read<MainPageCubit>().updateSection('about');
                        },
                        color: const Color(0xff818cf8),
                        isDarkMode: isDarkMode,
                        isTheme1: true,
                        widgetButton: aboutMeText),
                    const SizedBox(width: 4),
                    GradientButtonWidget(
                        onTap: () {
                          context.read<MainPageCubit>().updateSection('contact');
                        },
                        color: const Color(0xff23cbe5),
                        isDarkMode: isDarkMode,
                        isTheme1: false,
                        widgetButton: downloadResumeText),
                  ],
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
