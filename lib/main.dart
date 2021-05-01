import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calcultor',
      home: My_Calculator(),
  ));
}

class My_Calculator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return calculator();
  }
}

class calculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _calclator();
  }

}

class _calclator extends State<calculator> {
  String text = '0';
  double num1 = 0.0;
  double num2 = 0.0;

  String result = '0';
  String finalreslut = '0';
  String preope = '';
  String ope = '';
  final color = Colors.deepPurple;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        backgroundColor: color,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child:
                    Text(text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button('C', Color.fromRGBO(161, 161, 163, 100), 1),
                  Button('+/-', Color(0xffa5a5a7), 1),
                  Button('%', Color(0xffa5a5a7), 1),
                  Button('/', Color(0xffff9800), 1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button('7', Color(0xff323232), 1),
                  Button('8', Color(0xff323232), 1),
                  Button('9', Color(0xff323232), 1),
                  Button('x', Color(0xffff9800), 1),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Button('4', Color(0xff323232), 1),
                    Button('5', Color(0xff323232), 1),
                    Button('6', Color(0xff323232), 2),
                    Button('-', Color(0xffff9800), 2),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Button('1', Color(0xff323232), 1),
                    Button('2', Color(0xff323232), 1),
                    Button('3', Color(0xff323232), 1),
                    Button('+', Color(0xffff9800), 1),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Button('0', Color(0xff323232), 0),
                    Button('.', Color(0xff323232), 1),
                    Button('=', Color(0xffff9800), 1),
                  ])
            ])
    );
  }


  Widget Button(String txt, Color color, int i) {
    Widget container;
    if (i == 0) {
      container = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            calculate(txt);
          },
          child: Text(txt,
              style: TextStyle(fontSize: 20)
          ),
          style: ElevatedButton.styleFrom(
            primary: color,
            padding: EdgeInsets.only(left: 95, right: 95, top: 20, bottom: 20),
            shape: StadiumBorder(),
          ),
        ),
      );
    }
    else {
      container = Container(
        width: 70,
        padding: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            calculate(txt);
          },
          child: Text(txt,
              style: TextStyle(fontSize: 20)
          ),
          style: ElevatedButton.styleFrom(
            primary: color,
            padding: EdgeInsets.all(30),
            shape: CircleBorder(),
          ),
        ),
      );
    }
    return container;
  }



void calculate (txt) {
  if (txt == 'C') {
    num1 = 0;
    num2 = 0;
    result = '0';
    finalreslut = '';
    text = '0';
    preope = '';
    ope = '';
  }
  else if (ope == '=' && txt == '=') {
    switch (preope) {
      case '+' :
        finalreslut = add();
        break;
      case '-' :
        finalreslut = sub();
        break;
      case 'x' :
        finalreslut = Mul();
        break;
      case '/' :
        finalreslut = Div();
        break;
    }

  }
  else if (txt == '+' || txt == '-' || txt == 'x' || txt == '/' || txt == '=') {
    if (num1 == 0) {
      num1 = double.parse(result);
    }
    else {
      num2 = double.parse(result);
    }
    switch (ope) {
      case '+' :
        finalreslut = add();
        break;
      case '-' :
        finalreslut = sub();
        break;
      case 'x' :
        finalreslut = Mul();
        break;
      case '/' :
        finalreslut = Div();
        break;
    }
    preope = ope;
    ope = txt;
    result = '';
  }
  else if(txt == '%'){
    result = (num1%100).toString();
    finalreslut = result;
  }
  else if (txt == '.') {
    if(!result.contains('.'))
      result += '.';
    finalreslut = result;
  } else if (txt == '+/-') {
    result.startsWith('-') ? result = result.substring(1) : result =
        '-' + result;

    finalreslut = result;
  }
  else {
      if(result == '0'){
        result = txt;
        finalreslut = result;
      }
      else {
      result = result + txt;
      finalreslut = result;
    }
  }
    setState(() {
      text = finalreslut;
    });
  }






  String add() {
    result = (num1+num2).toString();
    num1 = double.parse(result);
    return result;
  }
  String sub() {
    result = (num1-num2).toString();
    num1 = double.parse(result);
    return result;
  }
  String Mul() {
    result = (num1*num2).toString();
    num1 = double.parse(result);
    return result;
  }
  String Div() {
    result = (num1/num2).toString();
    num1 = double.parse(result);
    return result;
  }
 }

