import 'dart:async';
import 'dart:convert';
//import 'dart:io' show Platform;
import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:insurance/mainPage.dart';
//import 'package:insurance/entermobile.dart';
import 'package:insurance/screens/intro_screen.dart';

//import 'package:insurance/src/pages/home_page.dart';
import 'package:insurance/src/pages/scratcher.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:insurance/src/pages/sms.dart';

//import 'package:insurance/agreecontinue.dart';
//import 'package:insurance/deviceinfo.dart';
//import 'package:insurance/registration.dart';
//import 'package:insurance/src/pages/home_page.dart';

//void main() => runApp(CheckInternet());

class CheckSub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visible = false;
  String _platformImei = 'Unknown';
  DeviceInfoPlugin deviceInfo =
      DeviceInfoPlugin(); // instantiate device info plugin
  AndroidDeviceInfo androidDeviceInfo;
  String _locationMessage = "";

  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    // Getting Server response into variable.

    // If Web call Success than Hide the CircularProgressIndicator.

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
      //table insertion
      var url = 'http://www.vasplanet.in/flutter/location_insertion.php';

      var data = {
        'mobile': '123456789',
        'location': _locationMessage,
      };
      print(json.encode(data));

      // Starting Web API Call.
      http.post(url, body: json.encode(data));
    });
    Timer.periodic(Duration(seconds: 120), (timer) {
      _getCurrentLocation();
    });
  }

  Future userCheck() async {
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      _showDialog('No internet',
          "You're not connected to Internet. Kindly Enable Wifi or Mobile Data");
    }
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String email = _platformImei;
    print(email);

    int emailLength = email.length;

    if (emailLength >= 1) {
      // SERVER API URL
      //var url = 'http://172.20.10.2/vpsecure/register_user.php';
      print(emailLength);

      var url = 'http://www.vasplanet.in/flutter/imei_check.php';
      //var url = 'http://196.188.95.131:8086/charge/new_user.php';

      // Store all data with Param Name.
      var data = {'email': email};

      // Starting Web API Call.
      var loginresponse = await http.post(url, body: json.encode(data));

      // Getting Server loginresponse into variable.
      var loginmessage = jsonDecode(loginresponse.body);
      print(loginmessage);

      // If Web call Success than Hide the CircularProgressIndicator.
      if (loginresponse.statusCode == 200) {
        print(loginresponse.statusCode);
        print(json.decode(loginresponse.body));
        setState(() {
          visible = false;
        });
      } else {
        print(loginresponse.statusCode);
      }
      print(loginmessage);
      // if(loginmessage == 'Login Matched'){
      if (loginmessage == 'OK') {
        // If Email or Password Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        var url1 = 'http://www.vasplanet.in/flutter/fetch.php';
        //var url = 'http://196.188.95.131:8086/charge/new_user.php';

        // Store all data with Param Name.
        var data = {'email': email};

        // Starting Web API Call.
        var recordset = await http.post(url1, body: json.encode(data));

        // Getting Server loginresponse into variable.
        var recordsetmsg = jsonDecode(recordset.body);
        print(recordsetmsg);
        // Showing Alert Dialog with loginresponse JSON loginmessage.

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(
                  uname: loginmessage.toString(),
                  recordsetmsg: recordsetmsg.toString()),
            ));
      }
      if (loginmessage == 'pending') {
        // If Email or Password Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SendSms(),
            ));
      }
      if (loginmessage == 'Not Matched') {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        print('value of imei on checksub.dart = ' + email);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IntroScreen(imei: email)),
        );
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Entered Email/Password is Null, Please Enter Correct Values ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      SizedBox(
                        width: 320.0,
                        child: RaisedButton(
                          onPressed: () {
                            //for testing commented and new navigation added
                            //Navigator.push( context,MaterialPageRoute(builder: (context) => VPHomePage()),);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScratchApp(
                                      mob: 'abcd', uname: 'test user')),
                            );

                            // Navigator.push(
                            // context,
                            //  MaterialPageRoute(
                            //   builder: (context) =>
                            //       AppFooter(uname: 'test user')),
                            // );
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }

  /*Future platformCheck() async {
    if (Platform.isAndroid) {
      // Android-specific code
      androidDeviceInfo = await deviceInfo.androidInfo;
      print('Android Platform Found and Id is \n');
      print(androidDeviceInfo.androidId);
    } else if (Platform.isIOS) {
      print('IOS Platform Found');
      // iOS-specific code
    }
  }*/

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _getCurrentLocation();
    //platformCheck();
    userCheck();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(

            // child: RaisedButton(
            //child: Text('Check connectivity'),
            // onPressed: _checkInternetConnectivity,
            //  )
            ));
  }

//_checkInternetConnectivity() async {
  //var result = await Connectivity().checkConnectivity();
  // if (result == ConnectivityResult.none) {
  //   _showDialog('No internet', "You're not connected to a network");
  // } else if (result == ConnectivityResult.mobile) {
  //   _showDialog('Internet access', "You're connected over mobile data");
  // } else if (result == ConnectivityResult.wifi) {
  //   _showDialog('Internet access', "You're connected over wifi");
  // }
  //}

  _showDialog(title, text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
