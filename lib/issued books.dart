import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          
          crossAxisCount: 2,
          scrollDirection: Axis.horizontal,
          
          children: List.generate(7, (index) {
            return Center(
              child: Text(
                'Item $index',
                 
                
                var now = new DateTime.now();
                var final = now.add(new Duration(days: 90));
            
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
        ),
      ),
    );
  }
}