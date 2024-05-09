import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
        ),
      debugShowCheckedModeBanner: false,
      title: 'ILMI CAST',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          padding: EdgeInsets.only(bottom: 100),
  child: Column(
  
    children: [
      // Search Bar
      Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
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
            Padding(
              padding: const EdgeInsets.only(right: 10 ,left: 10),
              child: Container(
                width: 300,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: 300,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: 300,
                color: Colors.grey,
              ),
            ),
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
            duration: '21 Minutes',
          ),
          _buildListItem(
            title: 'Close of the Door',
            username: '@corbuzier',
            duration: '17 Minutes',
          ),
          _buildListItem(
            title: 'Raditya Dika',
            username: '@radityadika',
            duration: '43 Minutes',
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
            duration: '21 Min',
          ),
          _buildListItem(
            title: 'Close of the Door',
            username: '@corbuzier',
            duration: '21 Min',
          ),
          _buildListItem(
            title: 'Raditya Dika',
            username: '@radityadika',
            duration: '21 Min',
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
            _buildListCategory(title: 'Music'),
            _buildListCategory(title: 'Artist'),
            _buildListCategory(title: 'News'),
          ],
        ),
      ),
      
    ],
  ),
),
));
  }
}

Widget _titleText({required String title}){
  return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(title, textAlign: TextAlign.left),
        ),
      );
}

Widget _buildListCategory({required String title}){
  return Padding(
              padding: const EdgeInsets.only(right: 10 ,left: 10),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 120,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(title, textAlign: TextAlign.left),
                  ),
                ],
              ),
            );
}

Widget _buildListItem({required String title, required String username, required String duration}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      // Image
      const Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: 100,
          height: 100,
          child: ColoredBox(color: Colors.grey),
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