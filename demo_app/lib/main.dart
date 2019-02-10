import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: 'Chat App',
    home: ChatScreen(),
  ));
}

class ChatScreen extends StatefulWidget{
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>{
  final TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: _buildTextComposer(),
    );
  }
  Widget _buildTextComposer(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: _textEditingController,
        onSubmitted: _handleSubmitted,
        decoration: InputDecoration.collapsed(
          hintText: "Send Message"
        ),
      ),
    );
  }
  void _handleSubmitted(String text){
    _textEditingController.clear();
  }
}
  // Widget build(BuildContext context) {
    // return Scaffold(
      // appBar: new AppBar(
        // title: new Text('Chat App'),
      // ),
      // body: Center(
        // child: RaisedButton(
            // child: Text('Click Here'),
            // onPressed: (){
              // Navigator.push(
                  // context,
                  // MaterialPageRoute(builder: (context) => SecondRoute())
              // );
            // }
        // ),
      // ),
      // drawer: Drawer(
        // child: ListView(
          // padding: EdgeInsets.zero,
          // children: <Widget>[
            // DrawerHeader(
              // child: Text("Drawer Header"),
              // decoration: BoxDecoration(
                // color: Colors.blue
              // ),
            // ),
            // ListTile(
              // title: Text("First Page"),
              // onTap: (){
                // Navigator.pop(context);
              // },
            // ),
            // ListTile(
              // title: Text("Second Page"),
              // onTap: (){
                // Navigator.push(
                  // context, 
                  // MaterialPageRoute(builder: (context) => SecondRoute()),
                // );
              // },
            // )
          // ],
        // ),
      // ),
    // );
  // }
// }

// class SecondRoute extends StatelessWidget{
  // @override
  // Widget build(BuildContext context) {
    // return Scaffold(
      // appBar: AppBar(
        // title: Text('Second Page'),
      // ),
      // body: Column(
        // children: <Widget>[
          // Image(
            // image: AssetImage('Images/flutter.jpeg'),
            // width: 600.0,
            // height: 350.0,
          // ),
          // RaisedButton(
            // child: Text('Go Back'),
            // onPressed: (){
              // Navigator.pop(context);
            // },
          // ),
        // ],
      // ),
    // );
  // }
// }