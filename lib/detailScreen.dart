import 'package:flutter/material.dart';
import 'main.dart';
List<Widget> iiii;
List<ImageBubble> imageBubbles = [];
class detailscreen extends StatefulWidget {
  @override
  _detailscreenState createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  @override

void initState() {
    // TODO: implement initState
    super.initState();
    print(picsList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zawtar'),),
      body: ListView(
        children: <Widget>[
          Image.network(imagenamee),
          Text(titlee,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0
          ),),
          Text(detailss,
            style: TextStyle(

                fontSize: 20.0
            ),),
         ImagesStream(),

        ],
      ),
    );
  }


}
class ImageBubble extends StatelessWidget {
  ImageBubble( this.imagename);
  final String imagename;
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
        },
        child: Image.network(imagename),
      )
    );
  }
}
class ImagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    for(var i in picsList){
      final imageBubble = ImageBubble(i);
      imageBubbles.insert(0, imageBubble);
    }
    return Expanded(
      child: ListView(


        reverse: true,
        padding: EdgeInsets.symmetric(
            horizontal: 10.0, vertical: 20.0),
        children: imageBubbles,


      ),
    );
  }
}

