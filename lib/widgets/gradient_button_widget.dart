import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';

class GradientButtonWidget extends StatefulWidget {
  GradientButtonWidget(
      {super.key,
      required this.isDarkMode,
      required this.widgetButton,
      required this.isTheme1,
      required this.onTap,
      required this.color});
  final Function onTap;
  final bool isDarkMode;
  Widget Function(Color color) widgetButton;
  final bool isTheme1;
  final Color color;

  @override
  _GradientButtonWidgetState createState() => _GradientButtonWidgetState();
}

class _GradientButtonWidgetState extends State<GradientButtonWidget> {
  bool _isHovered = false;

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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => widget.onTap(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: Alignment.center,
          width: 180,
          // Increase width on hover
          height: 55,
          child: AnimatedGradientBorder(
            borderSize: 1,
            glowSize: 0,
            animationTime: _isHovered ? 5 : 10,
            gradientColors: widget.isTheme1 ? gradientColors1 : gradientColors2,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: widget.isDarkMode ? Colors.black : Colors.white,
              ),
              child: Opacity(
                opacity: _isHovered ? 0.8 : 1.0, // Hide text on hover
                child: Transform.scale(
                  scale: _isHovered ? 1.05 : 1.0, // Scale widgetButton on hover
                  child: widget.widgetButton(
                    _isHovered
                        ? widget.isDarkMode
                            ? Colors.white
                            : Colors.black
                        : widget.color,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
