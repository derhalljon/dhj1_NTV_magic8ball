import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(BallPage());
}

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Magic 8 Ball of Destiny'),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Ball()),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  void askTheBall() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: Colors.blueGrey.shade600,
        textStyle: const TextStyle(
          fontSize: 18.0,
        ));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  print('I got clicked');
                  setState(() {
                    askTheBall();
                    print(ballNumber);
                  });
                },
                child: Image.asset('images/ball$ballNumber.png'),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 80.0,
            width: 240.0,
            child: ElevatedButton(
              style: style,
              onPressed: () {
                setState(() {
                  askTheBall();
                });
              },
              child: const Text(
                'Think of a question, then press me for an answer',
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
