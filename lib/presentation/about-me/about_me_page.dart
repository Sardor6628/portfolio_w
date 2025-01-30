import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:website_p/constants/global_method.dart';
import 'package:website_p/constants/image_path.dart';
import 'package:website_p/presentation/about-me/widgets/experience_info_widget.dart';
import 'package:website_p/presentation/about-me/widgets/richtext_body.dart';
import 'package:website_p/widgets/expandable.dart';

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
            return ExpandableWidget();
          })
        ],
      ),
    );
  }
}


