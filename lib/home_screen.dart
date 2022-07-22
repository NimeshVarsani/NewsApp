import 'package:assignment_2/services/future_builder_list_view.dart';
import 'package:assignment_2/services/networking.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  NetworkHelper networkHelper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Center(child: Text('Daily Feed', style: TextStyle(color: Colors.black),)),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search))
          ],
        ),
        drawer: Drawer(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40,
                child: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                    color: Colors.black87,

                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,

                  tabs: const [
                    Tab(child: Text('Business')),
                    Tab(child: Text('Startup')),
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Technology')),
                    Tab(child: Text('Automobile')),
                    Tab(child: Text('National')),
                    Tab(child: Text('Politics')),
                    Tab(child: Text('Entertainment')),
                    Tab(child: Text('Science')),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                  children: [
                    FutureBuilderListView('https://inshorts.deta.dev/news?category=business'),
                    FutureBuilderListView('https://inshorts.deta.dev/news?category=startup'),
                    FutureBuilderListView('https://inshorts.deta.dev/news?category=sports'),
                    FutureBuilderListView('https://inshorts.deta.dev/news?category=technology'),
                    FutureBuilderListView('https://inshorts.deta.dev/news?category=automobile'),
                    FutureBuilderListView('https://inshorts.deta.dev/news?category=national'),
                    FutureBuilderListView('https://inshorts.deta.dev/news?category=politics'),
                    FutureBuilderListView('https://inshorts.deta.dev/news?category=entertainment'),
                    FutureBuilderListView('https://inshorts.deta.dev/news?category=science'),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

