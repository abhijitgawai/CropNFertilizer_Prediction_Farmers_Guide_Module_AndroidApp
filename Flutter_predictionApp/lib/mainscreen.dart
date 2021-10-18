import 'package:flutter/material.dart';
import 'predModel.dart';
import 'fertilizer.dart';

class MainScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MainScreen"),
      ),
      body: Row(
        children: [
          RaisedButton(
            child: Text("Go to Crop Prediction"),
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=>PredModel()));
            },

          ),
          RaisedButton(
            child: Text("Go to Fertilizer Prediction"),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Fertilizer()));
            },

          ),
        ],
      ),

    );
  }
}
