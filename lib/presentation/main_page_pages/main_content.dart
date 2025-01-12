import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MainContentWidget extends StatefulWidget {
  const MainContentWidget({super.key});

  @override
  State<MainContentWidget> createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Bringing Your Ideas to Life Through Software",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Lottie.asset(
                  'assets/lotties/shake_hand.json',
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  const TextSpan(
                      text:
                      "Welcome! I specialize in blending engineering expertise with strategic insight to help businesses "),
                  _highlightedText("design", Colors.purple),
                  const TextSpan(text: " and "),
                  _highlightedText("enhance", Colors.red),
                  const TextSpan(
                      text:
                      " their software solutions.\n\nWith over two decades of experience in "),
                  _highlightedText("software development", Colors.blue),
                  const TextSpan(
                      text:
                      ", I bring a unique combination of hands-on technical skills and high-level guidance. My goal is to craft solutions that are both "),
                  _highlightedText("innovative", Colors.green),
                  const TextSpan(text: " and aligned with your "),
                  _highlightedText("business vision", Colors.green),
                  const TextSpan(text: ".\n\n"),
                  _highlightedText("Together", Colors.orange,
                      underline: true),
                  const TextSpan(text: ", we can create something "),
                  _highlightedText("remarkable", Colors.yellow),
                ],
              ),
            ),          ],
        ),
      ),
    );
  }

  WidgetSpan _highlightedText(String text, Color color, {bool underline = false}) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.baseline,
      baseline: TextBaseline.alphabetic,
      child: Stack(
        children: [
          // Highlight or stroke behind the text
          CustomPaint(
            painter: HighlightPainter(color),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: underline ? TextDecoration.underline : TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HighlightPainter extends CustomPainter {
  final Color color;

  HighlightPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.3) // Semi-transparent for highlight effect
      ..style = PaintingStyle.fill;

    // Create a custom path for the highlight
    final path = Path()
      ..moveTo(0, size.height * 0.75) // Bottom left
      ..lineTo(size.width * 0.9, 0) // Top right, slightly offset
      ..lineTo(size.width, size.height * 0.25) // Top right curve
      ..lineTo(size.width * 0.1, size.height) // Bottom left offset
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
