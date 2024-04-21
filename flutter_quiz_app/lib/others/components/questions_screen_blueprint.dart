class QuestionScreenBlueprint {
  const QuestionScreenBlueprint(this.text, this.answers);
  final String text;
  final List<String> answers;

  get shuffleList => null;

  List<String> getShuffledAnswers() {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}
