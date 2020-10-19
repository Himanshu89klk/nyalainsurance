import 'package:flutter/material.dart';

class PressureSensor extends StatefulWidget {
   //final String uname;

// Receiving Email using Constructor.
//PressureSensor({Key key, @required this.uname}) : super(key: key);
  @override
  PressureSensorPage createState() => PressureSensorPage();
}


class PressureSensorPage extends State<PressureSensor> {

  bool _tapInProgress;

  PressureSensorPage() {
    _tapInProgress = false;
  }

  void _tapDown(TapDownDetails details) {
    setState(() {
      _tapInProgress = true;
    });
  }

  void _tapUp(TapUpDetails details) {
    setState(() {
      _tapInProgress = false;
    });
  }

  void _tapCancel() {
    setState(() {
      _tapInProgress = false;
    });
  }

  void _onTap() {
    
  }

  @override
  Widget build(BuildContext context) {
    Widget redSection = new GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTap: _onTap,
      onTapCancel: _tapCancel,
      child: new Container(
        color: _tapInProgress? Colors.yellow:Colors.red,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text("Launch Search"),
            new IconButton(
              icon: new Icon(Icons.search),
              onPressed: null,
            ),
            new Text(
                "Tapping this screem, 0 icon, or the title to perform test"),
          ],
        ),
      ),
    );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Gesture Detector"),
        backgroundColor: Colors.green,
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
        child: redSection,
      ),
    );
  }


}