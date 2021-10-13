import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
//import 'dart:math';
//import 'package:math_expressions/math_expressions.dart';

class PredModel extends StatefulWidget {
  @override
  _PredModelState createState() => _PredModelState();
}

class _PredModelState extends State<PredModel> {
  var predValue = "";
  @override
  void initState() {
    super.initState();
    predValue = "click predict button";
  }
  final N_Controller = TextEditingController();

  Future<void> predData(  ) async { //String strr
    final interpreter = await Interpreter.fromAsset('ml_model.tflite');
    var input = [
      [90.0,42.0,43.0,20.0,82.0,6.0,202.0]
    ];

    //print(strr);

    print('THis is controllers input');
    print(  N_Controller.text + ' N_Controller.text');

    var output = List.filled(22, 0).reshape([1, 22]);
    interpreter.run(input, output);
    //print(output);
    print(output[0]);
    print(output[0][0]);
    //print(output[0].reduce(max));

    var  x=0;
    var  maax=output[0][0];
    var index=0;
    for(x;x<22;x++)
      {
        if (output[0][x]>maax)
          {
            maax=output[0][x];
            index=x;
          }
      }
    print(maax);
    print(index);

    this.setState(() {
      //predValue = "abhi";//index.toString();//output[0][0].toString();
      if (index==0)
        predValue='Apple';
      if (index==1)
          predValue='Banana';
      if (index==2)
        predValue='Black Gram';
      if (index==3)
        predValue='Chickapea';
      if (index==4)
        predValue='Coconut';
      if (index==5)
        predValue='Coffee';
      if (index==6)
        predValue='Cotton';
      if (index==7)
        predValue='Grapes';
      if (index==8)
        predValue='Jute';
      if (index==9)
        predValue='kidneybeans';
      if (index==10)
        predValue='Lentil';
      if (index==11)
        predValue='Maize';
      if (index==12)
        predValue='Mango';
      if (index==13)
        predValue='mothbeans';
      if (index==14)
        predValue='mungbean';
      if (index==15)
        predValue='Muskmelon';
      if (index==16)
        predValue='Orange';
      if (index==17)
        predValue='Papaya';
      if (index==18)
        predValue='pigeonpeas';
      if (index==19)
        predValue='Pomegranate';
      if (index==20)
        predValue='Rice';
      if (index==21)
        predValue='Watermelon';



    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: N_Controller,

              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'PLEASE ENTER YOUR EMAIL',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),

            Text(
              "change the input values in code to get the prediction",
              style: TextStyle(fontSize: 16),
            ),
            Text(N_Controller.text),

            SizedBox(height: 12),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                "predict",
                style: TextStyle(fontSize: 25),
              ),

              onPressed: predData,
              //onPressed: () {
              //  predData( 'abhi' );
              //},

    ),
            SizedBox(height: 12),
            Text(
              "Predicted value :  $predValue ",
              style: TextStyle(color: Colors.red, fontSize: 23),
            ),
          ],
        ),
      ),
    );
  }
}

