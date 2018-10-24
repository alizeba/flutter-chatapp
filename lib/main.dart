import 'package:chatapp/chatscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: new ThemeData(
         primarySwatch: Colors.cyan,
      ),
      home: MyChatApp(),
    ));

class MyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: new AppBar(
       title: new Center( child: new Text('Frenzy Chat App', style: new TextStyle( color: Colors.white),)),
    ),
    body: new ChatScreen() );
  }
}