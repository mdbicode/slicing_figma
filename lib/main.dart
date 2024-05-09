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
        child: Column(
          children: [
            // Search Bar
            const Padding(
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
            child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0) )
              ),
              hintText: 'Search the podcast here',
              prefixIcon: Icon(Icons.search)
              ),
            ),
                          ),
            // Promoted Podcast
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text('Promoted Podcast', textAlign: TextAlign.left),
              )
              ),
            SizedBox(
            height: 200,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
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
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text('Trending Podcast', textAlign: TextAlign.left),
              )
              ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Image
                    const Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child:  SizedBox(
                          width: 100,
                          height: 100,
                          child: ColoredBox(color: Colors.grey)
                        ),),
                    // Title n Desc
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Denny Sumargo',
                        style: TextStyle(fontSize: 14),
                        ),
                        Text('@curhatbang',
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                        ),
                        Text('21 Min',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                      ],
                    ),
                    // Play
                    Container(
                      padding: EdgeInsets.only(right: 40),
                      child: Icon(Icons.play_circle_fill,size: 50),
                    )
                  ],
                )
              ],
              
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text('Continue Podcast', textAlign: TextAlign.left),
              )
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Image
                    const Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child:  SizedBox(
                          width: 100,
                          height: 100,
                          child: ColoredBox(color: Colors.grey)
                        ),),
                    // Title n Desc
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Denny Sumargo',
                        style: TextStyle(fontSize: 14),
                        ),
                        Text('@curhatbang',
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                        ),
                        Text('21 Min',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                      ],
                    ),
                    // Play
                    Container(
                      padding: EdgeInsets.only(right: 40),
                      child: Icon(Icons.play_circle_fill,size: 50),
                    )
                  ],
                )
              ],
              
            ),


          ],
        ),
      ));
  }
}
