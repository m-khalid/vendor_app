import 'package:flutter/material.dart';
import 'DeleteMovie.dart';
import 'AddMovie.dart';
import 'Seats.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'vendor',
 
      home: AdminHome(),
    );
  }
}


class AdminHome extends StatelessWidget {
  static String id = 'AdminHome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
          centerTitle: true,
        title: Text('Vendor'),
          backgroundColor: Colors.amber[600],

      ),
    backgroundColor: Colors.amber[800],
      
     body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
             RaisedButton(
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Seats() ) );

            },
            child: Text('View Seats'),
          ),
           SizedBox(
                  height: 20
                ),
          RaisedButton(
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => AddMovie() ) );

            },
            child: Text('Add Product'),
          ),
             SizedBox(
                  height: 20
                ),
                
          RaisedButton(
            onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteMovies() ) );

            },
            child: Text('Delete Product'),
          ),
            
       
        ],
      ),
    );
  }
}