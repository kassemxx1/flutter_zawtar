import 'package:flutter/material.dart';
import 'Item_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'detailScreen.dart';
final _firestore = Firestore.instance;
String titlee;
String imagenamee;
String detailss;
List<MessageBubble> messageBubbles = [];
List<String> picsList;
List<String> nnnn=['1.png'];
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
    messageBubbles.clear();
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('news').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data.documents;

          for (var message in messages) {
            final titletext = message.data['title'];
            final detailtext = message.data['details'];
            final imagennametext = message.data['imagename'];
            final List listImage = message.data['pics'];
            print(listImage);
            if(listImage != null) {
              final messageBubble =
              MessageBubble(titletext, detailtext, imagennametext, listImage);
              messageBubbles.insert(messageBubbles.length, messageBubble);
            }
            else{
              final messageBubble =MessageBubble(titletext, detailtext, imagennametext,nnnn );
              messageBubbles.insert(messageBubbles.length, messageBubble);

            }

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
  MessageBubble(this.title, this.details, this.imagename,this.pics);

  final String title;
  final String details;
  final String imagename;
  final List pics;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: MaterialButton(
        onPressed: (){
         Navigator.push(context,
           MaterialPageRoute(builder: (context){
             return detailscreen();
           })
          );
          titlee=title;
          imagenamee=imagename;
          detailss=details;
          picsList=pics;
          
          print('sdaffdfsdfsdfsdf$picsList');
        },
        child: Container(
          height: 100.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 98.0,
                    width: 100.0,
                    child: Image.network(imagename,fit: BoxFit.fill,)),
                Expanded(
                  child: Text(title,
                    maxLines: 3,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,




                    ),



                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

