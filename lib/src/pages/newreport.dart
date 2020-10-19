//import 'dart:convert';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:device_info/device_info.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//import 'package:insurance/src/pages/home_page.dart';
//import 'package:insurance/src/pages/sms.dart';

//import 'endpage.dart';
//import 'package:conreality_headset/conreality_headset.dart';

class Report extends StatefulWidget {
  final String uname;
  final String pass;
  final String accelerometer;
  final String gyroscope;
  final String uaccelerometer;
  final String plan;
  final String mob;
  final String imei, userstate, usercity;

  @override
  // ReportPageState createState() => ReportPageState();
  Report(
      {Key key,
      @required this.mob,
      this.uname,
      this.pass,
      this.accelerometer,
      this.gyroscope,
      this.uaccelerometer,
      this.plan,
      this.imei,
      this.userstate,
      this.usercity})
      : super(key: key);
  CheckNewUser createState() => CheckNewUser(mob, uname, pass, accelerometer,
      gyroscope, uaccelerometer, plan, imei, userstate, usercity);
}

class CheckNewUser extends State<Report> {
  String uname;
  String pass;
  String gyroscope;
  String accelerometer;
  String plan;
  String uaccelerometer;
  String mob;
  String imei, userstate, usercity;
  String _platformImei = 'Unknown';
  String screentest = 'successful';
  CheckNewUser(
      this.mob,
      this.uname,
      this.pass,
      this.accelerometer,
      this.gyroscope,
      this.uaccelerometer,
      this.plan,
      this.imei,
      this.userstate,
      this.usercity);

  DeviceInfoPlugin deviceInfo =
      DeviceInfoPlugin(); // instantiate device info plugin
  AndroidDeviceInfo androidDeviceInfo;
  String values;
  String _locationMessage = "";
  String board,
      brand,
      device,
      hardware,
      host,
      id,
      manufacture,
      model,
      product,
      type,
      androidid;
  bool isphysicaldevice;
  @override
  void initState() {
    super.initState();
    getDeviceinfo();
    initPlatformState();
    _getCurrentLocation();
    //headphone();
  }

  Future<void> _incrementCounter() async {
    var url = 'http://www.vasplanet.in/flutter/update.php';
    //var url = 'http://196.188.95.131/charge/index.php';
    // Store all data with Param Name.
    var data = {
      'msisdn': this.mob,
      'class': this.plan,
      'accelerometer': this.accelerometer,
      'gyroscope': this.gyroscope,
      'uaccelerometer': this.uaccelerometer,
      'plan': this.plan,
      'screentest': this.screentest,
      'board': this.board,
      'location': this._locationMessage,
      'brand': this.brand,
      'device': this.device,
      'hardware': this.hardware,
      'host': this.host,
      'manufacture': this.manufacture,
      'model': this.model,
      'handsetid': this.androidid,
      'imei': this.imei
    };
    print(json.encode(data));

    // Starting Web API Call.
    //var response = await http.post(url, body: json.encode(data));
    http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    //var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.

    //}
    /*else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
      if (state != SmsMessageState.Fail && state == SmsMessageState.None) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewSms(
                    uname: this.uname,
                    pass: this.pass,
                    accelerometer: this.accelerometer,
                    gyroscope: this.gyroscope,
                    uaccelerometer: this.uaccelerometer,
                    plan: this.plan)));
      }*/
  }

  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    // Getting Server response into variable.

    // If Web call Success than Hide the CircularProgressIndicator.

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
      //table insertion
      /*  var url = 'http://www.vasplanet.in/flutter/location_insertion.php';

      var data = {
        'mobile': this.mob,
        'location': _locationMessage,
      };
      print(json.encode(data));

      // Starting Web API Call.
      http.post(url, body: json.encode(data));*/
    });
    Timer.periodic(Duration(seconds: 300), (timer) {
      _getCurrentLocation();
    });
  }

  void getDeviceinfo() async {
    androidDeviceInfo = await deviceInfo
        .androidInfo; // instantiate Android Device Infoformation
    setState(() {
      board = androidDeviceInfo.board;
      brand = androidDeviceInfo.brand;
      device = androidDeviceInfo.device;
      hardware = androidDeviceInfo.hardware;
      host = androidDeviceInfo.host;
      id = androidDeviceInfo.id;
      manufacture = androidDeviceInfo.manufacturer;
      model = androidDeviceInfo.model;
      product = androidDeviceInfo.product;
      type = androidDeviceInfo.type;
      isphysicaldevice = androidDeviceInfo.isPhysicalDevice;
      androidid = androidDeviceInfo.androidId;
    });
  }

  Future<void> initPlatformState() async {
    String platformImei;
    //String idunique;
    // Platform messages may fail, so we use a try/catch PlatformException.

    platformImei =
        await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);
    // idunique = await ImeiPlugin.getId();

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformImei = platformImei;
      // uniqueId = idunique;
    });
  }
  //void headphone() async {
  //var ok = await Headset.isConnected;
  //if (ok == true) {
  //values = "Headset Connected";
  //} else {
  // values = "Headset Not Connected";
  //}
  // print("Headset is " + (ok ? "connected" : "NOT connected"));
  //}

  @override
  Widget build(BuildContext context) {
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
          this.uname.toUpperCase() + " Handset Report",
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          // padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.black,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Profile Detail :-",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(height: 30),
                  Text(
                    "Name : ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    this.uname,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(height: 30),
                  Text(
                    "Mobile : ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    this.mob,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(height: 30),
                  Text(
                    "Address : ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    this.userstate + ' , ' + this.usercity,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(height: 30),
                  Text(
                    "Plan Selected : ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    this.plan + ' Birr/Day ',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.black,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Toucn Screen Test :-",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(height: 30),
                  Text(
                    "Screen Test : ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Successful",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Board : ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$board",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(height: 30),
                  Text(
                    "Location : ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$_locationMessage",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.black,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "All Sensors Information :-",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Gyroscope : ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "[" + this.gyroscope + "]",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Accelerometer : ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "[" + this.accelerometer + "]",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "User Accelerometer : ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "[" + this.uaccelerometer + "]",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.black,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Handset Information :-",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Brand : ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$brand",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Device : ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$device",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Hardware : ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$hardware",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Host : ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$host",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "ID : ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$id",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Manufacture : ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$manufacture",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Model : ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$model",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Handset Id : ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$androidid",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Is Physical Dev : ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$isphysicaldevice",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "IMEI : ",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$_platformImei",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.black,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
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
                  color: Colors.teal,
                  child: Text(
                    "Confirm and Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () => {
                    Alert(
                      context: context,
                      //type: AlertType.error,
                      title: "Nyala Insurance",
                      desc: "Congratulations! " +
                          uname.toUpperCase() +
                          " ! You have completed the subscription process. You will receive confirmation SMS from 813",
                      style: AlertStyle(
                        animationType: AnimationType.fromTop,
                        isCloseButton: true,
                        isOverlayTapDismiss: true,
                        // descStyle: TextStyle(fontWeight: FontWeight.bold),

                        animationDuration: Duration(milliseconds: 500),
                        alertBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            color: Colors.greenAccent,
                          ),
                        ),
                        titleStyle: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      buttons: [
                        DialogButton(
                            child: Text(
                              "Ok",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            onPressed: _incrementCounter,
                            gradient: LinearGradient(colors: [
                              Colors.green[900],
                              Colors.green[800],
                              Colors.green[400]
                            ])),
                      ],
                    ).show()
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
