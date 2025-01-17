import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:lottie/lottie.dart';
import 'package:website_p/bl/theme/theme_cubit.dart';
import 'package:website_p/constants/image_path.dart';
import 'package:website_p/widgets/gradient_button_widget.dart';

class MainContentWidget extends StatefulWidget {
  const MainContentWidget({super.key});

  @override
  State<MainContentWidget> createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {
  List<String> lottieAssets = [
    ImagePath.markLottieMain1,
    ImagePath.markLottieMain2,
    ImagePath.markLottieMain3,
    ImagePath.markLottieMain4,
  ];

  @override
  Widget build(BuildContext context) {
    var boldStyle = Theme.of(context)
        .textTheme
        .bodyLarge
        ?.copyWith(height: 2, fontWeight: FontWeight.bold);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 30),
            // titleWidgetWithHand(context),
            // const SizedBox(height: 16),
            // bodyTextWidget(context, boldStyle),
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                bool isDarkMode = themeMode == ThemeMode.dark;
                return Row(
                  children: [
                    GradientButtonWidget(
                        isDarkMode: isDarkMode,
                        isTheme1: true,
                        widgetButton: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              color: Color(0xffdb2877),
                              size: 28,
                            ),
                            SizedBox(width: 8),
                            Text("About Me →",
                                style: TextStyle(
                                  color: Color(0xff818cf8),
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                )),
                          ],
                        )),
                    GradientButtonWidget(
                        isDarkMode: isDarkMode,
                        isTheme1: false,
                        widgetButton: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.article_outlined,
                              color: Color(0xffc125d3),
                              size: 28,
                            ),
                            SizedBox(width: 8),
                            Text("Read CV! →",
                                style: TextStyle(
                                  color: Color(0xff23cbe5),
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                )),                          ],
                        )),

                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Row titleWidgetWithHand(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 200, maxWidth: 750),
            child: Text(
              "Bringing Your Ideas to Life Through Software",
              maxLines: 2,
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

  Widget bodyTextWidget(BuildContext context, TextStyle? boldStyle) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 2),
        children: [
          TextSpan(
              text:
                  "Welcome! Unlock your business’s full potential with tailored solutions designed to meet your"),

          _highlightedText(text: "unique needs.", lottieAsset: lottieAssets[1]),
          TextSpan(
              text:
                  "Whether it’s developing innovative software, enhancing existing systems, streamlining operations through automation, or integrating Generative AI, my approach focuses on delivering value-driven, future-ready solutions."),
          TextSpan(text: " With expertise in"),
          _highlightedText(text: "software", lottieAsset: lottieAssets[3]),
          TextSpan(text: "architecture, system centralization,"),
          // _highlightedText(text: " ", lottieAsset: lottieAssets[2]),
          TextSpan(text: " and"),
          _highlightedText(text: "automation,", lottieAsset: lottieAssets[2]),
          TextSpan(
              text:
                  "or integrating Generative AI, my approach focuses on delivering value-driven, future-ready"),
          _highlightedText(text: "solutions.", lottieAsset: lottieAssets[0]),
          TextSpan(text: '\n\n'),
          TextSpan(text: "With expertise in "),
          TextSpan(text: "software architecture", style: boldStyle),
          TextSpan(text: ", "),
          TextSpan(text: "system centralization", style: boldStyle),
          TextSpan(text: ", and "),
          TextSpan(text: "automation", style: boldStyle),
          TextSpan(
              text:
                  ", I craft solutions that simplify processes, enhance user experiences, and align seamlessly with your business"),
          _highlightedText(text: "goals.", lottieAsset: lottieAssets[3]),
          TextSpan(text: "My experience spans"),
          _highlightedText(
              text: "diverse domains,", lottieAsset: lottieAssets[2]),
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
          TextSpan(text: '\n\n'),
          TextSpan(text: "Together", style: boldStyle),
          TextSpan(text: ", we can craft something"),
          _highlightedText(text: "truly", lottieAsset: lottieAssets[3]),
          TextSpan(text: "remarkable. "),
        ],
      ),
    );
  }

  WidgetSpan _highlightedText(
      {required String text, required String lottieAsset}) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.baseline,
      baseline: TextBaseline.alphabetic,
      child: Stack(
        alignment: Alignment.center,
        children: [
// Background Lottie animation
          Lottie.asset(
            lottieAsset,
            width: text.length * 10, // Adjust width based on text length
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
}
