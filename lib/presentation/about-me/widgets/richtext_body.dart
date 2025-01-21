import 'package:flutter/material.dart';

class RichTextBodyEnglish extends StatelessWidget {
  RichTextBodyEnglish({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        TextStyle? boldStyle = Theme
            .of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(height: 2,fontWeight: FontWeight.bold);
        TextStyle? boldStyleHeader = Theme
            .of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(height: 2,fontWeight: FontWeight.bold);
        return RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(height: 2),
            children: [
              TextSpan(
                text: 'Hello!\n',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextSpan(
                text: 'My name is ',
              ),
              TextSpan(
                text: 'Ibrokhimov Sardor',
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
        );
      }
    );
  }
}
