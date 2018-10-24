import 'package:chatapp/chatmessage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
 
   final TextEditingController _t1 = new TextEditingController();
   final List<ChatMessage> _messages = <ChatMessage> [];

    _handleSubmitted(String text) {
        _t1.clear();
        ChatMessage message = new ChatMessage(
          text: text
        );
        setState(() {
                  _messages.insert(0, message);
                });
    }
    Widget _textComposeWidget() {
    return IconTheme(
           data: IconThemeData(
             color: Colors.cyan
           ),
          child: new Container(
       margin: const EdgeInsets.symmetric( horizontal: 8.0),
       child: new Row(
              children: <Widget>[
                new Flexible(
                   child: new TextField(
                decoration: new InputDecoration(
                  hintText: 'Enter Message'
                ),
                controller: _t1,
                onSubmitted: _handleSubmitted,
              )
         ),
         new Container(
           margin: const EdgeInsets.symmetric( horizontal: 4.0),
           child: new IconButton(
             icon: Icon( Icons.send ),
             iconSize: 35.0,
             onPressed: ()=>_handleSubmitted(_t1.text),
           ),
         )
        ],
       ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
       children: <Widget>[
         new Flexible(
           child: new ListView.builder( padding: EdgeInsets.all(8.0) ,reverse: true, itemBuilder: (_, int index)=>_messages[index], itemCount: _messages.length,),
         ),
         new Divider( height: 1.0,),
         new Container(
           decoration: new BoxDecoration(
              color: Theme.of(context).cardColor
           ),
           child: _textComposeWidget()
         ),
    ]
    );
  }
}