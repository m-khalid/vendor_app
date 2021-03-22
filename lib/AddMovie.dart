import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMovie extends StatefulWidget{
  @override
  _AddMovie createState() => _AddMovie();
}

class _AddMovie extends State<AddMovie> {
    void initState()
  {
    super.initState();
  }


  final _formkey = GlobalKey<FormState>();

  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _descritioncontroller = TextEditingController();
  TextEditingController _imgcontroller = TextEditingController();
  TextEditingController _timecontroller = TextEditingController();
  


  @override
  void dispose()
  {
   _titlecontroller.dispose();
   _descritioncontroller.dispose();
   _imgcontroller.dispose();
   _timecontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.amber[800],
    resizeToAvoidBottomPadding: false ,

      appBar: AppBar(
        title: Text('Add Movie'),
          backgroundColor: Colors.white10,

      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _titlecontroller,
                  decoration: InputDecoration(
                    hintText: 'Title',
                     hintStyle: TextStyle( color: Colors.white),

                  ),

                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _descritioncontroller,
                  decoration: InputDecoration(
                    hintText: 'Description',
                     hintStyle: TextStyle( color: Colors.white),
                  ),
                 
                ),
                 SizedBox(
                  height: 20,
                ),
                  TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _imgcontroller,
                  decoration: InputDecoration(
                    hintText: 'Image',
                     hintStyle: TextStyle( color: Colors.white),
                  ),                 
                ),
                SizedBox(
                  height: 20,
                ),
 
               TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _timecontroller,
                  decoration: InputDecoration(
                    hintText: 'Time',
                     hintStyle: TextStyle( color: Colors.white),
                  ),                 
                ),
                SizedBox(
                  height: 40
                ),
                RaisedButton(
                  color: Colors.grey[350],
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text('Add',style: TextStyle(color: Colors.black),),
                  onPressed: () async{

                    List<int> myList = List.filled(47, 0);
                  final Firestore _firestore = Firestore.instance;
                   _firestore.collection("Movies").document().setData({
                  'title': _titlecontroller.text,
                  'description': _descritioncontroller.text,
                  'image': _imgcontroller.text,
                  'time': _timecontroller.text,
                  'seats':myList,
            });
                    }    
                )
              ],
            )
        ),
      ),
    );
  }

}