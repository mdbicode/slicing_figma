import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            Container(
                child: const Padding(
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

            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text('Continue Podcast', textAlign: TextAlign.left),
              )
            ),
           

          ],
        ),
      ));
  }
}
