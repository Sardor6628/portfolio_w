import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class LottieHoverWidget extends StatefulWidget {
  final String lottiePath;
  final String socialUrl;
  double padding;

   LottieHoverWidget({
    Key? key,
    required this.lottiePath,
    required this.socialUrl,
    this.padding = 0,
  }) : super(key: key);

  @override
  _LottieHoverWidgetState createState() => _LottieHoverWidgetState();
}

class _LottieHoverWidgetState extends State<LottieHoverWidget>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchUrl() async {
    if (await canLaunch(widget.socialUrl)) {
      await launch(widget.socialUrl);
    } else {
      throw 'Could not launch ${widget.socialUrl}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
            _controller.reset();
            _controller.forward();
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
            _controller.animateTo(
              1.0, // Move to the last stage of the animation
              duration: const Duration(milliseconds: 800),
            );
          });
        },
        child: Container(
          padding: EdgeInsets.all(widget.padding),
          width: 35,
          height: 35,
          child: Lottie.asset(
            widget.lottiePath,
            controller: _controller,
            onLoaded: (composition) {
              _controller.duration = composition.duration;
              _controller.value =
                  1.0; // Set to the end of the animation on load
            },
            repeat: false,
          ),
        ),
      ),
    );
  }
}
