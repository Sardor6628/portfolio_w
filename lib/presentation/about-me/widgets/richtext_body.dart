import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sardordev_consulting/constants/image_path.dart';
import 'package:sardordev_consulting/widgets/responsive.dart';

class BodyTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String languageCode = Localizations.localeOf(context).languageCode;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: Builder(
        key: ValueKey<String>(languageCode),
        builder: (context) {
          if (languageCode == 'ko') {
            return bodyTextWidgetKorean();
          } else if (languageCode == 'ru') {
            return bodyTextWidgetRussian();
          } else {
            return bodyTextWidgetEnglish();
          }
        },
      ),
    );
  }
}

// Your existing bodyTextWidgetEnglish, bodyTextWidgetRussian, and bodyTextWidgetKorean functions
Widget bodyTextWidgetEnglish() {
  return RichTextBodyEnglish();
}

Widget bodyTextWidgetRussian() {
  return RichTextBodyRussian();
}

Widget bodyTextWidgetKorean() {
  return RichTextBodyKorean();
}

class RichTextBodyEnglish extends StatelessWidget {
  RichTextBodyEnglish({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      TextStyle? boldStyle = Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(height: 2, fontWeight: FontWeight.bold);
      TextStyle? boldStyleHeader = Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(height: 2, fontWeight: FontWeight.bold);
      return Column(
        children: [
          Responsive(
              desktop: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sardor Ibrokhimov (Sam)",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Software Developer ",
                                style: Theme.of(context).textTheme.titleLarge,
                                children: [
                              TextSpan(
                                  text: " in Busan",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                            ]))
                      ],
                    ),
                    Lottie.asset(ImagePath.developer, width: 230)
                  ],
                ),
              ),
              mobile: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sardor Ibrokhimov (Sam)",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Software Developer ",
                            style: Theme.of(context).textTheme.titleLarge,
                            children: [
                          TextSpan(
                              text: " in Busan",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                        ])),
                    Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Lottie.asset(ImagePath.developer, width: 230))
                  ],
                ),
              )),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 2),
              children: [
                TextSpan(
                  text: 'Hello!\n',
                  style: boldStyleHeader,
                ),
                TextSpan(
                  text: 'My name is ',
                ),
                TextSpan(
                  text: 'Ibrokhimov Sardor',
                  style: boldStyle,
                ),
                TextSpan(
                  text: ', also known as ',
                ),
                TextSpan(
                  text: 'Sam',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      ', and I am a seasoned software developer with extensive experience in building robust and user-friendly software applications. My expertise lies in Flutter development for iOS and Android platforms, along with backend solutions that ensure scalability and efficiency.\n\n',
                ),
                TextSpan(
                  text: 'Technical Expertise:\n',
                  style: boldStyleHeader,
                ),
                TextSpan(
                  text: '• Programming Languages: ',
                  style: boldStyle,
                ),
                TextSpan(text: 'Dart (primary), Python\n'),
                TextSpan(
                  text: '• Frameworks and Tools: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Flutter (Bloc, Cubit, Provider, Riverpod, GetX), Firebase, FastAPI, SQLAlchemy\n',
                ),
                TextSpan(
                  text: '• Databases: ',
                  style: boldStyle,
                ),
                TextSpan(text: 'MySQL, SQLite\n'),
                TextSpan(
                  text: '• Platforms and Technologies: ',
                  style: boldStyle,
                ),
                TextSpan(
                    text:
                        'AWS, DigitalOcean, Crashlytics, Firebase Analytics, OpenCV, MediaPipe\n'),
                TextSpan(
                  text: '• Tools: ',
                  style: boldStyle,
                ),
                TextSpan(
                    text:
                        'Git, GitHub, GitLab, GitHub Actions, Flutter Codemagic, Docker (basic proficiency)\n'),
                TextSpan(
                  text: '• UI/UX Design Tools: ',
                  style: boldStyle,
                ),
                TextSpan(text: 'Adobe XD, Figma, Zeplin\n\n'),
                TextSpan(
                  text: 'Highlights of My Work and Achievements:\n',
                  style: boldStyleHeader,
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'AI-Driven Chatbots: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Developed OpenAI-based chatbots personalized for specific domains, such as company-focused customer support and call center automation, leveraging FastAPI, WebSocket, Flutter, and AI models.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'Mobile Apps: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Developed and contributed to over a dozen apps available on app stores, ensuring high-quality user experiences and functionality.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'Web Projects: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Designed and implemented several web applications, handling both backend and frontend development with modern tools and frameworks.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'Freelance Leadership: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Led and architected various freelance projects, mentoring junior developers and delivering robust solutions to clients.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'Research and Publications: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Conducted impactful research during my Master\'s degree, publishing several papers, one of which received the Outstanding Paper Award from the Korea Information Processing Society.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'Collaboration: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Actively collaborating with developers worldwide, having successfully partnered on numerous projects to create innovative solutions.\n\n',
                ),
                TextSpan(
                  text:
                      'Thank you for taking the time to learn about me—I look forward to connecting and creating something remarkable together!\n',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class RichTextBodyRussian extends StatelessWidget {
  RichTextBodyRussian({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      TextStyle? boldStyle = Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(height: 2, fontWeight: FontWeight.bold);
      TextStyle? boldStyleHeader = Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(height: 2, fontWeight: FontWeight.bold);
      return Column(
        children: [
          Responsive(
              desktop: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Сардор Иброхимов (Сэм)",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Software Developer,",
                                style: Theme.of(context).textTheme.titleLarge,
                                children: [
                              TextSpan(
                                  text: " Busan",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                            ]))
                      ],
                    ),
                    Lottie.asset(ImagePath.developer, width: 230)
                  ],
                ),
              ),
              mobile: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Сардор Иброхимов (Сэм)",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Software Developer ",
                            style: Theme.of(context).textTheme.titleLarge,
                            children: [
                          TextSpan(
                              text: " in Busan",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                        ])),
                    Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Lottie.asset(ImagePath.developer, width: 230))
                  ],
                ),
              )),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 2),
              children: [
                TextSpan(
                  text: 'Здравствуйте!\n',
                  style: boldStyleHeader,
                ),
                TextSpan(
                  text: 'Меня зовут ',
                ),
                TextSpan(
                  text: 'Сардор Иброхимов',
                  style: boldStyle,
                ),
                TextSpan(
                  text: ', также известный как ',
                ),
                TextSpan(
                  text: 'Сэм',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      ', и я опытный разработчик с многолетним опытом создания надёжных и удобных приложений. Моя специализация — разработка мобильных приложений на Flutter для iOS и Android, а также создание серверных решений, которые обеспечивают масштабируемость и эффективность.\n\n',
                ),
                TextSpan(
                  text: 'Техническая экспертиза:\n',
                  style: boldStyleHeader,
                ),
                TextSpan(
                  text: '• Языки программирования: ',
                  style: boldStyle,
                ),
                TextSpan(text: 'Dart (основной), Python\n'),
                TextSpan(
                  text: '• Фреймворки и инструменты: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Flutter (Bloc, Cubit, Provider, Riverpod, GetX), Firebase, FastAPI, SQLAlchemy\n',
                ),
                TextSpan(
                  text: '• Базы данных: ',
                  style: boldStyle,
                ),
                TextSpan(text: 'MySQL, SQLite\n'),
                TextSpan(
                  text: '• Платформы и технологии: ',
                  style: boldStyle,
                ),
                TextSpan(
                    text:
                        'AWS, DigitalOcean, Crashlytics, Firebase Analytics, OpenCV, MediaPipe\n'),
                TextSpan(
                  text: '• Инструменты: ',
                  style: boldStyle,
                ),
                TextSpan(
                    text:
                        'Git, GitHub, GitLab, GitHub Actions, Flutter Codemagic, Docker (базовые знания)\n'),
                TextSpan(
                  text: '• UI/UX: ',
                  style: boldStyle,
                ),
                TextSpan(text: 'Adobe XD, Figma, Zeplin\n\n'),
                TextSpan(
                  text: 'Основные достижения:\n',
                  style: boldStyleHeader,
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'Чат-боты на базе ИИ: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Разработал чат-ботов с использованием OpenAI для специфических задач, таких как поддержка клиентов и автоматизация call-центров, с использованием FastAPI, WebSocket, Flutter и моделей ИИ.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'Мобильные приложения: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Создал и участвовал в разработке более 10 приложений, доступных в магазинах приложений, с акцентом на качество и удобство.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'Веб-проекты: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Реализовал несколько веб-приложений, разрабатывая как серверную, так и клиентскую части.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'Фриланс: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Руководил и участвовал в различных проектах, наставлял младших разработчиков и создавал надёжные решения для клиентов.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'Научные исследования: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'В рамках магистратуры провёл исследования, опубликовал несколько статей, одна из которых получила награду за выдающуюся работу от Корейского общества обработки информации.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'Сотрудничество: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Сотрудничал с разработчиками из разных стран, совместно работая над инновационными проектами.\n\n',
                ),
                TextSpan(
                  text:
                      'Спасибо за внимание! Буду рад новым проектам и интересному сотрудничеству!\n',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class RichTextBodyKorean extends StatelessWidget {
  RichTextBodyKorean({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      TextStyle? boldStyle = Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(height: 2, fontWeight: FontWeight.bold);
      TextStyle? boldStyleHeader = Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(height: 2, fontWeight: FontWeight.bold);
      return Column(
        children: [
          Responsive(
              desktop: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "이브로히모브 사르도르 (샘)",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        RichText(
                            text: TextSpan(
                                text: "부산 기반 소프트웨어 개발자",
                                style: Theme.of(context).textTheme.titleLarge,
                                children: []))
                      ],
                    ),
                    Lottie.asset(ImagePath.developer, width: 230)
                  ],
                ),
              ),
              mobile: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "이브로히모브 사르도르 (샘)",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "부산 기반 소프트웨어 개발자",
                            style: Theme.of(context).textTheme.titleLarge,
                            children: []))
                    ,Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Lottie.asset(ImagePath.developer, width: 230))
                  ],
                ),
              )),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 2),
              children: [
                TextSpan(
                  text: '안녕하세요!\n',
                  style: boldStyleHeader,
                ),
                TextSpan(
                  text: '저는 ',
                ),
                TextSpan(
                  text: '이브로히모브 사르도르',
                  style: boldStyle,
                ),
                TextSpan(
                  text: ', 또는 ',
                ),
                TextSpan(
                  text: '샘',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      '이라고 불립니다. 저는 안정적이고 사용자 친화적인 애플리케이션을 개발하는 데 풍부한 경험을 가진 소프트웨어 개발자입니다. 특히 iOS 및 Android 플랫폼을 위한 Flutter 개발과 확장성과 효율성을 갖춘 백엔드 솔루션 설계에 전문성을 보유하고 있습니다.\n\n',
                ),
                TextSpan(
                  text: '기술 역량:\n',
                  style: boldStyleHeader,
                ),
                TextSpan(
                  text: '• 프로그래밍 언어: ',
                  style: boldStyle,
                ),
                TextSpan(text: 'Dart (주력), Python\n'),
                TextSpan(
                  text: '• 프레임워크 및 도구: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'Flutter (Bloc, Cubit, Provider, Riverpod, GetX), Firebase, FastAPI, SQLAlchemy\n',
                ),
                TextSpan(
                  text: '• 데이터베이스: ',
                  style: boldStyle,
                ),
                TextSpan(text: 'MySQL, SQLite\n'),
                TextSpan(
                  text: '• 플랫폼 및 기술: ',
                  style: boldStyle,
                ),
                TextSpan(
                    text:
                        'AWS, DigitalOcean, Crashlytics, Firebase Analytics, OpenCV, MediaPipe\n'),
                TextSpan(
                  text: '• 도구: ',
                  style: boldStyle,
                ),
                TextSpan(
                    text:
                        'Git, GitHub, GitLab, GitHub Actions, Flutter Codemagic, Docker (기본 이해)\n'),
                TextSpan(
                  text: '• UI/UX: ',
                  style: boldStyle,
                ),
                TextSpan(text: 'Adobe XD, Figma, Zeplin\n\n'),
                TextSpan(
                  text: '주요 성과:\n',
                  style: boldStyleHeader,
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: 'AI 기반 챗봇: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      'FastAPI, WebSocket, Flutter 및 AI 모델을 활용하여 고객 지원 및 콜센터 자동화를 위한 OpenAI 기반 챗봇을 설계 및 개발.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: '모바일 애플리케이션: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text: '10개 이상의 고품질 애플리케이션을 개발 및 스토어에 출시.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: '웹 프로젝트: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text: '백엔드와 프론트엔드를 포함한 다양한 웹 애플리케이션 설계 및 구현.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: '프리랜스 경험: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text:
                      '다양한 프리랜스 프로젝트를 주도하며, 주니어 개발자를 멘토링하고 신뢰할 수 있는 솔루션 제공.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: '연구 및 출판: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text: '석사 과정 중 여러 논문을 발표, 그중 하나는 한국정보처리학회에서 우수 논문으로 선정됨.\n',
                ),
                TextSpan(text: '• '),
                TextSpan(
                  text: '협업 경험: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text: '전 세계의 개발자들과 협업하며 혁신적인 프로젝트를 성공적으로 실행.\n\n',
                ),
                TextSpan(
                  text: '읽어 주셔서 감사합니다! 새로운 프로젝트와 협력을 기대합니다!\n',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
