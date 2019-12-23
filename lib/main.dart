import 'package:firt_flutter_app/api.dart';
import 'package:firt_flutter_app/widgets/chat.dart';
import 'package:firt_flutter_app/widgets/login.dart';
import 'package:flutter/material.dart';

void main()
{
  Api api = new Api();
  runApp(MYApp());
}

class MYApp extends StatefulWidget {
  @override
  _MYAppState createState() => _MYAppState();
}

class _MYAppState extends State<MYApp> {

      
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String,WidgetBuilder>{
        '/chat' : (BuildContext context) => new ChatPage(),
        '/login' : (BuildContext context) => new LoginPage(),
        // '/register' : (BuildContext context) => new RegisterPage(title:"flutter App"),
      },
      home: LoginPage(),
    );  
  }
}
