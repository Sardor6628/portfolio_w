import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:website_p/constants/global_method.dart';
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
            return ExpandableWidget();
          })
        ],
      ),
    );
  }
}

class ExpandableWidget extends StatefulWidget {
  ExpandableWidget({
    super.key,
  });

  @override
  State<ExpandableWidget> createState() => _expandableWidgetState();
}

class _expandableWidgetState extends State<ExpandableWidget> {
  final controller = ExpandableController();
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isDarkMode ? const Color(0xff1d2224) : const Color(0xffe7eef4),
        ),
        child: ExpandableNotifier(
          controller: controller,
          child: ScrollOnExpand(
            child: ExpandablePanel(
              collapsed: InkWell(
                onTap: () {
                  controller.toggle();
                },
                child: headerWidget(context: context, icon: Icon(Icons.arrow_forward_ios, size: 12,)),
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
      ),
    );
  }

  Container headerWidget({required BuildContext context, required Icon icon}) {
    return Container(
              child: Row(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Image.asset(ImagePath.ronfic, height: 50)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Ronfic Co Ltd",
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            AnimatedSlide(
                              duration: const Duration(milliseconds: 300),
                              offset: isHovered ? Offset.zero : const Offset(-0.5, 0),
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: isHovered ? 1.0 : 0.0,
                                child: icon,
                              ),
                            ),

                          ],
                        ),
                        Text(
                          "Software Engineer",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          "Busan, South Korea",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(height: 1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("July 2021 - Present",
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text("${GlobalMethod().formatDateDifference(DateTime(2021, 7), DateTime.now())}",
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  )
                ],
              ),
            );
  }
}
