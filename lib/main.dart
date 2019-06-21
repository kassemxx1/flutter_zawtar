import 'package:flutter/material.dart';
import 'Item_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final _firestore = Firestore.instance;
void main() {
  return runApp(MaterialApp(
    home: zawtar(),
  ));
}

class zawtar extends StatefulWidget {
  @override
  _zawtarState createState() => _zawtarState();
}

class _zawtarState extends State<zawtar> {

  List<newss> newsList = [];
  List<Widget> items;
  bool jjj = true;
  Map<String, dynamic> nnn = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

//  Widget getlistview(){
//    getMessages();
//    var listview = ListView.builder(itemBuilder: (context,index){
//      return
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ZAWTAR',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      drawer: Drawer(),
     body:  Column(
       children: <Widget>[
         MessagesStream(),
       ],
     )
    );
  }
}
class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('news').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data.documents;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final messageText = message.data['title'];
            final messageSender = message.data['details'];
            final messageTime = message.data['imagename'];
            final messageBubble =
            MessageBubble(messageSender, messageText,messageTime);

            messageBubbles.insert(messageBubbles.length, messageBubble);

          }
          return Expanded(
            child: ListView(

              reverse: true,
              padding: EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 20.0),
              children: messageBubbles,
            ),
          );
        }
      },
    );
  }
}
class MessageBubble extends StatelessWidget {
  MessageBubble(this.title, this.details, this.imagename);

  final String title;
  final String details;
  final String imagename;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                height: 98.0,
                  width: 150.0,
                  child: Image.network(imagename,fit: BoxFit.fill,)),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                child:Text(title,
                  style: TextStyle(
                    fontSize: 5.0,

                  ),

                )
              ),


            ],
          ),
        ),
      ),
    );
  }
}