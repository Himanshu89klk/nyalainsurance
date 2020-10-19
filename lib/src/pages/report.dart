//import 'dart:convert';
import 'dart:convert';
import 'dart:io' show Platform;

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:device_info/device_info.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:insurance/checksub.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

//import 'home_page.dart';
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
  bool visible = false;
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
  IosDeviceInfo iosDeviceInfo;
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
    print(this.usercity);
    visible = true;
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
      'imei': this.imei,
      'state': this.userstate,
      'city': this.usercity
    };
    print(json.encode(data));

    // Starting Web API Call.
    //var response = await http.post(url, body: json.encode(data));
    http.post(url, body: json.encode(data));
    var response = await http.post(url, body: json.encode(data));
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CheckSub()),
      );
    }
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
    if (Platform.isAndroid) {
      // Android-specific code
      print('Android Platform Found and Id is \n');
      androidDeviceInfo = await deviceInfo.androidInfo;

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
    if (Platform.isIOS) {
      print('IOS Platform Found');
      iosDeviceInfo = await deviceInfo.iosInfo;

      setState(() {
        board = iosDeviceInfo.name;
        brand = iosDeviceInfo.systemName;
        device = iosDeviceInfo.systemVersion;
        hardware = iosDeviceInfo.utsname.machine;
        host = iosDeviceInfo.localizedModel;
        id = iosDeviceInfo.utsname.sysname;
        manufacture = iosDeviceInfo.utsname.version;
        model = iosDeviceInfo.model;
        product = iosDeviceInfo.utsname.release;
        type = iosDeviceInfo.utsname.nodename;
        isphysicaldevice = iosDeviceInfo.isPhysicalDevice;
        androidid = iosDeviceInfo.identifierForVendor;
      });
      // iOS-specific code
    }
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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer1(),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,

                              image: AssetImage(
                                'assets/images/as.png',
                              ),
                              //  image: NetworkImage(
                              // "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer2(),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(
                                'assets/images/secure.jpg',
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer3(),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(
                                'assets/images/intro2.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer4(),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 350,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(
                                'assets/images/onboarding1.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
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
              color: Colors.blue,
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
                          style: TextStyle(color: Colors.white, fontSize: 15),
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
          Visibility(
              visible: visible,
              child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                  ))),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget myDetailsContainer1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Profile Detail",
            style: TextStyle(
                color: Color(0xffe6020a),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Name : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              Container(
                child: Text(
                  this.uname,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Mobile : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              Container(
                child: Text(
                  this.mob,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Address : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              Container(
                child: Text(
                  this.userstate + ' , ' + this.usercity,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Plan Selected : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              Container(
                child: Text(
                  this.plan + ' birr / Day',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }

  Widget myDetailsContainer2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Toucn Screen Test",
            style: TextStyle(
                color: Color(0xffe6020a),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Screen Test : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              Container(
                child: Text(
                  'Successful',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Board : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              Container(
                child: Text(
                  "$board",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Location : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              Container(
                child: Text(
                  "$_locationMessage",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }

  Widget myDetailsContainer3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "All Sensors Information",
            style: TextStyle(
                color: Color(0xffe6020a),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Gyroscope : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              Container(
                child: Text(
                  "[" + this.gyroscope + "]",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Accelerometer : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              Container(
                child: Text(
                  "[" + this.accelerometer + "]",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "User Accelerometer : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              Container(
                child: Text(
                  "[" + this.uaccelerometer + "]",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }

  Widget myDetailsContainer4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Handset Information",
            style: TextStyle(
                color: Color(0xffe6020a),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Brand : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                ),
              )),
              Container(
                child: Text(
                  "$brand",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Device : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                ),
              )),
              Container(
                child: Text(
                  "$device",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Hardware : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                ),
              )),
              Container(
                child: Text(
                  "$hardware",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Host : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                ),
              )),
              Container(
                child: Text(
                  "$host",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "ID : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                ),
              )),
              Container(
                child: Text(
                  "$id",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Manufacture : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                ),
              )),
              Container(
                child: Text(
                  "$manufacture",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Model : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                ),
              )),
              Container(
                child: Text(
                  "$model",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Handset Id : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                ),
              )),
              Container(
                child: Text(
                  "$androidid",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "Is Physical Dev : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              )),
              Container(
                child: Text(
                  "$isphysicaldevice",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "IMEI : ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                ),
              )),
              Container(
                child: Text(
                  "$_platformImei",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }
}
