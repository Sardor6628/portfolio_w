import 'package:flutter/material.dart';
import 'package:website_p/presentation/about-me/widgets/richtext_body.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(constraints: BoxConstraints(maxWidth: 800),
    child: Column(
      children: [
        bodyTextWidget(context)
      ],
    ),
    );
  }
}
