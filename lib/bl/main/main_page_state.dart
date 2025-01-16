part of 'main_page_cubit.dart';

@immutable
abstract class MainPageState {}

class MainPageInitial extends MainPageState {
  final String animatedText;
  final String currentSection;
  final bool isHovered;

  MainPageInitial({
    required this.animatedText,
    required this.currentSection,
    this.isHovered = false,
  });

  MainPageInitial copyWith({
    String? animatedText,
    String? currentSection,
    bool? isHovered,
  }) {
    return MainPageInitial(
      animatedText: animatedText ?? this.animatedText,
      currentSection: currentSection ?? this.currentSection,
      isHovered: isHovered ?? this.isHovered,
    );
  }
}