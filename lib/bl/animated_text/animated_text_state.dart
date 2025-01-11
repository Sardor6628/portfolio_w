class TypeWriterState {
  final int currentIndex;
  final int currentCharIndex;
  final List<String> strings;

  TypeWriterState({
    required this.currentIndex,
    required this.currentCharIndex,
    required this.strings,
  });

  TypeWriterState copyWith({
    int? currentIndex,
    int? currentCharIndex,
  }) {
    return TypeWriterState(
      currentIndex: currentIndex ?? this.currentIndex,
      currentCharIndex: currentCharIndex ?? this.currentCharIndex,
      strings: strings,
    );
  }
}