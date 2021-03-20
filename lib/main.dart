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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation val;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
      lowerBound: 0.05,
      upperBound: 0.75,
    );
    val = Tween(begin: 0, end: 0.75).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    animationController?.dispose();
  }

  void _incrementCounter() {
    if (animationController.isAnimating) {
      animationController.stop(canceled: false);
    } else {
      animationController.repeat();
    }
  }

  final duration = Duration(milliseconds: 1500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: val,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
              ),
            ),
            builder: (_, child) {
              final value = val.value;
              final height = MediaQuery.of(context).size.height;
              final width = MediaQuery.of(context).size.width;
              var top = (value * height);
              final right = (value * width);
              return Positioned(
                top: top,
                right: right,
                child: child,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
