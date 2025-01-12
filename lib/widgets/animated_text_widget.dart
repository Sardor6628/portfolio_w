import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatefulWidget {
  final String text;
  const AnimatedTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  int _currentCharIndex = 0;
  late AnimationController _cursorController;

  @override
  void initState() {
    super.initState();
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true); // Continuous blinking cursor
    _animateText();
  }

  @override
  void didUpdateWidget(covariant AnimatedTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _currentCharIndex = 0;
      _animateText();
    }
  }

  @override
  void dispose() {
    _cursorController.dispose();
    super.dispose();
  }

  void _animateText() {
    if (_currentCharIndex < widget.text.length) {
      Future.delayed(const Duration(milliseconds: 50), () {
        setState(() {
          _currentCharIndex++;
        });
        _animateText();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _cursorController,
      builder: (context, child) {
        // Toggle the visibility of the "|" based on the animation value
        final cursorVisible = _cursorController.value > 0.5;
        return Text(
          '${widget.text.substring(0, _currentCharIndex)}${cursorVisible ? "|" : ""}',
          style: const TextStyle(
            fontSize: 20,
          ),
        );
      },
    );
  }
}