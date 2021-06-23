import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function() resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultphase {
    var resulttext = 'You did it';
    if (resultScore <= 10) {
      resulttext = 'Better luck next time';
    } else if (resultScore <= 40) {
      resulttext = 'Still need more practice';
    } else if (resultScore <= 60) {
      resulttext = 'Average';
    } else if (resultScore <= 80) {
      resulttext = 'Quite a good score';
    } else if (resultScore <= 100) {
      resulttext = 'I like smart people';
    }
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultphase,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Restart Quiz'),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
