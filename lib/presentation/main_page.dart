import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:website_p/widgets/animated_text_widget.dart';

@RoutePage()
class MainDisplayPage extends StatefulWidget {
  const MainDisplayPage({super.key});

  @override
  State<MainDisplayPage> createState() => _MainDisplayPageState();
}

class _MainDisplayPageState extends State<MainDisplayPage> {
  String animatedText = 'Hello World'; // Move it to the State class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedTextWidget(
            text: animatedText,
            key: Key('AnimatedTextWidget:$animatedText'),
          ),
          // Change the text to see the animation
          TextButton(
            onPressed: () {
              setState(() {
                animatedText = 'Hello World, ${DateTime.now().toString()}';
              });
            },
            child: const Text('Change Text'),
          ),
        ],
      ),
    );
  }
}