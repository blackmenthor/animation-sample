import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isClicked = false;

  void _incrementCounter() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  final duration = Duration(milliseconds: 1500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: AnimatedContainer(
                height: isClicked ? 200.0 : 100.0,
                width: isClicked ? 200.0 : 100.0,
                decoration: BoxDecoration(
                  color: isClicked ? Colors.blue : Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(
                    isClicked ? 48.0 : 0.0,
                  ),
                ),
                duration: duration,
              ),
            ),
            AnimatedPositioned(
              left: 16.0,
              bottom:
                  isClicked ? MediaQuery.of(context).size.height * 0.75 : 16.0,
              child: Icon(
                Icons.arrow_upward,
                size: 48.0,
                color: isClicked ? Colors.blue : Colors.blueAccent,
              ),
              duration: duration,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
