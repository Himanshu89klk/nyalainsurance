//import 'dart:async';

//import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//import 'package:rflutter_alert/rflutter_alert.dart';

//import 'entermobile.dart';
//import 'mainPage.dart';
//import 'package:url_launcher/url_launcher.dart';

class RaiseClaim extends StatefulWidget {
  final String uname, mobile;

  RaiseClaim({Key key, this.uname, this.mobile}) : super(key: key);

  @override
  _RaiseClaimState createState() => _RaiseClaimState(this.uname, this.mobile);
}

class _RaiseClaimState extends State<RaiseClaim> {
  DateTime pastMonth = DateTime.now().add(Duration(days: 1));
  String uname, mobile;

  _RaiseClaimState(this.uname, this.mobile);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://vasplanet.in/nyala/csc/mpostclaim.php?mode=mobile&msisdn=" +
          this.mobile.substring(9).trim(),
      withJavascript: true,
      withZoom: false,
      appBar: AppBar(
        title: Text("Raise Claim"),
        backgroundColor: Colors.pink,

        iconTheme: IconThemeData(
          color: Colors.white,
        ),

        //automaticallyImplyLeading: false,
      ),
    );
  }
}
