import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';


class NewsCard extends StatefulWidget {

  NewsCard(this.title, this.image, this.date, this.readMoreUrl);
  String title;
  String image;
  String date;
  String readMoreUrl;

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {

  //have to create for sharing purpose
  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(widget.readMoreUrl,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(20)),
              child: Image.network(widget.image),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10,right: 10),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(widget.title, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500, fontSize: 20),),
              ),
            ),
            ListTile(
              title: Text(widget.date),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.heart_broken_rounded, color: Colors.black,)),
                  IconButton(
                      onPressed: (){
                        _onShare(context);
                        },
                      icon: Icon(Icons.share, color: Colors.black,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.block, color: Colors.black,)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
