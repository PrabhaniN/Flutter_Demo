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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: _buildTextComposer(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer Header"),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              title: Text("First Page"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Second Page"),
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            )
          ],
    ),
  ),
    );
  }
  Widget _buildTextComposer(){
    return IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: "Send Message"
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textEditingController.text),
              ),
            ),
          ],
        ),
      )
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
    // );
  // }
// }

class SecondRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Column(
        children: <Widget>[
          Image(
            image: AssetImage('Images/flutter.jpeg'),
            width: 600.0,
            height: 350.0,
          ),
          RaisedButton(
            child: Text('Go Back'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget{
  ChatMessage({this.text});
  final String text;
  @override
  Widget build(BuildContext context){
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(child: new Text(_name[0])),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: EdgeInsets.only(top: 5.0),
                child: new Text(text),
              )
            ],
          )
        ],
      ),
    );
  }
}

const String _name = "Your Name";