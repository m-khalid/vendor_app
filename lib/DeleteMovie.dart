import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class DeleteMovies extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
       // title: Text(' Screen'),
      backgroundColor: Colors.amber,
      ),
        backgroundColor: Colors.amber[800],

      body: StreamBuilder(
        
        stream: Firestore.instance.collection('Movies').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData) return Text('Loading');
          switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView (
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
  onTap: () async{
    Firestore.instance.collection('Movies').document(document.documentID).delete().then((onValue){
                    });},
                  title: Text('title:'+document['title'],style: TextStyle(fontSize:30 ),),
                  subtitle: Text('time:'+document['time'],style:TextStyle(fontSize:25 )),
                  
                  
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}