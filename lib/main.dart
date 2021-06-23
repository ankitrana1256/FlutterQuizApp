import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var quesindex = 0;
  var totalscore = 0;

  void resetQuiz() {
    setState(() {
      quesindex = 0;
      totalscore = 0;
    });
  }

  void change(int score) {
    setState(() {
      totalscore += score;
      quesindex = quesindex + 1;
    });
    print(quesindex);
  }

  @override
  Widget build(BuildContext context) {
    List questions = [
      {
        'questiontext':
            'When I get multiplied by any number, the sum of the figures in the product is always me. What am I?',
        'answer': [
          {'text': '4', 'score': 0},
          {'text': '9', 'score': 10},
          {'text': '8', 'score': 0},
          {'text': '2', 'score': 0},
        ],
      },
      {
        'questiontext':
            'A farmer has 86 chickens. All but 6 die. How many are left?',
        'answer': [
          {'text': '6', 'score': 10},
          {'text': '86', 'score': 0},
          {'text': '85', 'score': 0},
          {'text': '5', 'score': 0}
        ],
      },
      {
        'questiontext':
            'What is the most common connecting word for SHIP and CARDS?',
        'answer': [
          {'text': 'Sea', 'score': 0},
          {'text': 'Deck', 'score': 10},
          {'text': 'Port', 'score': 0},
          {'text': 'Harbour', 'score': 0}
        ],
      },
      {
        'questiontext': 'What is three-fifths of 50?',
        'answer': [
          {'text': '35', 'score': 0},
          {'text': '20', 'score': 0},
          {'text': '25', 'score': 0},
          {'text': '30', 'score': 10}
        ],
      },
      {
        'questiontext': 'What is the square root of 10,000?',
        'answer': [
          {'text': '10', 'score': 0},
          {'text': '100', 'score': 10},
          {'text': '110', 'score': 0},
          {'text': '1000', 'score': 0}
        ],
      },
      {
        'questiontext':
            'Which of the following words is spelt correctly (using US Spelling)?',
        'answer': [
          {'text': 'Vacumm', 'score': 0},
          {'text': 'Ocurred', 'score': 0},
          {'text': 'Greatful', 'score': 0},
          {'text': 'Fulfill', 'score': 10}
        ],
      },
      {
        'questiontext': '1/3 of 1/3 of 450 equals:',
        'answer': [
          {'text': '55', 'score': 0},
          {'text': '40', 'score': 0},
          {'text': '45', 'score': 0},
          {'text': '50', 'score': 10}
        ],
      },
      {
        'questiontext':
            'Melinda, 12 years old, is three times as old as Liza. How old will she be when she\'s twice as old as Liza?',
        'answer': [
          {'text': '18', 'score': 0},
          {'text': '14', 'score': 0},
          {'text': '16', 'score': 10},
          {'text': '24', 'score': 0}
        ],
      },
      {
        'questiontext': 'Water is to ice as milk is to _____.',
        'answer': [
          {'text': 'Calf', 'score': 0},
          {'text': 'Coffee', 'score': 0},
          {'text': 'Butter', 'score': 10},
          {'text': 'Cow', 'score': 0}
        ],
      },
      {
        'questiontext': 'What is the square root of 225?',
        'answer': [
          {'text': '25', 'score': 0},
          {'text': '15', 'score': 10},
          {'text': '52', 'score': 0},
          {'text': '22', 'score': 0}
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz app'),
        ),
        body: quesindex < questions.length
            ? Column(
                children: <Widget>[
                  Question(questions[quesindex]['questiontext']),
                  ...(questions[quesindex]['answer']
                          as List<Map<String, dynamic>>)
                      .map((answer) {
                    return Answer(
                        () => change(answer['score']), answer['text']);
                  }).toList()
                ],
              )
            : Result(totalscore, resetQuiz),
      ),
    );
  }
}
