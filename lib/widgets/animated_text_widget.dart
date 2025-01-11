import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatefulWidget {
  final String text;
  const AnimatedTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  int _currentCharIndex = 0;

  @override
  void initState() {
    super.initState();
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
    return Text(
      widget.text.substring(0, _currentCharIndex),
      style: const TextStyle(
        fontSize: 24,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}