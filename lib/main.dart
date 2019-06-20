import 'package:flutter/material.dart';
import 'Item_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main(){
  return runApp(MaterialApp(
    home: zawtar(),
  ));

}
class zawtar extends StatefulWidget {
  @override
  _zawtarState createState() => _zawtarState();
}

class _zawtarState extends State<zawtar> {
  final _firestore=Firestore.instance;
  List<news> newsList= [];
  List<Widget> items ;
  Map<String,dynamic> nnn ={};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  void getdata() async{
    final data = await _firestore.collection('news').getDocuments();
    for(var dataa in data.documents){
      nnn.addAll(dataa.data);

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ZAWTAR',style: TextStyle(color: Colors.white),),backgroundColor: Colors.lightBlue, ),
      drawer: Drawer(

      ),

    );
  }
}

