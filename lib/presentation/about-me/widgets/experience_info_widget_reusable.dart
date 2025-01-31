import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:website_p/constants/global_method.dart';
import 'package:website_p/widgets/expandable.dart';
import 'package:website_p/widgets/responsive.dart';

class ExpandableWidget extends StatefulWidget {
  final String companyName;
  final String companyDescription;
  final String companyLogo;
  final String position;
  final String location;
  final DateTime startDate;
  final DateTime? endDate;

  const ExpandableWidget({
    super.key,
    required this.companyName,
    required this.companyDescription,
    required this.companyLogo,
    required this.position,
    required this.location,
    required this.startDate,
    this.endDate,
  });

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
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
        margin: const EdgeInsets.only(bottom: 8),
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
                onTap: () => controller.toggle(),
                child: headerWidget(
                    context, Icon(Icons.arrow_forward_ios, size: 12)),
              ),
              expanded: InkWell(
                onTap: () => controller.toggle(),
                child: Column(
                  children: [
                    headerWidget(context,
                        Icon(Icons.keyboard_arrow_down_outlined, size: 20)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(width: 65),
                        Expanded(
                          child: Text(
                            widget.companyDescription,
                            textAlign: TextAlign.justify,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              theme: const ExpandableThemeData(
                iconColor: Colors.blue,
                animationDuration: Duration(milliseconds: 500),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget headerWidget(BuildContext context, Icon icon) {
    return Row(
      children: [
        Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Image.asset(widget.companyLogo, height: 50),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Text(
                    widget.companyName,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold, height: 1.2),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
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
                widget.position,
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                widget.location,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style:
                    Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: Responsive.isMobile(context) ? 150 : 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "${DateFormat.yMMMM().format(widget.startDate)} - ${widget.endDate != null ? DateFormat.yMMMM().format(widget.endDate!) : "Present"}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Text(
                GlobalMethod().formatDateDifference(
                    widget.startDate, widget.endDate ?? DateTime.now()),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}
