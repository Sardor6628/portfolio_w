import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sardordev_consulting/bl/theme/theme_cubit.dart';

class LightDarkToggle extends StatefulWidget {
  @override
  _LightDarkToggleState createState() => _LightDarkToggleState();
}

class _LightDarkToggleState extends State<LightDarkToggle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Initialize animations
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Ensure the animation state matches the current theme state on first load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isDarkMode = context.read<ThemeCubit>().state == ThemeMode.dark;
      _animationController.value = isDarkMode ? 1.0 : 0.0;
    });
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

        return Tooltip(
          message: isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
          child: GestureDetector(
            onTap: () {
              context.read<ThemeCubit>().toggleThemeMode();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Sun Icon
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Opacity(
                    opacity: isDarkMode ? 0.0 : 1.0,
                    child: Icon(
                      Icons.wb_sunny,
                      size: 24,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                // Moon Icon
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Opacity(
                    opacity: isDarkMode ? 1.0 : 0.0,
                    child: Icon(
                      Icons.dark_mode_outlined,
                      size: 24,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}