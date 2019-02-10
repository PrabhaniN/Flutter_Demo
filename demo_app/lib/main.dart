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

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textEditingController = new TextEditingController();
  bool _isComposing = false;
  @override
  void dispose(){
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 1.0,),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor
            ),
            child: _buildTextComposer(),
          )
        ],
      ),

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
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
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
                onPressed: _isComposing
                ? () => _handleSubmitted(_textEditingController.text)
                : null,
              ),
            ),
          ],
        ),
      )
    );
  }
  void _handleSubmitted(String text){
    _textEditingController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 400),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
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

const String _name = "Your Name";

class ChatMessage extends StatelessWidget{
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context){
    return SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController, curve: Curves.easeOut
      ),
      axisAlignment: 0.0,
      child: new Container(
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
      ),
    );
  }
}