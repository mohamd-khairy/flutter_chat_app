
import 'package:firt_flutter_app/api.dart';
import 'package:flutter/material.dart';

class RecentContact extends StatefulWidget {
  @override
  _RecentContactState createState() => _RecentContactState();
}

class _RecentContactState extends State<RecentContact> {
  Api api = new Api();


  @override
  initState() {
   // super.initState();
    // Map users = api.users();
    //   // users.map((item) => print(item['name']) ).toList();
    // print(users[0]['name']);
  }

  

    
      
    

  final List<String> favoritesName = ['Mohamed','Ahmed','Ali' ,'tarek','aya','sara','khaled'];
  final List<String> favoritesImg = ['assets/images/1.jpg','assets/images/1.jpg','assets/images/1.jpg','assets/images/1.jpg','assets/images/1.jpg','assets/images/1.jpg','assets/images/1.jpg'];

        

  @override
  Widget build(BuildContext context) {
    return  Expanded(
              child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)
                )
              ),
              child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)
                    ),
                    child:  FutureBuilder<List>(builder: (context,snapshot){
                      if(snapshot.hasError) print(snapshot.error);
                              return snapshot.hasData? ItemList(list:snapshot.data):
                                Center( child: CircularProgressIndicator(),);
                              },
                      future: api.users(),
                    )
              )
            ),
          );
        }
      }
                                  
      class ItemList  extends StatelessWidget {
          List list;
          ItemList({this.list});
          @override
          Widget build(BuildContext context) {
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context , int index){
                    return Container(
                      margin: EdgeInsets.only(top: 5.0 , bottom: 5.0 , right: 20.0),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFEFEE),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)
                          ),
                        ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children:<Widget>[
                              CircleAvatar(
                                radius: 35.0,
                                backgroundImage: AssetImage('assets/images/1.jpg'),
                              ),
                              SizedBox(width: 10.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:<Widget>[
                                    Text(
                                      list[index]['name'],
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      child: Text(
                                        list[index]['roleNameAr'],
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600
                                          ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                ],), 
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("time",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 5.0),
                              Container(
                                width: 40.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30.0)
                                ),
                                alignment: Alignment.center,
                                child: Text("new",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }
              );
          }
      }