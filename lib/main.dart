import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuestionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank quesB = QuestionBank();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[400],
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];

  void checkAnswer(bool userPickedanswer) {
    bool correctanswer = quesB.getCorrectAnswer();
    setState(() {
      if (scorekeeper.length <= 12) {
        if (userPickedanswer == correctanswer) {
          print('User got it right');
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          print('User is wrong');
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        quesB.nextQuestion();
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Quize End",
          desc: "You Have Reached The End Of The Quiz So We Will Start Again",
          buttons: [
            DialogButton(
              child: Text(
                "COOL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        scorekeeper.clear();
        quesB.resetQl();

      }
    });
  }
/*List<String> questions=[
  'You can lead a cow down stairs but not upstairs.',
  'Approximately one quater of human bones are in feet.',
  'A slug\'s blood is green.',
];

List<bool>answers=[
  false,
  true,
  true
];*/

//Question q1=Question('You can lead a cow down stairs but not upstairs.',false);
// //Question q2=Question('Approximately one quater of human bones are in feet.',true);
// //Question q3=Question('A slug\'s blood is green.',true);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(child: Text(quesB.getQuestion())),
          ),
        ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: Text('True')))),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text('False')),
          ),
        ),
        Row(children: scorekeeper)
      ],
    );
  }
}
