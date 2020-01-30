import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Account')

      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Nadika'),
              accountEmail:  Text('nadikapoudel16@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:   NetworkImage(' http://randomavatar.com/avatar/929128013'),
             ) ,
            ),

            ListView(
            scrollDirection: Axis.horizontal,
            children : <Widget>[
              Container(
                width: 160.0,
                color: Colors.blue,
                child: Text('Downloads'),
                ),
              Divider(),
              
              Container(
                width: 160.0,
                color: Colors.blue,
                child: Text('Sign Out'),
                ),

              
                 

                
            ]


          )     
           
          ],
        )
        
        ,)
      
    );
  }
}