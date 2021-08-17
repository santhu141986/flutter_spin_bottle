import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Game Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var lastPosition = 0.0;
  var random = new Random();
  late AnimationController animationController;

  double getRandomNumber() {
    lastPosition = random.nextDouble();
    return random.nextDouble();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animationController.forward();
  }

  spinTheBottle() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              child: RotationTransition(
                turns: Tween(begin: lastPosition, end: getRandomNumber())
                    .animate(new CurvedAnimation(
                        parent: animationController, curve: Curves.linear)),
                child: GestureDetector(
                  onTap: () {
                    if (animationController.isCompleted) {
                      setState(() {
                        spinTheBottle();
                      });
                    }
                  },
                  child: Image.asset('lib/assets/Bouteille.jpg'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
