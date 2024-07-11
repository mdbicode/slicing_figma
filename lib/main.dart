import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slicing_figma/api/app_write.dart';

void main() {
  AppWrite.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
        ),
      debugShowCheckedModeBanner: false,
      title: 'ILMI CAST',
      home: const MyHomePage(title: 'ILMI CAST'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      _favorite(title: widget.title),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.headphones),
                  label: 'Headphones',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'People',
                ),
              ],
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: false,
              showSelectedLabels:false,
            ),
          ),
        )
      )
]);
  }
}

Widget _favorite({required String title}){
  return FutureBuilder<Map<String, dynamic>?>(
    future: AppWrite.getMusic(), // Fetch data asynchronously
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          // Data fetched successfully, display it
          final musicData = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              primary: false,
              title: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.notifications_rounded,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            body: DefaultTextStyle.merge(
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 60),
                child: Column(
                  children: <Widget>[
                    // Title for Music section
                    _titleText(title: 'Music'),

                    _buildListItem(
                          title: musicData['title'],
                          username: musicData['name'],
                          duration: musicData['duration'],
                          image: musicData['image'],
                        )
                      ,
                    
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(child: Text('No data available'));
        }
      }
    },
  );
}

Widget _home({required String title}){
  return Scaffold(
      appBar: AppBar(
        primary: false,
        title: Text(title,style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        actions: <Widget> [
          IconButton(
            icon: const Icon(
              Icons.notifications_rounded,
              size: 30.0,
              color: Colors.black,
              ),
            onPressed: (){},
          ),
        ]
      ),
      body: DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ), 
        child: 
        SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 60),
          child: Column(
          children: [
            // Search Bar
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  hintText: 'Search the podcast here',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            // Promoted Podcast
            _titleText(title: 'Promoted Podcast'),
            // Promoted Podcast List
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildListPromoted(image: 'images/promoted1.png'),
                  _buildListPromoted(image: 'images/promoted2.png'),
                  _buildListPromoted(image: 'images/promoted3.png'),
                ],
              ),
            ),
            // Trending Podcasts
            _titleText(title: 'Trending Podcast'),
            // Trending Podcasts List
            Column(
              children: <Widget>[
               _buildListItem(
                  title: 'Denny Sumargo',
                  username: '@curhatbang',
                  duration: '42 Minutes',
                  image:'images/dennysumargo.jpg'
                ),
                _buildListItem(
                  title: 'Close of the Door',
                  username: '@corbuzier',
                  duration: '43 Minutes',
                  image:'images/cotd.jpeg'
                ),
                _buildListItem(
                  title: 'Raditya Dika',
                  username: '@radityadika',
                  duration: '70 Minutes',
                  image:'images/raditya.jpg'
                ),
              ],
            ),
            // Continue Podcast
            _titleText(title: 'Continue Podcast'),
            // Continue Podcast List
            Column(
              children: <Widget>[
                _buildListItem(
                  title: 'Denny Sumargo',
                  username: '@curhatbang',
                  duration: '42 Minutes',
                  image:'images/dennysumargo.jpg'
                ),
                _buildListItem(
                  title: 'Vindes',
                  username: '@vindes',
                  duration: '30 Minutes',
                  image:'images/vindes.jpg'
                ),
                _buildListItem(
                  title: 'Raditya Dika',
                  username: '@radityadika',
                  duration: '70 Minutes',
                  image:'images/raditya.jpg'
                ),
              ],
            ),
            // Top Categories
            _titleText(title: 'Top Categories'),
            // Top Categories List
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildListCategory(title: 'Music' , image: 'images/category_music.jpg'),
                  _buildListCategory(title: 'Artist', image: 'images/category_artist.jpg'),
                  _buildListCategory(title: 'News', image: 'images/category_news.png'),
                ],
              ),
            ),
            
          ],
          ))));
}



Widget _titleText({required String title}){
  return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Text(title, textAlign: TextAlign.left),
        ),
      );
}

Widget _buildListPromoted({required String image}){
  return Padding(
              padding: const EdgeInsets.only(right: 10 ,left: 10),
              child: Container(
                width: 300,
                child: Image.asset(image),
              ),
            );
}

Widget _buildListCategory({required String title, required String image}){
  return Padding(
              padding: const EdgeInsets.only(right: 10 ,left: 10),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 120,
                    child: Image.asset(image),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(title, textAlign: TextAlign.left),
                  ),
                ],
              ),
            );
}

Widget _buildListItem({required String title, required String username, required String duration, required String image}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      // Image
      Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          width: 100,
          height: 100,
          child: Image.network(image)
        ),
      ),
      // Title n Desc
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              username,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            Text(
              duration,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      // Play
      Container(
        padding: const EdgeInsets.only(right: 40),
        child: const Icon(Icons.play_circle_fill, size: 50),
      ),
    ],
  );
}