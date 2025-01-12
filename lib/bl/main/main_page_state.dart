part of 'main_page_cubit.dart';

@immutable
abstract class MainPageState {}

class MainPageInitial extends MainPageState {
  final String animatedText;
  final String currentSection;

  MainPageInitial({
    required this.animatedText,
    required this.currentSection,
  });
}