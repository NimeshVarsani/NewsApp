import 'package:flutter/material.dart';
import '../Detail_screen.dart';
import '../news_card.dart';
import 'networking.dart';

class FutureBuilderListView extends StatelessWidget {

  String? url;
  FutureBuilderListView(this.url);

  NetworkHelper networkHelper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: networkHelper.fetchNews(url!),
      builder: (context, snapshot){
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                var image = snapshot.data![index]['imageUrl'];
                var title = snapshot.data![index]['title'];
                var readMoreUrl = snapshot.data![index]['readMoreUrl'];
                var date = snapshot.data![index]['date'];
                return GestureDetector(
                    onTap: (){
                      print(readMoreUrl);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(readMoreUrl)));
                    },
                    child: NewsCard(title, image, date, readMoreUrl)
                );
              }
          );
        }
        else if (snapshot.hasError) {
          return const Center(child: Text('Check your Internet connection and Try again!'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
    //
  }
}
