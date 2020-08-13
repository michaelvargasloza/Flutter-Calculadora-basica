import 'package:flutter/material.dart';

void main() {
  runApp(new MyCalculatorApp());
}

class MyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Basica',
      //Retira etiqueta debug
      debugShowCheckedModeBanner: false,
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Calculator();
}

class Calculator extends State<MyCalculator> {
  final controller_numberA = TextEditingController();
  final controller_numberB = TextEditingController();

  final my_form_key = GlobalKey<FormState>();

  String textToShow = "";

  //Funciones
  void suma(){
    if(my_form_key.currentState.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);

      int result = numberA + numberB;
      setState(() {
        textToShow = "$numberA + $numberB = $result";
      });
    }
  }

  void resta(){
    if(my_form_key.currentState.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);

      int result = numberA - numberB;
      setState(() {
        textToShow = "$numberA - $numberB = $result";
      });
    }
  }

  void multi(){
    if(my_form_key.currentState.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);

      int result = numberA * numberB;
      setState(() {
        textToShow = "$numberA * $numberB = $result";
      });
    }
  }

  void divi(){
    if(my_form_key.currentState.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);

      double result = numberA / numberB;
      setState(() {
        textToShow = "$numberA / $numberB = $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Crear Layout
    return new Scaffold(body: Form(key: my_form_key, child:
      Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: controller_numberA,
            validator: (value){
              if(value.isEmpty) return "Por favor introduce el primer numero";
            },
            decoration: InputDecoration(hintText: "Ingresa el primer numero", contentPadding: EdgeInsets.all(5),),
            keyboardType: TextInputType.text,
          ),

          TextFormField(
            controller: controller_numberB,
            validator: (value){
              if(value.isEmpty) return "Por favor introduce el segundo numero";
            },
            decoration: InputDecoration(hintText: "Ingresa el segundo numero", contentPadding: EdgeInsets.all(5),),
            keyboardType: TextInputType.text,
          ),

          Text(textToShow, style: TextStyle(fontSize: 20.0)),
          //Botones
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            RaisedButton(onPressed: suma, child: Text('+'),),
            RaisedButton(onPressed: resta, child: Text('-'),),
            RaisedButton(onPressed: multi, child: Text('*'),),
            RaisedButton(onPressed: divi, child: Text('/'),),
          ],)
        ],)
      ,)
      ,);
  }

}