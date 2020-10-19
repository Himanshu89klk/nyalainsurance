import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:insurance/splashapp.dart';
import 'package:android_intent/android_intent.dart';
import 'package:permission_handler/permission_handler.dart';
//void main() => runApp(CheckInternet());

class CheckInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet connectivity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future userCheck() async {
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      _showDialog('No internet',
          "You're not connected to Internet. Kindly Enable Wifi or Mobile Data");
    }

    if (result == ConnectivityResult.mobile) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SplashApp()),
      );
    }
    if (result == ConnectivityResult.wifi) {
      // _showDialog('Internet access', "You're connected over wifi");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SplashApp()),
      );
    }

    // if(loginmessage == 'Login Matched'){
  }

  final PermissionHandler permissionHandler = PermissionHandler();
  Map<PermissionGroup, PermissionStatus> permissions;
  void initState() {
    super.initState();
    requestLocationPermission();
    _gpsService();
  }

  Future<bool> _requestPermission(PermissionGroup permission) async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var result = await _permissionHandler.requestPermissions([permission]);
    if (result[permission] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

/*Checking if your App has been Given Permission*/
  Future<bool> requestLocationPermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission(PermissionGroup.location);
    if (granted != true) {
      requestLocationPermission();
    }
    debugPrint('requestContactsPermission $granted');
    return granted;
  }

/*Show dialog if GPS not enabled and open settings location*/
  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Can't get gurrent location"),
                content:
                    const Text('Please make sure you enable GPS and try again'),
                actions: <Widget>[
                  FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        final AndroidIntent intent = AndroidIntent(
                            action:
                                'android.settings.LOCATION_SOURCE_SETTINGS');
                        intent.launch();
                        //Navigator.of(context, rootNavigator: true).pop();
                        Navigator.pop(context);
                        _gpsService();
                      })
                ],
              );
            });
      }
    }
  }

/*Check if gps service is enabled or not*/
  Future _gpsService() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      _checkGps();
      return null;
    } else
      userCheck();
    //return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(),
          title: Text(
            "Checking Internet Connectivity",
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
