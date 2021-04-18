class Quiz {
  /// 問題文
  final String question;
  /// 問題のジャンル
  final String genre;
  /// 難易度
  final int difficulty;
  /// 答え
  final String answer;
  /// 選択肢
  final List<String> choices;

  Quiz({
    required this.question,
    required this.genre,
    required this.difficulty,
    required this.answer,
    required this.choices,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    final List<dynamic> choicesJson = json['choices'];
    return Quiz(
      question: json['question'], 
      genre: json['genre'], 
      difficulty: json['difficulty'], 
      answer: json['answer'], 
      choices: choicesJson.map((e) => '$e').toList());
  }
}