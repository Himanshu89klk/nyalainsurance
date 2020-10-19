//import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//import 'package:rflutter_alert/rflutter_alert.dart';

//import 'entermobile.dart';
//import 'mainPage.dart';
//import 'package:url_launcher/url_launcher.dart';

class AboutCompany extends StatefulWidget {
  final String uname;

  AboutCompany({Key key, this.uname}) : super(key: key);

  @override
  _AboutCompanyState createState() => _AboutCompanyState(this.uname);
}

class _AboutCompanyState extends State<AboutCompany> {
  DateTime pastMonth = DateTime.now().add(Duration(days: 1));
  String uname;

  _AboutCompanyState(this.uname);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://vasplanet.in/nyala/about.php",
      withJavascript: true,
      withZoom: false,
      // appBar: AppBar(title: Text("Flutter"), elevation: 1),

      appBar: AppBar(
        title: Text("About Nyala"),
        backgroundColor: Colors.pink,

        iconTheme: IconThemeData(
          color: Colors.white,
        ),

        //automaticallyImplyLeading: false,
      ),
    );
  }
}
