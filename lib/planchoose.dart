import 'package:flutter/rendering.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:insurance/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:insurance/registration.dart';

/*class ChoosePlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: CheckUser())));
  }
}*/

class ChoosePlan extends StatefulWidget {
  final String mob;
  final String imei;
  @override
  ChoosePlan({Key key, @required this.mob, this.imei}) : super(key: key);

  CheckUserState createState() => CheckUserState(mob, imei);
}

class CheckUserState extends State {
  //int _stackIndex = 0;

  //String _verticalGroupValue = "Pending";
  int _currValue = 1;
  //List<String> _status = ["Pending", "Released", "Blocked"];
  String mob;
  String imei;
  bool visible = false;
  CheckUserState(this.mob, this.imei);
  // Getting value from TextField widget.
  final emailInput = TextEditingController();

  Future userCheck() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });
  }

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
          "Subscription Plan",
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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.white, Colors.white10, Colors.white12])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Insurance(),

                  //FadeAnimation(1, Text("VP-Secure Login", style: TextStyle(color: Colors.white, fontSize: 22),)),
                  SizedBox(
                    height: 10,
                  ),

                  FadeAnimation(
                    1,
                    Text(
                      "Nyala Insurance",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    1,
                    Text(
                      "Choose Your Subscription Plan",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            //  SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Radio(
                              groupValue: _currValue,
                              onChanged: (int i) {
                                //  Navigator.push( context,MaterialPageRoute(builder: (context) => ValidHandset(uname:this.uname)),);
                                // Navigator.push( context,MaterialPageRoute(builder: (context) => Report()),);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup(
                                          imei: this.imei,
                                          mob: this.mob,
                                          uname: 'NewUser',
                                          plan: '1')),
                                );
                                setState(() => _currValue = i);
                              },
                              value: 1,
                            ),
                            FadeAnimation(
                                1.6,
                                Container(
                                  height: 110,
                                  width: 220,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.green[800]),
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signup(
                                                imei: this.imei,
                                                mob: this.mob,
                                                uname: 'NewUser',
                                                plan: '1')),
                                      );
                                    },
                                    color: Colors.teal,
                                    textColor: Colors.white,
                                    splashColor: Colors.green,
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                    ),
                                    child: Text(
                                      'Select Plan 1. \n\n\Subscribe at 1.00 birr/day\n(if Handset Cost<3000 birr)',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            Radio(
                              groupValue: _currValue,
                              onChanged: (int i) {
                                //  Navigator.push( context,MaterialPageRoute(builder: (context) => ValidHandset(uname:this.uname)),);
                                // Navigator.push( context,MaterialPageRoute(builder: (context) => Report()),);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup(
                                          imei: this.imei,
                                          mob: this.mob,
                                          uname: 'NewUser',
                                          plan: '1.25')),
                                );
                                setState(() => _currValue = i);
                              },
                              value: 2,
                            ),
                            FadeAnimation(
                                1.6,
                                Container(
                                  height: 110,
                                  width: 220,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.green[800]),
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signup(
                                                imei: this.imei,
                                                mob: this.mob,
                                                uname: 'NewUser',
                                                plan: '1.25')),
                                      );
                                    },
                                    color: Colors.pinkAccent,
                                    textColor: Colors.white,
                                    splashColor: Colors.blue,
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                    ),
                                    child: Text(
                                        'Select Plan 2. \n\n\Subscribe at 1.25 birr/day\n(if Handset Cost between \n3000-10000 birr)'),
                                  ),
                                )),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                              groupValue: _currValue,
                              onChanged: (int i) {
                                //  Navigator.push( context,MaterialPageRoute(builder: (context) => ValidHandset(uname:this.uname)),);
                                // Navigator.push( context,MaterialPageRoute(builder: (context) => Report()),);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup(
                                          imei: this.imei,
                                          mob: this.mob,
                                          uname: 'NewUser',
                                          plan: '1.50')),
                                );
                                setState(() => _currValue = i);
                              },
                              value: 3,
                            ),
                            FadeAnimation(
                                1.6,
                                Container(
                                  height: 110,
                                  width: 220,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.green[800]),
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signup(
                                                imei: this.imei,
                                                mob: this.mob,
                                                uname: 'NewUser',
                                                plan: '1.50')),
                                      );
                                    },
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    splashColor: Colors.pink,
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                    ),
                                    child: Text(
                                        'Select Plan 3. \n\nSubscribe at 1.50 birr/day\n(if Handset Cost >10000 birr)'),
                                  ),
                                )),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Content Page after sucessfull Login
class Insurance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/insurance.png');
    Image image = Image(image: assetImage, height: 100, width: 100);
    return Container(
      child: image,
    );
  }
}
