import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:insurance/policyinfo.dart';
import 'package:insurance/src/pages/ProfilePage.dart';
import 'package:insurance/src/pages/showreport.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'drawer.dart';
import 'entermobile.dart';
import 'homePage.dart';

class MainPage extends StatefulWidget {
  final String uname, recordsetmsg;
  MainPage({Key key, @required this.uname, this.recordsetmsg})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MainState(uname, recordsetmsg);
  }
}

class _MainState extends State<MainPage> {
  DateTime pastMonth = DateTime.now().add(Duration(days: 1));
  String uname, recordsetmsg;
  var _currentIndex = 0;
  _MainState(this.uname, this.recordsetmsg);
  Future<void> initPlatformState() async {}

//new code

//new code end here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(
          uname: recordsetmsg.split(",")[1].substring(7).trim(),
          recordsetmsg: this.recordsetmsg,
          mobile: recordsetmsg.split(",")[3]),
      appBar: AppBar(
        title: Text("Nyala Insurance"),
        backgroundColor: Colors.pink,
        actions: <Widget>[
          new IconButton(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SpinKitHourGlass(
                              color: Colors.yellowAccent,
                              size: 40,
                            ),
                            Text(
                              '\n Back to Home',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
              new Future.delayed(new Duration(seconds: 1), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainPage(
                            uname:
                                recordsetmsg.split(",")[1].substring(7).trim(),
                            recordsetmsg: this.recordsetmsg,
                          )),
                );
              });
            },
          ),
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
                    recordsetmsg
                        .split(",")[1]
                        .substring(7)
                        .trim()
                        .toUpperCase() +
                    "!! Your Renewal is due on " +
                    this.pastMonth.toString().substring(0, 10) +
                    ". Kindly Make Sufficient Funds.",
                style: AlertStyle(
                  animationType: AnimationType.fromTop,
                  isCloseButton: true,
                  isOverlayTapDismiss: true,
                  // descStyle: TextStyle(fontWeight: FontWeight.bold),

                  animationDuration: Duration(milliseconds: 1000),
                  alertBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
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
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      onPressed: () => Navigator.pop(context),
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
          new IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 26,
            ),
            color: Colors.white,
            onPressed: () {
              Alert(
                context: context,
                //type: AlertType.error,
                title: "Logout",
                desc:
                    "Are You Sure You want to Logout form Nyala-Insurance App",
                style: AlertStyle(
                  animationType: AnimationType.fromTop,
                  isCloseButton: false,
                  isOverlayTapDismiss: true,
                  // descStyle: TextStyle(fontWeight: FontWeight.bold),

                  animationDuration: Duration(milliseconds: 500),
                  alertBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
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
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnterMobile(imei: 'abcd')),
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
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      onPressed: () => Navigator.pop(context),
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
        iconTheme: IconThemeData(
          color: Colors.white,
        ),

        //automaticallyImplyLeading: false,
      ),
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
                            uname:
                                recordsetmsg.split(",")[1].substring(7).trim(),
                            recordsetmsg: this.recordsetmsg,
                          )),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PolicyInfo(
                      uname: recordsetmsg.split(",")[1].substring(7).trim(),
                      recordsetmsg: this.recordsetmsg,
                      userstate: recordsetmsg.split(",")[25],
                      usercity: recordsetmsg.split(",")[26],
                      imei: recordsetmsg.split(",")[4],
                      plan: recordsetmsg.split(",")[21],
                      sub: recordsetmsg.split(",")[22],
                    ),
                  ),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowReport(
                            mob: recordsetmsg.split(",")[3],
                            uname:
                                recordsetmsg.split(",")[1].substring(7).trim(),
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
                            uname:
                                recordsetmsg.split(",")[1].substring(7).trim(),
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
                icon: Icon(Icons.mobile_screen_share),
                title: Text("Quality Check")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Profile")),
          ]),
      body: getBodyWidget(),
    );
  }

  getBodyWidget() {
    return (_currentIndex == 0)
        ? HomePage(
            uname: recordsetmsg.split(",")[1].substring(7).trim(),
            recordsetmsg: this.recordsetmsg,
            mobile: recordsetmsg.split(",")[3],
          )
        : Container();
  }
}
