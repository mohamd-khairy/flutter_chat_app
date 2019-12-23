import 'package:firt_flutter_app/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {

  @override
  LoginPageState createState() => LoginPageState();
}
  
class LoginPageState extends  State<LoginPage> {
    
    read() async{
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value= prefs.get(key) ?? 0;
      if(value != '0'){
        Navigator.pushReplacementNamed(context, '/chat');
      }
    }
    
    @override
    initState(){
      read();
    }

    Api api = new Api();

    String msgStatus = " ";

    final TextEditingController _emailController = new TextEditingController();
    final TextEditingController _passwordController = new TextEditingController();

    _onPressed(){
      setState(() {
        if(_emailController.text.trim().toLowerCase().isNotEmpty && _passwordController.text.trim().isNotEmpty){
          api.login(_emailController.text.trim().toLowerCase(),  _passwordController.text.trim()).whenComplete((){
            if(api.status != 200){
              _showDialog();
            }else{
              Navigator.pushReplacementNamed(context, '/chat');
              api.users();
            }
          });
        }
      });
    }

    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Login',
        home: Scaffold(
          appBar: AppBar(
            title: Text('login'),
          ),
          body: Container(
            child: ListView(
              padding: const EdgeInsets.only(top:62,left:12.0,right:12.0,bottom:12.0),
              children: <Widget>[
                Container(
                  height: 50.0,
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'email',
                      hintText: 'please input your valid email address',
                      icon: Icon(Icons.email)
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  child: TextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'password',
                      hintText: 'please input your valid email password',
                      icon: Icon(Icons.vpn_key)
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top:44.0),),
                Container(
                  height: 50,
                  child:  RaisedButton(
                    onPressed: _onPressed,
                    color: Colors.blue,
                    child:  Text('Login' , style:  TextStyle(color: Colors.white , backgroundColor: Colors.blue),),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    }

      // user defined function
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Failed"),
          content: new Text("email or password is wrong"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  }

  

