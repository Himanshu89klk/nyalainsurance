import 'package:flutter/material.dart';
import 'dart:async';

import 'package:all_sensors/all_sensors.dart';
import 'package:insurance/src/pages/report.dart';
//import 'package:insurance/src/pages/report.dart';

class SnackBarDemo extends StatefulWidget {
  final String uname;
  final String pass;
  final String title;
  final String plan;
  final String mob;
  final String imei, userstate, usercity;
  SnackBarDemo(
      {Key key,
      @required this.mob,
      this.uname,
      this.pass,
      this.title,
      this.plan,
      this.imei,
      this.userstate,
      this.usercity})
      : super(key: key);
  //SnackBarDemo({Key key, this.title}) : super(key: key);

  @override
  CheckUserState createState() =>
      CheckUserState(mob, uname, pass, title, plan, imei, userstate, usercity);
}

class CheckUserState extends State<SnackBarDemo> {
  String uname;
  String pass;
  String title;
  String plan;
  String mob;
  String imei, userstate, usercity;
  CheckUserState(this.mob, this.uname, this.pass, this.title, this.plan,
      this.imei, this.userstate, this.usercity);
  List<double> _accelerometerValues;
  List<double> _userAccelerometerValues;
  List<double> _gyroscopeValues;
  bool _proximityValues = false;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {
    final List<String> accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    final List<String> gyroscope =
        _gyroscopeValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    final List<String> userAccelerometer = _userAccelerometerValues
        ?.map((double v) => v.toStringAsFixed(1))
        ?.toList();
    var gscope = gyroscope.join(",");
    var ascope = accelerometer.join(",");
    var uascope = userAccelerometer.join(",");

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: Text(
          "All Sensors Testing",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink[700],
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Accelerometer: $accelerometer'),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
          ),
          Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('UserAccelerometer: $userAccelerometer'),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
          ),
          Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Gyroscope: $gyroscope'),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
          ),
          Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Proximity: $_proximityValues'),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: BorderSide.none,
              ),
              color: Colors.blue,

              child: Text(
                "Shake Phone and Save ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              // onPressed: () => {},
              onPressed: () => {
                print('snackbar.dart value of imei  = ' +
                    this.imei +
                    ' and phone=  ' +
                    this.mob +
                    ' plam=' +
                    this.plan),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Report(
                          mob: this.mob,
                          uname: this.uname,
                          pass: this.pass,
                          accelerometer: ascope,
                          gyroscope: gscope,
                          uaccelerometer: uascope,
                          plan: this.plan,
                          imei: this.imei,
                          userstate: this.userstate,
                          usercity: this.usercity)),
                )
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    }));

    _streamSubscriptions
        .add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
    _streamSubscriptions.add(proximityEvents.listen((ProximityEvent event) {
      setState(() {
        _proximityValues = event.getValue();
      });
    }));
  }
}
