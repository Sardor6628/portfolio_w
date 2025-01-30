import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:website_p/constants/global_method.dart';
import 'package:website_p/constants/image_path.dart';
import 'package:website_p/widgets/expandable.dart';

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
                child: Column(
                  children: [
                    headerWidget(context: context, icon: Icon(Icons.keyboard_arrow_down_outlined, size: 20,)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(width: 65),
                        Expanded(child: Text("ronfic_desc".tr(),textAlign: TextAlign.justify, style: Theme.of(context).textTheme.bodyMedium)),
                      ],
                    ),
                  ],
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
                      "ronfic".tr(),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold, height: 1.2),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 20,
                      height: 20,
                      child: AnimatedSlide(
                        duration: const Duration(milliseconds: 300),
                        offset: isHovered ? Offset.zero : const Offset(-0.5, 0),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: isHovered ? 1.0 : 0.0,
                          child: icon,
                        ),
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
                  "busan_south_korea".tr(),
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
              Text("${"january".tr()} 2021${"year_extended".tr()} - ${"present".tr()}",
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