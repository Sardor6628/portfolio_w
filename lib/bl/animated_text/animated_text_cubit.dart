import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_p/bl/animated_text/animated_text_state.dart';

class TypeWriterCubit extends Cubit<TypeWriterState> {
  TypeWriterCubit()
      : super(TypeWriterState(
    currentIndex: 0,
    currentCharIndex: 0,
    strings: [
      "Welcome to ProtoCodersPoint.com",
      "Get Programming Solution Here",
      "And more...",
    ],
  ));

  void startAnimation() {
    print('Rebuilding with text: ${state.strings[state.currentIndex].substring(0, state.currentCharIndex)}');
    _typeWritingAnimation();
  }

  void _typeWritingAnimation() async {
    if (state.currentCharIndex < state.strings[state.currentIndex].length) {
      emit(state.copyWith(currentCharIndex: state.currentCharIndex + 1));
    } else {
      emit(state.copyWith(
        currentIndex: (state.currentIndex + 1) % state.strings.length,
        currentCharIndex: 0,
      ));
    }

    // Recursively call with a delay
    await Future.delayed(const Duration(milliseconds: 50));
    _typeWritingAnimation();
  }
}

