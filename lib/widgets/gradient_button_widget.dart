import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';

class GradientButtonWidget extends StatelessWidget {
  const GradientButtonWidget({
    super.key,
    required this.isDarkMode,
    required this.widgetButton,
    required this.isTheme1,
  });

  final bool isDarkMode;
  final Widget widgetButton;
  final bool isTheme1;
  final List<Color> gradientColors1 = const [
    Color(0xff4d2f6b),
    Color(0xff4a2e55),
    Color(0xff532e46),
    Color(0xff532e46),
  ];
  final List<Color> gradientColors2 = const [
    Color(0xff4a2e55),
    Color(0xff284240),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBorder(
        borderSize: 1,
        glowSize: 4,
        animationTime: 10,

        gradientColors: isTheme1 ? gradientColors1 : gradientColors2,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          alignment: Alignment.center,
          width: 200,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: isDarkMode ? Colors.black : Colors.white),
          child: widgetButton,
        ));
  }
}
