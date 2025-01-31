
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sardordev_consulting/constants/image_path.dart';
import 'package:sardordev_consulting/widgets/responsive.dart';
List<String> lottieAssets = [
  ImagePath.markLottieMain1,
  ImagePath.markLottieMain2,
  ImagePath.markLottieMain3,
  ImagePath.markLottieMain4,
];
Row titleWidgetWithHand(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Flexible(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 200, maxWidth: 750),
          child: Text(
            "bringing_ideas_to_life".tr(),
            maxLines: Responsive.isMobile(context)?3:2,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        child: Lottie.asset(
          ImagePath.handShake,
          width: 50,
          height: 50,
          fit: BoxFit.fill,
        ),
      ),
    ],
  );
}

Widget bodyTextWidget(BuildContext context, TextStyle? boldStyle){
  return Builder(
    key: ValueKey<String>(context.locale.languageCode),
    builder: (context) {
      if (context.locale.languageCode == 'ko') {
        return bodyTextWidgetKorean(context, boldStyle);
      } else if (context.locale.languageCode == 'ru') {
        return bodyTextWidgetRussian(context, boldStyle);
      } else {
        return bodyTextWidgetEnglish(context, boldStyle);
      }
    },
  );
}
Widget bodyTextWidgetEnglish(BuildContext context, TextStyle? boldStyle) {
  return RichText(
    textAlign: TextAlign.justify,
    text: TextSpan(
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 2),
      children: [
        TextSpan(
            text:
            "Welcome! Unlock your business’s full potential with tailored solutions designed to meet your"),

        _highlightedText(text: "unique needs.", lottieAsset: lottieAssets[1], context: context),
        TextSpan(
            text:
            "Whether it’s developing innovative software, enhancing existing systems, streamlining operations through automation, or integrating Generative AI, my approach focuses on delivering value-driven, future-ready solutions."),
        TextSpan(text: " With expertise in"),
        _highlightedText(text: "software", lottieAsset: lottieAssets[3], context: context),
        TextSpan(text: "architecture, system centralization,"),
        // _highlightedText(text: " ", lottieAsset: lottieAssets[2]),
        TextSpan(text: " and"),
        _highlightedText(text: "automation,", lottieAsset: lottieAssets[2], context: context),
        TextSpan(
            text:
            "or integrating Generative AI, my approach focuses on delivering value-driven, future-ready"),
        _highlightedText(text: "solutions.", lottieAsset: lottieAssets[0], context: context),
        TextSpan(text: '\nESTERN EGG\n', style: boldStyle?.copyWith(height: 0.8, color: Colors.transparent)),
        TextSpan(text: "With expertise in "),
        TextSpan(text: "software architecture", style: boldStyle),
        TextSpan(text: ", "),
        TextSpan(text: "system centralization", style: boldStyle),
        TextSpan(text: ", and "),
        TextSpan(text: "automation", style: boldStyle),
        TextSpan(
            text:
            ", I craft solutions that simplify processes, enhance user experiences, and align seamlessly with your business"),
        _highlightedText(text: "goals.", lottieAsset: lottieAssets[3], context: context),
        TextSpan(text: "My experience spans"),
        _highlightedText(
            text: "diverse domains,", lottieAsset: lottieAssets[2], context: context),
        TextSpan(text: "including "),
        TextSpan(text: "fitness", style: boldStyle),
        TextSpan(text: ", "),
        TextSpan(text: "education", style: boldStyle),
        TextSpan(text: ", "),
        TextSpan(text: "logistics", style: boldStyle),
        TextSpan(text: ", and "),
        TextSpan(text: "government applications", style: boldStyle),
        TextSpan(
            text:
            ", ensuring a deep understanding of unique industry challenges."),
        TextSpan(text: '\nESTERN EGG\n', style: boldStyle?.copyWith(height: 0.8, color: Colors.transparent)),
        TextSpan(text: "Together", style: boldStyle),
        TextSpan(text: ", we can craft something"),
        _highlightedText(text: "truly", lottieAsset: lottieAssets[3], context: context),
        TextSpan(text: "remarkable. "),
      ],
    ),
  );
}
Widget bodyTextWidgetKorean(BuildContext context, TextStyle? boldStyle) {
  return RichText(
    textAlign: TextAlign.justify,
    text: TextSpan(
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 2),
      children: [
        TextSpan(
            text: "환영합니다! 비즈니스 성장을 극대화할 맞춤형 솔루션을 제공합니다. "),
        _highlightedText(text: "독창적인 요구사항", lottieAsset: lottieAssets[1], context: context),
        TextSpan(
            text:
            "에 맞춘 솔루션은 혁신적인 소프트웨어 개발, 기존 시스템 개선, 업무 자동화, 그리고 Generative AI 통합을 포함합니다. 모든 작업은 미래를 준비하며 가치를 창출하는 데 중점을 둡니다."),
        TextSpan(text: " "),
        _highlightedText(text: "소프트웨어", lottieAsset: lottieAssets[3], context: context),
        TextSpan(text: " 아키텍처 설계, 시스템 중앙화,"),
        TextSpan(text: " 그리고 "),
        _highlightedText(text: "자동화", lottieAsset: lottieAssets[2], context: context),
        TextSpan(
            text:
            "를 전문으로 하며, 비즈니스 목표에 꼭 맞는 솔루션을 제공합니다."),
        TextSpan(text: '\nEASTER EGG\n', style: boldStyle?.copyWith(height: 0.8, color: Colors.transparent)),
        TextSpan(text: "주요 전문 분야는 "),
        TextSpan(text: "소프트웨어 아키텍처 설계", style: boldStyle),
        TextSpan(text: ", "),
        TextSpan(text: "시스템 중앙화", style: boldStyle),
        TextSpan(text: ", "),
        TextSpan(text: "자동화", style: boldStyle),
        TextSpan(
            text:
            "입니다. 업무 프로세스를 간소화하고 사용자 경험을 향상시키며, 성공적인 목표 달성에 기여할 솔루션을 설계합니다."),
        TextSpan(text: "또한 "),
        _highlightedText(
            text: "다양한 산업 분야", lottieAsset: lottieAssets[2], context: context),
        TextSpan(text: "에서 경험을 쌓아왔습니다. "),
        TextSpan(text: "피트니스", style: boldStyle),
        TextSpan(text: ", "),
        TextSpan(text: "교육", style: boldStyle),
        TextSpan(text: ", "),
        TextSpan(text: "물류", style: boldStyle),
        TextSpan(text: ", "),
        TextSpan(text: "정부 애플리케이션", style: boldStyle),
        TextSpan(
            text:
            " 등 다양한 프로젝트를 통해 각 산업의 고유한 문제를 깊이 이해하고 해결해 왔습니다."),
        TextSpan(text: '\nESTERN EGG\n', style: boldStyle?.copyWith(height: 0.8, color: Colors.transparent)),
        TextSpan(text: "Together", style: boldStyle),
        TextSpan(text: ", we can craft something"),
        _highlightedText(text: "truly", lottieAsset: lottieAssets[3], context: context),
        TextSpan(text: "remarkable. "),
      ],
    ),
  );
}
Widget bodyTextWidgetRussian(BuildContext context, TextStyle? boldStyle) {
  return RichText(
    textAlign: TextAlign.justify,
    text: TextSpan(
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 2),
      children: [
        TextSpan(
          text: "Добро пожаловать! Раскройте весь потенциал вашего бизнеса с помощью решений, созданных специально для ваших ",
        ),
        _highlightedText(text: "уникальных", lottieAsset: lottieAssets[1], context: context),
        TextSpan(
          text:
          "потребностей. Это может быть разработка программного обеспечения, улучшение существующих систем, автоматизация процессов или интеграция Generative AI. "
              "Каждое решение нацелено на достижение ваших конкретных целей и упрощение работы.",
        ),
        TextSpan(text: '\nESTERN EGG\n', style: boldStyle?.copyWith(height: 0.8, color: Colors.transparent)),
        TextSpan(
          text: "Я специализируюсь на архитектуре программного обеспечения,",
        ),
        TextSpan(
          text: " централизации систем и ",
        ),
        _highlightedText(text: "автоматизации.", lottieAsset: lottieAssets[2], context: context),
        TextSpan(
          text:
          " Решения, которые я предлагаю, помогают упростить процессы, улучшить пользовательский опыт и эффективно реализовать ваши идеи.",
        ),
        TextSpan(
          text: "Мой опыт включает работу в таких сферах, как ",
        ),
        TextSpan(text: "фитнес", style: boldStyle),
        TextSpan(text: ", "),
        TextSpan(text: "образование", style: boldStyle),
        TextSpan(text: ", "),
        TextSpan(text: "логистика", style: boldStyle),
        TextSpan(text: " и "),
        TextSpan(text: "государственные приложения.", style: boldStyle),
        TextSpan(
          text: " Это позволило мне изучить особенности каждой из этих областей и создавать решения, которые действительно работают.",
        ),
        TextSpan(text: '\nESTERN EGG\n', style: boldStyle?.copyWith(height: 0.8, color: Colors.transparent)),
        TextSpan(text: "Together", style: boldStyle),
        TextSpan(text: ", we can craft something"),
        _highlightedText(text: "truly", lottieAsset: lottieAssets[3], context: context),
        TextSpan(text: "remarkable. "),

             ],
    ),
  );
}


WidgetSpan _highlightedText(
    {required String text, required String lottieAsset, required BuildContext context}) {
  bool isKorean = context.locale.languageCode == 'ko';
  return WidgetSpan(
    alignment: PlaceholderAlignment.baseline,
    baseline: TextBaseline.alphabetic,
    child: Stack(
      alignment: Alignment.center,
      children: [
// Background Lottie animation
        Lottie.asset(
          lottieAsset,
          width: text.length * (isKorean?15:10), // Adjust width based on text length
          height: 40,
          fit: BoxFit.contain,
          repeat: false,
        ),
// Text content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    ),
  );
}

