import 'question.dart';

class Quiz {
  int _questionNumber = 0;

  List<Question> _questionList = [
    Question(
        q: 'Question 1\n\n The world’s tallest living man is 251cm', a: true),
    Question(
        q: 'Question 2\n\n  Muscle turns to fat if you stop exercising.',
        a: false),
    Question(q: 'Question 3\n\n  Lithium has the atomic number 17.', a: false),
    Question(
        q: 'Question 4\n\n  The classic sci-fi novel Fahrenheit 451 gets its title from the temperature used to burn paper.',
        a: true),
    Question(q: 'Question 5\n\n  Drinking warm milk induces sleep.', a: true),
    Question(
        q: 'Question 6\n\n  Jupiter is the sixth planet from the sun.',
        a: false),
    Question(q: 'Question 7\n\n   Hotmail was launched in 1996.', a: true),
    Question(
        q: 'Question 8\n\n  Brazil has won more World Cup championships than any other country.',
        a: true),
    Question(
        q: 'Question 9\n\n  111,111,111 x 111,111,111 = 12,345,678,987,654,321',
        a: true),
    Question(
        q: 'Question 10\n\n  England\'s King Henry VIII had all of his six wives killed.',
        a: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionList.length - 1) {
      _questionNumber++;
    } else {}
  }

  String getQuestionText() {
    return _questionList[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionList[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber == _questionList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
