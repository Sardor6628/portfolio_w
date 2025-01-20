import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_p/bl/main/main_page_cubit.dart';
import 'package:website_p/bl/theme/theme_cubit.dart';
import 'package:website_p/constants/constant_variable.dart';
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
    var boldStyle = Theme.of(context)
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
                          context.read<MainPageCubit>().updateSection('about');
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
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(ImagePath.logo, width: 24),
                    const SizedBox(width: 4),
                    Container(
                      height: 24,
                      alignment: Alignment.center,
                      child: Icon(Icons.copyright,
                          color: Color(0xff9ca3af), size: 16),
                    ),
                    const SizedBox(width: 8),
                    Text(
                        "${DateTime.now().year.toString()} SardorDev Consulting. ",
                        style: const TextStyle(
                          color: Color(0xff9ca3af),
                        )),
                    Text(
                      "${ConstantVariables.weekDays[DateTime.now().weekday]}".tr(),
                      style: const TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.w700),
                    )
                        .animate(
                            onPlay: (controller) =>
                                controller.repeat(reverse: true))
                        .saturate(duration: 3.seconds)
                        .then() // set baseline time to previous effect's end time
                        .tint(color: Colors.purple)
                  ],
                ),
                Row(
                  children: [
                    BlocBuilder<ThemeCubit, ThemeMode>(
                      builder: (context, themeMode) {
                        bool isDarkMode = themeMode == ThemeMode.dark;

                        return DropdownButtonHideUnderline(
                          child: DropdownButton2<Locale>(
                            isExpanded: true,
                            items: [
                              DropdownMenuItem(
                                value: const Locale('en'),
                                child: const Text(
                                  'English',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DropdownMenuItem(
                                value: const Locale('ko'),
                                child: const Text(
                                  'Korean',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DropdownMenuItem(
                                value: const Locale('ru'),
                                child: const Text(
                                  'Russian',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                            value: context.locale,
                            onChanged: (Locale? newLocale) {
                              if (newLocale != null) {
                                context.setLocale(newLocale);
                              }
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 35,
                              width: 140,
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isDarkMode
                                      ? Color(0xff334155)
                                      : Color(0xffe4e7eb),
                                ),
                                color: isDarkMode
                                    ? Color(0xff131b2c)
                                    : Color(0xffe4e7eb),
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isDarkMode
                                      ? Color(0xff334155)
                                      : Color(0xffe4e7eb),
                                ),
                                color: isDarkMode
                                    ? Color(0xff131b2c)
                                    : Color(0xffe4e7eb),
                              ),
                              offset: const Offset(0, -100),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
