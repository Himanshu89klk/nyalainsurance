//import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//import 'dart:convert';
//import 'dart:html';
//import 'package:http/http.dart' as http;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:insurance/Animation/FadeAnimation.dart';
//import 'package:insurance/checksub.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:insurance/src/pages/home_page.dart';
//import 'dart:async';

//import 'package:sms/sms.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../checkinternet.dart';

//import '../../checksub.dart';
//import 'home_page.dart';
//import 'newsms.dart';
//import 'package:flutter_sms/flutter_sms.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:insurance/policyinfo.dart';
//import 'package:insurance/src/pages/ProfilePage.dart';
//import 'package:insurance/src/pages/complaint_register.dart';
//import 'package:insurance/src/pages/home_page.dart';
//import 'package:insurance/src/pages/newsms.dart';
//import 'package:insurance/src/pages/transaction.dart';
//import 'package:url_launcher/url_launcher.dart';
//void main() => runApp(new SendSms());

class SendSms extends StatefulWidget {
// Receiving Email using Constructor.
  SendSms({
    Key key,
  }) : super(key: key);
  @override
  _SendSmsState createState() => new _SendSmsState();
}

class _SendSmsState extends State<SendSms> {
  _SendSmsState();
  int index;
  bool visible = false;
// Receiving Email using Constructor.
//Subscription({Key key, @required this.uname}) : super(key: key);
  //AppPage({Key key}) : super(key: key);

  //void _incrementCounter() {

  Timer _timer;
  int _start = 10;
  String _txt = "";

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    print(_timer);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  Future<void> _incrementCounter() async {
    // var url = 'http://www.vasplanet.in/flutter/register_user.php';

    //FOR Android
    _txt = 'Waiting for SMS Received';
    var url = 'sms:813?body=OK';
    await launch(url);
    startTimer();
    Timer(Duration(seconds: 10), () {
      print("Yeah, this line is printed after 10 seconds");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CheckInternet()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckInternet()),
            );
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: Text(
          "SMS Checking",
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
      body: ListView(
        children: <Widget>[
          Container(
            //child: new InkWell(
            child: Image.asset("images/sub.png", height: 150),

            //onTap: (){Navigator.push( context,MaterialPageRoute(builder: (context) => AppFooter(uname:this.uname,)),); },

            //)
          ),
          SizedBox(
            height: 20,
          ),
          new Center(
              child: Text(
            "Kindly Send OK to 813",
            style: TextStyle(color: Colors.black, fontSize: 20),
          )),
          SizedBox(
            height: 20,
          ),
          new Center(
              child: Text(
            'for further Steps',
            style: TextStyle(color: Colors.blueGrey, fontSize: 20),
          )),
          SizedBox(
            height: 20,
          ),

//ListTile(
          IconButton(
            icon: Icon(
              Icons.open_in_browser,
              color: Colors.blue,
              size: 40,
            ),
            onPressed: () {
              visible = true;
              _incrementCounter();
            },
          ),

          SizedBox(
            height: 10,
          ),
          FadeAnimation(
              1.6,
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 90),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green[800]),
                child: RaisedButton(
                  onPressed: () {
                    visible = true;
                    _incrementCounter();
                  },
                  color: Colors.pink,
                  textColor: Colors.white,
                  splashColor: Colors.yellow[200],
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  child: Text(
                    "Click Here",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              )),

          FlatButton(
            textColor: Colors.blue,
            child: Center(
              child: Visibility(
                  visible: visible,
                  child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                      ))),
            ),
            onPressed: () {
              visible = true;
              _incrementCounter();
            },
          ),
          FlatButton(
            textColor: Colors.blue,
            child: Center(
                child: Text(
              "$_txt",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            )),
            onPressed: () {
              visible = true;
              _incrementCounter();
            },
          ),
//),
        ],
      ),
    );
  }
}
