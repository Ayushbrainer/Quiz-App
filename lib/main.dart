import 'package:flutter/material.dart';



void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset('ij/img/download.jpg'),
              quiz()
            ],
          ),
        ),
      ) ,
    );
  }
}

class questions{
  final String q;
  final String a;

  questions(this.q, this.a);

}

List<questions> qa = [
  new questions("Santiago is the capital of Chile", "True"),
  new questions("Ben Patrick is the highest mountain in Britain", "False"),
  new questions("Vatican City is the smallest country in the world", "True"),
  new questions("Alberta is a province of Australia", "False"),new questions("Four countries still have the shilling as currency", "True"),
  new questions("E is the only vowel not used as the first letter in a US State", "True"),
  new questions("America is the largest country in the world", "False"),

];

int qno = 0;


class quiz extends StatefulWidget {
  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.purpleAccent
          ),
          child: Center(child: Text("${qa[qno%7].q}",style: TextStyle(
            fontSize: 15.0
          ),)),
        ),
        Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(onPressed: (){
                setState(() {
                  SnackBar s1 = new SnackBar(content: Text("Incorrect"),duration: Duration(microseconds: 25),);
                  SnackBar s = new SnackBar(content: Text("Correct"),duration: Duration(microseconds: 25),);
                  if(qa[qno%7].a == "True"){
                    Scaffold.of(context).showSnackBar(s);
                    qno++;
                  }else{Scaffold.of(context).showSnackBar(s1);}
                });
              }, child: Container(
                //color: Colors.teal,
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(12.0)
                ),
                child: Center(child: Text("True")),
              )),
              FlatButton(onPressed: (){
                setState(() {
                  SnackBar s = new SnackBar(content: Text("Correct"),duration: Duration(microseconds: 25),);
                  SnackBar s1 = new SnackBar(content: Text("Incorrect"),duration: Duration(microseconds: 25),);
                  if(qa[qno%7].a == "False"){
                    Scaffold.of(context).showSnackBar(s);
                    qno++;
                  }
                  else{Scaffold.of(context).showSnackBar(s1);}
                });
              }, child: Container(
                //color: Colors.teal,
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.teal
                ),
                child: Center(child: Text("False")),
              ))
            ],
          ),
        )
      ],
    );
  }
}


