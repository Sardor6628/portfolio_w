import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:website_p/constants/image_path.dart';
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
            return expandableWidget();
          })
        ],
      ),
    );
  }
}

class expandableWidget extends StatefulWidget {
   expandableWidget({
    super.key,
  });

  @override
  State<expandableWidget> createState() => _expandableWidgetState();
}

class _expandableWidgetState extends State<expandableWidget> {
final controller = ExpandableController();
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDarkMode
            ? const Color(0xff1d2224)
            : const Color(0xffe7eef4),
      ),
      child: ExpandableNotifier(
        controller: controller,
        child: ScrollOnExpand(
          child: ExpandablePanel(
            collapsed: InkWell(
              onTap: () {
                controller.toggle();
              },
              child: Container(
                child: Row(
                  children: [
                    Image.asset(ImagePath.ronfic, height: 50),
                    Text(
                      "This is the collapsed state.",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            expanded: InkWell(
             onTap: () {
                controller.toggle();
              },
              child: Container(
                child: Text(
                  "This is the expanded state. You can add more content here that will be shown when the panel is expanded.",
                  softWrap: true,
                ),
              ),
            ),
            theme: ExpandableThemeData(
              iconColor: Colors.blue,
              animationDuration: Duration(milliseconds: 500),
            ),
          ),
        ),
      ),
    );
  }
}
