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
    if (state is MainPageInitial) {
      emit((state as MainPageInitial).copyWith(
        animatedText: '$prefix$newSection',
        currentSection: newSection,
      ));
    }
  }
}