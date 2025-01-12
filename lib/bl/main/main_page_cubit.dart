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

  /// Updates the displayed text and current section
  void updateSection(String newSection) {
    emit(MainPageInitial(
      animatedText: '$prefix$newSection',
      currentSection: newSection,
    ));
  }
}