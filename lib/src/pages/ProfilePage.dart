import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:insurance/entermobile.dart';
import 'package:insurance/policyinfo.dart';
import 'package:insurance/src/pages/showreport.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../mainPage.dart';

class PersonalInfo extends StatefulWidget {
  final String uname, recordsetmsg, email, mobile, plan, sub;

// Receiving Email using Constructor.
  PersonalInfo(
      {Key key,
      @required this.uname,
      this.recordsetmsg,
      this.email,
      this.mobile,
      this.plan,
      this.sub})
      : super(key: key);
  @override
  MapScreenState createState() =>
      MapScreenState(uname, recordsetmsg, email, mobile, plan, sub);
}

class MapScreenState extends State<PersonalInfo>
    with SingleTickerProviderStateMixin {
  final String uname, recordsetmsg, email, mobile, plan, sub;
  int index;
  MapScreenState(this.uname, this.recordsetmsg, this.email, this.mobile,
      this.plan, this.sub);
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  var _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF0F0F0),
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
                              usercity: recordsetmsg.split(",")[26],
                              recordsetmsg: this.recordsetmsg,
                            )),
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
                  icon: Icon(Icons.local_atm), title: Text("Quality Check")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("Profile")),
            ]),
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    height: 230.0,
                    color: Colors.pink[700],
                    child: new Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 28.0,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage(
                                                uname: this.uname,
                                                recordsetmsg: this.recordsetmsg,
                                              )),
                                    );
                                  },
                                ),
                                //image: new ExactAssetImage('assets/images/secure.jpg'),
                                FlatButton(
                                  textColor: Colors.white,
                                  child: Text(
                                    'User Information',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage(
                                                uname: this.uname,
                                                recordsetmsg: this.recordsetmsg,
                                              )),
                                    );
                                  },
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    color: Colors.greenAccent,
                                    size: 26,
                                  ),
                                  color: Colors.white,
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            backgroundColor: Colors.transparent,
                                            child: Container(
                                              height: 100,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  SpinKitHourGlass(
                                                    color: Colors.yellowAccent,
                                                    size: 40,
                                                  ),
                                                  Text(
                                                    '\n Back to Home',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                    new Future.delayed(new Duration(seconds: 1),
                                        () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainPage(
                                                  uname: this.uname,
                                                  recordsetmsg:
                                                      this.recordsetmsg,
                                                )),
                                      );
                                    });
                                  },
                                ),

                                // SizedBox(width: 1,),
                                // Image.asset("assets/menu.png", height: 22,),
                                IconButton(
                                  icon: Icon(
                                    Icons.exit_to_app,
                                    color: Colors.redAccent,
                                    size: 26,
                                  ),
                                  color: Colors.white,
                                  onPressed: () {
                                    Alert(
                                      context: context,
                                      //type: AlertType.error,
                                      title: "Logout",
                                      desc:
                                          "Are You Sure You want to Logout form VP-Secure App",
                                      style: AlertStyle(
                                        animationType: AnimationType.fromTop,
                                        isCloseButton: false,
                                        isOverlayTapDismiss: true,
                                        // descStyle: TextStyle(fontWeight: FontWeight.bold),

                                        animationDuration:
                                            Duration(milliseconds: 500),
                                        alertBorder: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
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
                                              "Yes",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EnterMobile(
                                                            imei: 'abcd')),
                                              );
                                            },
                                            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => VPHomePage()), (Route<dynamic> route) => false);},
                                            gradient: LinearGradient(colors: [
                                              Colors.green[900],
                                              Colors.green[800],
                                              Colors.green[400]
                                            ])),
                                        DialogButton(
                                            child: Text(
                                              "No",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            gradient: LinearGradient(colors: [
                                              Colors.red[900],
                                              Colors.red[800],
                                              Colors.red[400]
                                            ])),
                                      ],
                                    ).show();

                                    //old below
                                    // Navigator.push( context,MaterialPageRoute(builder: (context) => VPHomePage()),);
                                  },
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child:
                              new Stack(fit: StackFit.loose, children: <Widget>[
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                    width: 130.0,
                                    height: 130.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                        image: new ExactAssetImage(
                                            'assets/insurance.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 80.0, right: 90.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 25.0,
                                      child: new Icon(
                                        Icons.verified_user,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )),
                          ]),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 15.0),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Parsonal Information',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal),
                                      ),
                                    ],
                                  ),
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      _status
                                          ? new Container()
                                          : new Container(),
                                    ],
                                  )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Name',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  _status
                                      ? new Text(
                                          this.uname,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        )
                                      : new Flexible(
                                          child: new TextField(
                                            decoration: const InputDecoration(
                                              hintText: " Enter Your New Name",
                                            ),
                                            enabled: !_status,
                                            autofocus: !_status,
                                          ),
                                        ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Email ID',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  _status
                                      ? new Text(
                                          this.email.trim(),
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        )
                                      : new Flexible(
                                          child: new TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter Email ID"),
                                            enabled: !_status,
                                          ),
                                        ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Mobile',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  _status
                                      ? new Text(
                                          this.mobile.trim(),
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        )
                                      : new Text(
                                          this.mobile,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Plan',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  _status
                                      ? new Text(
                                          this.plan.trim() + " birr/Day",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        )
                                      : new Text(
                                          this.plan,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Subscription Date',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  _status
                                      ? new Text(
                                          this.sub.trim(),
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        )
                                      : new Text(
                                          this.sub,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        )
                                ],
                              )),
                          !_status ? _getActionButtons() : new Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
