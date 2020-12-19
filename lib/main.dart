import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output ='0';

  String result = "0";
  double num1 =0.0;
  double num2 =0.0;
  String operand="";





  buttonpressed(String Buttontext){


    if(Buttontext == "CLEAR"){

       result = "0";
       num1 =0.0;
       num2 =0.0;
       operand="";


    }
    else if(Buttontext == "+"  || Buttontext == "-" || Buttontext == "*" || Buttontext =="/"){

      num1 = double.parse(output);
      operand = Buttontext;
      result = "0";


    }
    else if(Buttontext == "."){
    if(result.contains(".")){
  print("Already a decimal");
  return;

    }
    else {
      result = result + Buttontext;
    }

    }
    else if(Buttontext == "="){
      num2 = double.parse(output);

      if(operand == "+"){
        result = (num1+ num2).toString();
      }
      if(operand == "-"){
        result = (num1 - num2).toString();
      }
      if(operand == "*"){
        result = (num1 * num2).toString();
      }
      if(operand == "/"){
        result = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand="";
    }
    else {
        result = result+ Buttontext;
    }
print(output);
    setState(() {
      output = double.parse(result).toStringAsFixed(3);
    });








    print(Buttontext);



  }


  Widget buildbutton(String Buttontext){
  return Expanded(
  child: OutlineButton(
    padding: EdgeInsets.all(24.0),
  child: Text(Buttontext,
  style: TextStyle(fontSize: 20.0,
  fontWeight: FontWeight.bold),
  ),
  onPressed: (){
      buttonpressed(Buttontext);
  },


  ),
  );
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:Container(
        child: Column(children:<Widget>[
            Container(
                alignment:Alignment.centerRight,
                padding:EdgeInsets.symmetric(vertical: 24.0
                ,horizontal: 12.0),child: Text(output,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))),
          Expanded(
            child:Divider(),

          ),
          Column(children: [Row(children: [
            buildbutton('7'),
            buildbutton('8'),
            buildbutton('9'),
            buildbutton('/'),

          ],


          ),
            Row(children: [
              buildbutton('4'),
              buildbutton('5'),
              buildbutton('6'),
              buildbutton('*'),

            ],


            ),
            Row(children: [
              buildbutton('1'),
              buildbutton('2'),
              buildbutton('3'),
              buildbutton('-'),

            ],


            ),Row(children: [
              buildbutton('.'),
              buildbutton('0'),
              buildbutton('00'),
              buildbutton('+'),

            ],


            ),
            Row(children: [
              buildbutton("CLEAR"),
              buildbutton('='),


             ],)],)



        ]
        )

    ));






  }
}
