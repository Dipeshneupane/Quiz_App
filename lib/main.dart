import 'package:flutter/material.dart';

void main() => runApp(My_app());

class My_app extends StatelessWidget {
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
  int i = 0;
  List<Icon> scorekeeper = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quater of human bones are on feet.',
    'Slug\'s blood is green '
  ];
  List<bool> answer = [false, true, true];
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
            child: Center(
              child: Text(
                questions[i],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (answer[i] == true) {
                  scorekeeper.add(Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                } else {
                  scorekeeper.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                setState(() {
                  ++i;
                  if (i == 3) {
                    i = 0;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                "False",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (answer[i] == false) {
                  scorekeeper.add(Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                } else {
                  scorekeeper.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                setState(() {
                  ++i;
                  if (i == 3) {
                    i = 0;
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}
