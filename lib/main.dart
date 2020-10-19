//import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//import 'gpsLocation.dart';
import 'package:insurance/checkinternet.dart';
//import 'package:insurance/src/pages/wifi.dart';
//import 'package:insurance/testpage.dart';
//import 'package:insurance/entermobile.dart';
//import 'package:insurance/planchoose.dart';
//import 'package:insurance/locationtracker.dart';
//import 'package:insurance/splashapp.dart';

//void main() => runApp(SplashApp());

void main() => runApp(CheckInternet());
//void main() => runApp(AskForPermission());
//void main() => runApp(EnterMobile());
//void main() => runApp(LocationTrack());
//void main() => runApp(ChoosePlan());

//void main() {
//debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
//runApp(DevicePreview(    builder: (context) => SplashApp(),  ));
//}

/*import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flt_telephony_info/flt_telephony_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TelephonyInfo _info;

  @override
  void initState() {
    super.initState();
    getTelephonyInfo();
  }

  Future<void> getTelephonyInfo() async {
    TelephonyInfo info;
    try {
      info = await FltTelephonyInfo.info;
    } on PlatformException {}

    if (!mounted) return;

    setState(() {
      _info = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Phone imei: ${_info?.imei}\n'),
        ),
      ),
    );
  }
}
*/
