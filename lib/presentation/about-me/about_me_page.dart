import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:website_p/constants/global_method.dart';
import 'package:website_p/constants/image_path.dart';
import 'package:website_p/presentation/about-me/widgets/experience_info_widget_reusable.dart';
import 'package:website_p/presentation/about-me/widgets/richtext_body.dart';
import 'package:website_p/widgets/expandable.dart';
import 'package:website_p/widgets/responsive.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:Responsive.isMobile(context)?EdgeInsets.all(10):EdgeInsets.all(0),
      child: ConstrainedBox(
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
            ExpandableWidget(
              companyName: "ronfic".tr(),
              companyDescription: "ronfic_desc".tr(),
              companyLogo: ImagePath.ronfic,
              position: "Software Developer",
              location: "busan_south_korea".tr(),
              startDate: DateTime(2021, 7),
              endDate: null,
            ),
            ExpandableWidget(
              companyName: "compass_x".tr(),
              companyDescription: "compass_x_desc".tr(),
              companyLogo: ImagePath.tezbor,
              position: "Software Developer",
              location: "namangan_uzbekistan".tr(),
              startDate: DateTime(2021, 3),
              endDate: DateTime(2021, 7),
            ),
            ExpandableWidget(
              companyName: "dongseo_university".tr(),
              companyDescription: "dsu_exp1".tr(),
              companyLogo: ImagePath.dsu,
              position: "Mentor (ACE+ Mentoring Program)",
              location: "busan_south_korea".tr(),
              startDate: DateTime(2019, 2),
              endDate: DateTime(2019, 7),
            ),
            ExpandableWidget(
                companyName: "dongseo_university".tr(),
                companyDescription: "dsu_exp2".tr(),
                companyLogo: ImagePath.dsu,
                position:
                    "Teaching Assistant for the Global Korea Scholarship Program for Latin American Undergraduate Students in 2018",
                location: "busan_south_korea".tr(),
                startDate: DateTime(2018, 7),
                endDate: DateTime(2018, 8)),
            ExpandableWidget(
                companyName: "dongseo_university".tr(),
                companyDescription: "dsu_exp3".tr(),
                companyLogo: ImagePath.dsu,
                position: "Student Helper",
                location: "busan_south_korea".tr(),
                startDate: DateTime(2016, 9),
                endDate: DateTime(2016, 12)),
            ExpandableWidget(
                companyName: "dongseo_university".tr(),
                companyDescription: "dsu_exp4".tr(),
                companyLogo: ImagePath.dsu,
                position: "Tutor",
                location: "busan_south_korea".tr(),
                startDate: DateTime(2015, 12),
                endDate: DateTime(2016, 2)),
            ExpandableWidget(
                companyName: "dongseo_university".tr(),
                companyDescription: "dsu_exp5".tr(),
                companyLogo: ImagePath.dsu,
                position: "Representative for international students",
                location: "busan_south_korea".tr(),
                startDate: DateTime(2015, 9),
                endDate: DateTime(2015, 12)),
          ],
        ),
      ),
    );
  }
}
