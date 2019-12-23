import 'package:firt_flutter_app/widgets/category_selector.dart';
import 'package:firt_flutter_app/widgets/favorite_contact.dart';
import 'package:firt_flutter_app/widgets/login.dart';
import 'package:firt_flutter_app/widgets/recent_contact.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {

  @override
  ChatPageState createState() => ChatPageState();
}
  
class ChatPageState extends  State<ChatPage> {

    _save(String token) async{
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value = token;
      prefs.setString(key, value);
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat',
      home: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () =>{},
              ),
              title: Center(
                child: Text(
                  'Chats',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.cancel),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: (){
                    _save('0');
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder:(BuildContext context) => new LoginPage()
                      )
                    );
                    },
                ),
              ]
          ),
          body:  Column(
            children: <Widget>[
              CategorySelector(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)
                    )
                  ),
                  child: Column(
                    children: <Widget>[
                      FavoriteContact(),
                      RecentContact()
                    ],
                  ),
                ),
              )
            ], 
          )
      )
    );
  }
}
