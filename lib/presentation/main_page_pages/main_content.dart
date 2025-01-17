import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:lottie/lottie.dart';
import 'package:website_p/bl/main/main_page_cubit.dart';
import 'package:website_p/bl/theme/theme_cubit.dart';
import 'package:website_p/constants/image_path.dart';
import 'package:website_p/widgets/gradient_button_widget.dart';
import 'package:website_p/widgets/rich_text_main_page_widget.dart';
import 'package:website_p/widgets/text_widgets.dart';

class MainContentWidget extends StatefulWidget {
  const MainContentWidget({super.key});

  @override
  State<MainContentWidget> createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {


  @override
  Widget build(BuildContext context) {
    var boldStyle = Theme
        .of(context)
        .textTheme
        .bodyLarge
        ?.copyWith(height: 2, fontWeight: FontWeight.bold);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
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
                          context
                              .read<MainPageCubit>()
                              .updateSection('about');

                        },
                        color: const Color(0xff818cf8),
                        isDarkMode: isDarkMode,
                        isTheme1: true,
                        widgetButton: aboutMeText),
                    const SizedBox(width: 4),
                    GradientButtonWidget(
                        onTap: () {},
                        color: const Color(0xff23cbe5),
                        isDarkMode: isDarkMode,
                        isTheme1: false,
                        widgetButton: downloadResumeText),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

}
