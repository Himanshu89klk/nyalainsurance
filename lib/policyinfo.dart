import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:insurance/Animation/FadeAnimation.dart';
import 'package:insurance/entermobile.dart';
import 'package:insurance/mainPage.dart';
import 'package:insurance/src/pages/ProfilePage.dart';
import 'package:insurance/src/pages/showreport.dart';
import 'package:insurance/src/theme/color/light_color.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//import 'drawer.dart';

class PolicyInfo extends StatefulWidget {
  final String uname, recordsetmsg, userstate, usercity, imei, plan, sub;

// Receiving Email using Constructor.
  PolicyInfo(
      {Key key,
      @required this.uname,
      this.recordsetmsg,
      this.userstate,
      this.usercity,
      this.imei,
      this.plan,
      this.sub})
      : super(key: key);
  @override
  _PolicyInfoState createState() => _PolicyInfoState(
      uname, recordsetmsg, userstate, usercity, imei, plan, sub);
}

class _PolicyInfoState extends State<PolicyInfo> {
  DateTime pastMonth = DateTime.now().add(Duration(days: 1));
  String uname, recordsetmsg, userstate, usercity, imei, plan, sub;
  int index;
  _PolicyInfoState(this.uname, this.recordsetmsg, this.userstate, this.usercity,
      this.imei, this.plan, this.sub);
  double width;

  Widget _header(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: FadeAnimation(
        1.4,
        Container(
            height: 140,
            width: width,
            decoration: BoxDecoration(color: Colors.pink),
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    top: 30,
                    right: -100,
                    child: _circularContainer(300, LightColor.grey)),
                Positioned(
                    top: -100,
                    left: -45,
                    child: _circularContainer(width * .5, Colors.pink)),
                Positioned(
                    top: -180,
                    right: -30,
                    child: _circularContainer(width * .7, Colors.transparent,
                        borderColor: Colors.white38)),
                Positioned(
                    top: 40,
                    left: 0,
                    child: Container(
                        width: width,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    child: new InkWell(
                                  onTap: () {
                                    // Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage(
                                                uname: this.uname,
                                                recordsetmsg: this.recordsetmsg,
                                              )),
                                    );
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                )),

                                SizedBox(
                                  width: 8,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: new InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MainPage(
                                                      uname: this.uname,
                                                    )),
                                          );
                                        },
                                        child: new Container(
                                          child: Text(
                                            "My ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: new InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MainPage(
                                                      uname: this.uname,
                                                      recordsetmsg:
                                                          this.recordsetmsg,
                                                    )),
                                          );
                                        },
                                        child: new Container(
                                          child: Text(
                                            "Policy",
                                            style: TextStyle(
                                                // color: Color(0xffFCCD00),
                                                color: Colors.yellow,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    color: Colors.blueAccent,
                                    size: 28,
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

                                new IconButton(
                                  icon: Icon(
                                    Icons.notifications,
                                    color: Colors.yellow,
                                    size: 26,
                                  ),
                                  color: Colors.white,
                                  onPressed: () {
                                    Alert(
                                      context: context,
                                      //type: AlertType.error,
                                      title: "Notification:",
                                      desc: 'Dear ' +
                                          this.uname.toUpperCase() +
                                          "!! Your Renewal is due on " +
                                          this
                                              .pastMonth
                                              .toString()
                                              .substring(0, 10) +
                                          ". Kindly Make Sufficient Funds.",
                                      style: AlertStyle(
                                        animationType: AnimationType.fromTop,
                                        isCloseButton: true,
                                        isOverlayTapDismiss: true,
                                        // descStyle: TextStyle(fontWeight: FontWeight.bold),

                                        animationDuration:
                                            Duration(milliseconds: 1000),
                                        alertBorder: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
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
                                              "Ok",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            gradient: LinearGradient(colors: [
                                              Colors.green[900],
                                              Colors.green[800],
                                              Colors.green[400]
                                            ])),
                                      ],
                                    ).show();

                                    //Navigator.push( context,MaterialPageRoute(builder: (context) => HomePagee()),);
                                  },
                                ),

                                // SizedBox(width: 1,),
                                // Image.asset("assets/menu.png", height: 22,),
                                IconButton(
                                  icon: Icon(
                                    Icons.exit_to_app,
                                    color: Colors.red,
                                    size: 28,
                                  ),
                                  color: Colors.white,
                                  onPressed: () {
                                    Alert(
                                      context: context,
                                      //type: AlertType.error,
                                      title: "Logout",
                                      desc:
                                          "Are You Sure You want to Logout form Nyala Insurance App",
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
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Hi " +
                                  uname.toUpperCase() +
                                  " !! Policy Document",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )))
              ],
            )),
      ),
    );
  }

  Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  var _currentIndex = 1;
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
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _header(context),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    width: MediaQuery.of(context).size.width - 40,
                    height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "About",
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Congratulation ' +
                              this.uname.toUpperCase() +
                              " for subscibing best Insurance Policy to Secure your Handset. Now you can claim for any problem related to your handset at any time. Your Policy document is ready and detail shown below: ",
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.location_city,
                            color: Colors.blueAccent,
                            size: 28,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Address",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    this.userstate + ' ' + this.usercity,
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.info,
                            color: Colors.blueAccent,
                            size: 28,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Policy No.",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    'ID: ABC1234FQR',
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.mobile_screen_share,
                            color: Colors.blueAccent,
                            size: 28,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "IMEI",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    this.imei,
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/images/onboarding1.png",
                    width: 180,
                    height: 150,
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "  Plan Description",
                style: TextStyle(
                    color: Color(0xff242424),
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Color(0xffFBB97C),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            //width: MediaQuery.of(context).size.width/2 - 130,
                            child: Text(
                              "   Plan Purchased: \n" + this.plan + " birr/Day",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Color(0xffA5A5A5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            //width: MediaQuery.of(context).size.width/2 - 130,
                            child: Text(
                              "       Activation Started:\n" + this.sub,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}
