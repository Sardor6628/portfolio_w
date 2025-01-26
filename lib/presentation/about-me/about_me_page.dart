import 'package:easy_localization/easy_localization.dart';
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
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 800),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BodyTextWidget(),
          Text("experience".tr(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(height: 2, fontWeight: FontWeight.bold)),
          Builder(builder: (context) {
            bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isDarkMode ? Color(0xff1d2224) : Color(0xffe7eef4),
              ),
              // child:ExpandableWidget()
            );
          })
        ],
      ),
    );
  }
}
