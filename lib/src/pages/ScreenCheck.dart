import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

void main() => runApp(ScreenTest());

class ScreenTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Touch Screen Test',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MyHomePage(title: 'Touch Screen Test'),
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
  String _text;

  @override
  void initState() {
    super.initState();
    _text = 'Swipe me !';
  }

  void _onVerticalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.up) {
        _text = 'Swiped up!';
        print('Swiped up!');
      } else {
        _text = 'Swiped down!';
        print('Swiped down!');
      }
    });
  }

  void _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        _text = 'Swiped left!';
        print('Swiped left!');
      } else {
        _text = 'Swiped right!';
        print('Swiped right!');
      }
    });
  }

  void _onLongPress() {
    setState(() {
      _text = 'Long pressed!';
      print('Long pressed!');
    });
  }

 void _onDoubleTap() {
    setState(() {
      _text = 'Double Tap!';
      print('Double Tapped!');
    });
  }

  void _onTap() {
    setState(() {
      _text = 'Single Tap!';
      print('Single Tapped!');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        
        child: SimpleGestureDetector(
          
          onVerticalSwipe: _onVerticalSwipe,
          onHorizontalSwipe: _onHorizontalSwipe,
          onLongPress: _onLongPress,
          onDoubleTap: _onDoubleTap,
          onTap: _onTap,
          
          swipeConfig: SimpleSwipeConfig(
            verticalThreshold: 40.0,
            horizontalThreshold: 40.0,
            swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
          ),
          child: _buildBox(),
          
        ),
        
      ),
    );
  }

  Widget _buildBox() {
    return Container(
     
      color: Colors.indigo,
      child: Center(
         child: Text(
          _text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}