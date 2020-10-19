//import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//import 'package:rflutter_alert/rflutter_alert.dart';

//import 'entermobile.dart';
//import 'mainPage.dart';
//import 'package:url_launcher/url_launcher.dart';

class HowItWorks extends StatefulWidget {
  final String uname;
  final String title;
  HowItWorks({Key key, this.title, this.uname}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(this.uname);
}

class _MyHomePageState extends State<HowItWorks> {
  DateTime pastMonth = DateTime.now().add(Duration(days: 1));
  String uname;

  _MyHomePageState(this.uname);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://vasplanet.in/nyala/claim.php",
      withJavascript: true,
      withZoom: false,
      // appBar: AppBar(title: Text("Flutter"), elevation: 1),

      appBar: AppBar(
        title: Text("Nyala Insurance"),
        backgroundColor: Colors.pink,

        iconTheme: IconThemeData(
          color: Colors.white,
        ),

        //automaticallyImplyLeading: false,
      ),
    );
  }
}
