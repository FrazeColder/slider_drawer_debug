import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var useSafeArea = false;

    return Scaffold(
      body: SliderDrawer(
        slider: Container(color: Colors.red),
        appBar: const SliderAppBar(
          title: Text('Hello World'),
          isTitleCenter: true,
        ),
        child: useSafeArea ? SafeArea(child: getContent()) : getContent(),
      ),
    );
  }

  Scaffold getContent() {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 45,
            color: Colors.grey,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    print("Pressed Plus Button!");
                    incrementCounter();
                  },
                  child: Container(
                    color: Colors.green,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Plus +")],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("Pressed Minus Button!");
                    decrementCounter();
                  },
                  child: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Minus +")],
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                _counter.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
