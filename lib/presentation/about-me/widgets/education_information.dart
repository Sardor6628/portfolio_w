import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_p/constants/global_method.dart';
import 'package:website_p/widgets/expandable.dart';
import 'package:website_p/widgets/responsive.dart';

class EducationInformationWidget extends StatefulWidget {
  final String universityName;
  final String universityLogo;
  final String educationLevel;
  final String location;
  final String url;

  const EducationInformationWidget({
    super.key,
    required this.universityName,
    required this.universityLogo,
    required this.educationLevel,
    required this.location,
    required this.url,
  });

  @override
  State<EducationInformationWidget> createState() => _EducationInformationWidgetState();
}

class _EducationInformationWidgetState extends State<EducationInformationWidget> {
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
        child: InkWell(
          onTap: () {
            launch(widget.url);
          },
          child: headerWidget(
              context, Icon(Icons.arrow_forward_ios, size: 12)),
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
          child: Image.asset(widget.universityLogo, height: 50),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.universityName,
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
                widget.educationLevel,
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
      ],
    );
  }
}
