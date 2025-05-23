
import 'package:flutter/material.dart';
import 'package:quiz/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var score = 0;
  var n = 0;
  List que_list = [
    Question('1.MS Word is a hardware', false),
    Question('2.CPU Controls only the inputs data of computer', false),
    Question('3.CPU stands for Central Processing Unit', true),
    Question(
        '4.Freeware is a Software that is avaliable for use at no Monetary ',
        false),
    Question('5.Flutter is developed by Google', true),
  ];

  void checkAnswer(bool choice,BuildContext ctx) {
    if(choice == que_list[n].ans) {
      
        score = score + 1;
        final snackbar = SnackBar(content: Text('Correct Answer'),
        duration: Duration(microseconds: 500),
        backgroundColor:Colors.green,
        );
        ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    } 
    else 
    {
      final snackbar = SnackBar(content: Text('Wrong Answer'),
        duration: Duration(microseconds: 500),
        backgroundColor:Colors.red,
        );
        ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    }
    setState(() {
      
  if (n < que_list.length - 1) {
      n = n + 1;
    
    } 
    else {
      final snackbar = SnackBar(content: Text('Quiz Completed! Score: $score/5'),
        duration: Duration(seconds: 5),
        backgroundColor:Colors.lightBlueAccent,
        );
        ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
        reset();
    }
  });
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            'Quiz App',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Builder(builder: (ctx) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Score : $score/5 ",
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        reset();
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 75,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.blueAccent)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        que_list[n].qns,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'True',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        checkAnswer(true,ctx);
                      },
                    ),
                    ElevatedButton(
                      child: Text(
                        'False',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        checkAnswer(false,ctx);
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
