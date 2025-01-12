import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:website_p/bl/theme/theme_cubit.dart';
class LightDarkToggle extends StatefulWidget {
  @override
  _LightDarkToggleState createState() => _LightDarkToggleState();
}

class _LightDarkToggleState extends State<LightDarkToggle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Ensure the animation state matches the current theme state on first load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isDarkMode = context.read<ThemeCubit>().state == ThemeMode.dark;
      _animationController.value = isDarkMode ? 1.0 : 0.0;
    });
    context.read<ThemeCubit>().setThemeMode(ThemeMode.system.toString() == 'ThemeMode.light' ? ThemeMode.light : ThemeMode.dark);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        bool isDarkMode = themeMode == ThemeMode.dark;

        // Update the animation state based on the theme mode
        if (isDarkMode) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }

        return GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().toggleThemeMode();
          },
          child: Lottie.asset(
            'assets/lotties/new_light.json',
            height: 32,
            width: 32,
            repeat: false,
            controller: _animationController,
            onLoaded: (composition) {
              // Set the animation duration dynamically based on the Lottie file
              _animationController.duration = Duration(microseconds: (composition.duration.inMicroseconds/2).round());
            },
          ),
        );
      },
    );
  }
}