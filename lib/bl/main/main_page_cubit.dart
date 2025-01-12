import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  String prefix='  ~/  ';
  MainPageCubit()
      : super(MainPageInitial(
          animatedText:'  ~/  ',
        ));

  void updateAnimatedText(String newText) {
    emit(MainPageInitial(
      animatedText: prefix+newText,
    ));
  }
}
