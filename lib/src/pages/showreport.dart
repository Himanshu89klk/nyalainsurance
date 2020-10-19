//import 'dart:convert';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:device_info/device_info.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:insurance/mainPage.dart';

import '../../policyinfo.dart';
import 'ProfilePage.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

//import 'home_page.dart';
//import 'package:insurance/src/pages/home_page.dart';
//import 'package:insurance/src/pages/sms.dart';

//import 'endpage.dart';
//import 'package:conreality_headset/conreality_headset.dart';

class ShowReport extends StatefulWidget {
  final String uname;
  final String pass;
  final String accelerometer;
  final String gyroscope;
  final String uaccelerometer;
  final String plan;
  final String mob;
  final String imei, userstate, usercity, recordsetmsg;

  @override
  // ReportPageState createState() => ReportPageState();
  ShowReport(
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
      this.usercity,
      this.recordsetmsg})
      : super(key: key);
  CheckNewUser createState() => CheckNewUser(mob, uname, pass, accelerometer,
      gyroscope, uaccelerometer, plan, imei, userstate, usercity, recordsetmsg);
}

class CheckNewUser extends State<ShowReport> {
  String uname;
  String pass;
  String gyroscope;
  String accelerometer;
  String plan;
  String uaccelerometer;
  String mob;
  String imei, userstate, usercity, recordsetmsg;
  String _platformImei = 'Unknown';
  String screentest = 'successful';
  var _currentIndex = 2;
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
      this.usercity,
      this.recordsetmsg);

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
      print('Android Platform Found');
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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            switch (_currentIndex) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainPage(
                            uname: this.uname,
                            recordsetmsg: this.recordsetmsg,
                          )),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PolicyInfo(
                        uname: this.uname,
                        recordsetmsg: this.recordsetmsg,
                        userstate: recordsetmsg.split(",")[25],
                        usercity: recordsetmsg.split(",")[26],
                        imei: recordsetmsg.split(",")[4],
                        plan: recordsetmsg.split(",")[21],
                        sub: recordsetmsg.split(",")[22]),
                  ),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowReport(
                          mob: recordsetmsg.split(",")[3],
                          uname: this.uname,
                          pass: 'Test',
                          accelerometer: recordsetmsg.split(",")[5],
                          gyroscope: recordsetmsg.split(",")[6],
                          uaccelerometer: recordsetmsg.split(",")[7],
                          plan: recordsetmsg.split(",")[21],
                          imei: recordsetmsg.split(",")[4],
                          userstate: recordsetmsg.split(",")[25],
                          usercity: recordsetmsg.split(",")[26])),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonalInfo(
                            uname: this.uname,
                            recordsetmsg: this.recordsetmsg,
                            email: recordsetmsg.split(",")[2],
                            mobile: recordsetmsg.split(",")[3],
                            plan: recordsetmsg.split(",")[21],
                            sub: recordsetmsg.split(",")[22],
                          )),
                );
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), title: Text("Policy")),
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share),
                title: Text("Quality Check")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Profile")),
          ]),
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
