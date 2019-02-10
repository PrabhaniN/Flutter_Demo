import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: 'Navigation',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Click Here'),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute())
              );
            }
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Go Back'),
            onPressed: (){
              Navigator.pop(context);
            },
        ),
      ),
    );
  }
}