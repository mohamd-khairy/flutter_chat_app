
import 'package:flutter/material.dart';

class FavoriteContact extends StatefulWidget {
  @override
  _FavoriteContactState createState() => _FavoriteContactState();
}

class _FavoriteContactState extends State<FavoriteContact> {

    final List<String> favoritesName = ['Mohamed','Ahmed','Ali'];
    final List<String> favoritesImg = ['assets/images/1.jpg','assets/images/3.png','assets/images/4.png'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  Text('favorite contact',
                    style: TextStyle(color: Colors.blueGrey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                    ),
                  ),
                  IconButton(
                    icon: Icon( Icons.more_horiz),
                    iconSize: 30.0,
                    color: Colors.blueGrey,
                    onPressed: (){},
                  ),
              ],
            ),
        ),
        Container(
          height: 120.0,
          // color: Theme.of(context).primaryColor,
          child:
          ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 10.0),
            itemCount: favoritesName.length,
            itemBuilder: (BuildContext context , int index){
              return Padding(
                padding:  EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage("assets/images/1.jpg"),
                    ),
                    // SizedBox(height: 6.0,),
                    Text(favoritesName[index] , style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}