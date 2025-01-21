import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_p/bl/theme/theme_cubit.dart';
import 'package:website_p/constants/constant_variable.dart';
import 'package:website_p/constants/image_path.dart';
import 'package:website_p/constants/urls.dart';
import 'package:website_p/widgets/lottie_hover_widget.dart';
import 'package:website_p/widgets/responsive.dart';
class bottomNavBar extends StatefulWidget {
  const bottomNavBar({
    super.key,
  });

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 800),
      child: Column(
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Image.asset(ImagePath.logo, width: 24),
                  const SizedBox(width: 2),
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
                    ConstantVariables().weekDays[DateTime.now().weekday]
                        ,
                    style: const TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w700),
                  ).tr()
                      .animate(
                      onPlay: (controller) => controller
                          .repeat(reverse: true))
                      .saturate(duration: 4.seconds)
                      .then() // set baseline time to previous effect's end time
                      .tint(color: Colors.purple)
                ],
              ),
              Visibility(
                  visible: Responsive.isDesktop(context)||Responsive.isTablet(context),
                  child: methodLanguagePickerAndSocial()),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Row methodLanguagePickerAndSocial() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (context, themeMode) {
                    bool isDarkMode =
                        themeMode == ThemeMode.dark;

                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<Locale>(
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                            value: Locale('en'),
                            child: Text(
                              'English',
                              overflow:
                              TextOverflow.ellipsis,
                            ),
                          ),
                          DropdownMenuItem(
                            value: Locale('ko'),
                            child: Text(
                              '한국어',
                              overflow:
                              TextOverflow.ellipsis,
                            ),
                          ),
                          DropdownMenuItem(
                            value: Locale('ru'),
                            child: Text(
                              'Русский',
                              overflow:
                              TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                        value: context.locale,
                        onChanged: (Locale? newLocale) {
                          if (newLocale != null) {
                            context.setLocale(newLocale);
                            setState(() {

                            });
                          }
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 32,
                          width: 140,
                          padding: const EdgeInsets.only(
                              left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(8),
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
                            Icons
                                .arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData:
                        DropdownStyleData(
                          maxHeight: 200,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(8),
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
                          scrollbarTheme:
                          ScrollbarThemeData(
                            radius:
                            const Radius.circular(40),
                            thickness:
                            MaterialStateProperty.all(
                                6),
                            thumbVisibility:
                            MaterialStateProperty.all(
                                true),
                          ),
                        ),
                        menuItemStyleData:
                        const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(
                              left: 14, right: 14),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
                LottieHoverWidget(
                    lottiePath: ImagePath.githubLogo,
                    socialUrl: ConstantEndPoint.githubUrl),
                LottieHoverWidget(
                    padding: 3,
                    lottiePath: ImagePath.linkedInLogo,
                    socialUrl:
                    ConstantEndPoint.linkedInUrl),
                LottieHoverWidget(
                    lottiePath: ImagePath.facebookLogo,
                    socialUrl:
                    ConstantEndPoint.facebookUrl),
                LottieHoverWidget(
                    lottiePath: ImagePath.telegramLogo,
                    socialUrl:
                    ConstantEndPoint.telegramUrl),
              ],
            );
  }
}
