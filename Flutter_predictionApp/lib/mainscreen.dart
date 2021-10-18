import 'package:flutter/material.dart';
import 'predModel.dart';
class MainScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MainScreen"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Go to predmodle"),
          onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>PredModel()));
          },

        )
        



      ),
    );
  }
}
