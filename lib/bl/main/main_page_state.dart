part of 'main_page_cubit.dart';

@immutable
sealed class MainPageState {
}

final class MainPageInitial extends MainPageState {
  String animatedText;
  MainPageInitial({required this.animatedText});

}
