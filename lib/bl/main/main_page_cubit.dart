// main_page_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  final String prefix = '  ~/  ';

  MainPageCubit()
      : super(MainPageInitial(
    animatedText: '  ~/  ',
    currentSection: '',
  ));

  void updateSection(String newSection) {
    final currentState = state as MainPageInitial;
    emit(currentState.copyWith(
      animatedText: '$prefix$newSection',
      currentSection: newSection,
    ));
  }

  void hoverStart() {
    final currentState = state as MainPageInitial;
    emit(currentState.copyWith(isHovered: true));
  }

  void hoverEnd() {
    final currentState = state as MainPageInitial;
    emit(currentState.copyWith(isHovered: false));
  }
}