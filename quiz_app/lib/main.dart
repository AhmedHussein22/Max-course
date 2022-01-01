import 'package:flutter/material.dart';
import 'package:quiz_app/ans.dart';
import 'package:quiz_app/ques.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz APP',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List quetion=[
    {
      "q":"What\'s your favorite food ?", 
      "a":
      [
        {"ans":"pizza","score":30},
        {"ans":"meat","score":20},
        {"ans":"fish","score":10}
      ]  
    },
    {
      "q":"What\'s your favorite girl name ?", 
      "a":
      [
        {"ans":"Roaa","score":30},
        {"ans":"Malak","score":20},
        {"ans":"Slsabil","score":10}
      ]  
    },
    {
      "q":"What\'s your favorite day name ?", 
      "a":
      [
        {"ans":"sunday","score":30},
        {"ans":"friday","score":20},
        {"ans":"monday","score":10}
      ]  
    }
  ];
  int index=0;
  int totalscore=0;
  void _onpressfun(int score){
     totalscore = totalscore+score;
    setState(() {
      index++;
    });
    print(index);
  }
  void resetHandler(){
    setState(() {
      index=0;
      totalscore =0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child:index < quetion.length ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Question(question: quetion[index]["q"],),
              ...(quetion[index]['a'] as List<Map<String,dynamic>>).map((answer) {
          return Answer(
            onAnswerClick:()=> _onpressfun(answer['score']),
            answerText: answer['ans'],
          );
        }).toList()
            ],
          ):
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your score is : $totalscore",
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
            ],
          ),
          
        ),
      ),
    );
  }
}
