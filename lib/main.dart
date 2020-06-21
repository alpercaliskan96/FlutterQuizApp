import 'package:flutter/material.dart';
import 'quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quiz newQuiz = Quiz();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scores = [];

  int questionNumber = 0;

  int x = 0;

  void checkAnswer(bool userAnswers) {
    bool correctAnswers = newQuiz.getQuestionAnswer();

    setState(() {
      if (userAnswers == correctAnswers) {
        scores.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        x += 10;
      } else {
        scores.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      if (newQuiz.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc:
              'You\'ve reached the end of the quiz.\n You have collect $x points',
        ).show();

        newQuiz.reset();
        scores = [];
        x = 0;
      } else {
        newQuiz.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                newQuiz.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(true);
              },
              color: Colors.green,
              child: Center(
                child: Text(
                  'True',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(false);
              },
              color: Colors.red,
              child: Center(
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scores,
        ),
      ],
    );
  }
}
