//import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//import 'package:rflutter_alert/rflutter_alert.dart';

//import 'entermobile.dart';
//import 'mainPage.dart';
//import 'package:url_launcher/url_launcher.dart';

class Transaction extends StatefulWidget {
  final String uname, mobile;

  Transaction({Key key, this.uname, this.mobile}) : super(key: key);

  @override
  _TransactionState createState() => _TransactionState(uname, mobile);
}

class _TransactionState extends State<Transaction> {
  DateTime pastMonth = DateTime.now().add(Duration(days: 1));
  String uname, mobile;

  _TransactionState(this.uname, this.mobile);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://vasplanet.in/nyala/trans.php?mode=mobile&msisdn=" +
          this.mobile.substring(9).trim(),
      withJavascript: true,
      withZoom: false,
      // appBar: AppBar(title: Text("Flutter"), elevation: 1),

      appBar: AppBar(
        title: Text("Transaction History"),
        backgroundColor: Colors.pink,

        iconTheme: IconThemeData(
          color: Colors.white,
        ),

        //automaticallyImplyLeading: false,
      ),
    );
  }
}
