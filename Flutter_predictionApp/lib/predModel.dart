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

  Future<void> predData() async {
    final interpreter = await Interpreter.fromAsset('ml_model.tflite');
    var input = [
      [90.0,42.0,43.0,20.0,82.0,6.0,202.0]
    ];

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
      if (index==20)
          predValue='Rice';
      //predValue = "abhi";//index.toString();//output[0][0].toString();
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
            Text(
              "change the input values in code to get the prediction",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                "predict",
                style: TextStyle(fontSize: 25),
              ),
              onPressed: predData,
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
