import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:website_p/constants/image_path.dart';
import 'package:website_p/constants/urls.dart';
import 'package:website_p/widgets/lottie_hover_widget.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: 800, minHeight: MediaQuery.of(context).size.height - 150),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: Column(
              key: ValueKey("dont_be_a_stranger".tr()),
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("dont_be_a_stranger".tr(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 40, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Container(
                      child: Lottie.asset(
                        ImagePath.hello,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  LottieHoverWidget(
                      lottiePath: ImagePath.githubLogo,
                      size: 80,
                      socialUrl: ConstantEndPoint.githubUrl),
                  LottieHoverWidget(
                      padding: 7,
                      size: 80,
                      lottiePath: ImagePath.linkedInLogo,
                      socialUrl: ConstantEndPoint.linkedInUrl),
                  LottieHoverWidget(
                      size: 80,
                      lottiePath: ImagePath.facebookLogo,
                      socialUrl: ConstantEndPoint.facebookUrl),
                  LottieHoverWidget(
                      size: 80,
                      lottiePath: ImagePath.telegramLogo,
                      socialUrl: ConstantEndPoint.telegramUrl),
                ]),
              )
            ]),
          )),
    );
  }
}
