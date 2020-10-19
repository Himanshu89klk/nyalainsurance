import 'package:flutter/material.dart';
import 'package:insurance/policyinfo.dart';
import 'package:insurance/src/pages/ProfilePage.dart';
import 'package:insurance/src/pages/aboutcompany.dart';
import 'package:insurance/src/pages/raiseclaim.dart';
import 'package:insurance/src/pages/showreport.dart';
import 'package:insurance/src/pages/trackclaim.dart';
import 'package:insurance/src/pages/transaction.dart';

import 'howitworks.dart';

//import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final String uname, recordsetmsg, mobile;
  HomePage({Key key, @required this.uname, this.recordsetmsg, this.mobile})
      : super(key: key);
  var services = [
    "How It Works",
    "My Policy Doc",
    "Transaction",
    "Handset Report",
    "Profile",
    "About Company",
    "Raise Claim",
    "Track Claim"
  ];

  var images = [
    "images/broom.png",
    "images/adornment.png",
    "images/vacuum.png",
    "images/offices.png",
    "images/window.png",
    "images/house.png",
    "images/paint-roller.png",
    "images/cleaner.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
          itemCount: services.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2.6)),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 24,
                  ),
                  new InkResponse(
                    child: Image.asset(
                      images[index],
                      height: 60,
                      width: 60,
                    ),
                    onTap: () async {
                      if (index == 0) {
                        print('Thanks for 0 Only');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HowItWorks(uname: this.uname)),
                        );
                      }

                      if (index == 1) {
                        print('Thanks for 1 Only');
                        print('Phone=' + this.mobile.substring(8));
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
                      }
                      if (index == 2) {
                        print('Thanks for 5 Only');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Transaction(
                                  uname: this.uname, mobile: this.mobile)),
                        );
                      }

                      if (index == 3) {
                        print(recordsetmsg.split(" "));
                        print(recordsetmsg.split(",")[0]);
                        print(recordsetmsg.split(",")[1]);
                        print(recordsetmsg.split(",")[2]);
                        print(recordsetmsg.split(",")[3]);
                        print(recordsetmsg.split(",")[4]);
                        print(recordsetmsg.split(",")[5]);
                        print(recordsetmsg.split(",")[6]);
                        print(recordsetmsg.split(",")[7]);
                        print(recordsetmsg.split(",")[8]);
                        print(recordsetmsg.split(",")[9]);
                        print(recordsetmsg.split(",")[10]);
                        print(recordsetmsg.split(",")[11]);
                        print(recordsetmsg.split(",")[12]);
                        print(recordsetmsg.split(",")[13]);
                        print(recordsetmsg.split(",")[14]);
                        print(recordsetmsg.split(",")[15]);
                        print(recordsetmsg.split(",")[16]);
                        print(recordsetmsg.split(",")[17]);
                        print(recordsetmsg.split(",")[18]);
                        print(recordsetmsg.split(",")[19]);
                        print(recordsetmsg.split(",")[20]);
                        print(recordsetmsg.split(",")[21]);
                        print(recordsetmsg.split(",")[22]);
                        print(recordsetmsg.split(",")[23]);
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
                      }
                      if (index == 4) {
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
                      }
                      if (index == 5) {
                        print('Thanks for 5 Only');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutCompany(
                                    uname: this.uname,
                                  )),
                        );
                      }
                      if (index == 6) {
                        print('Thanks for 5 Only');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RaiseClaim(
                                  uname: this.uname, mobile: this.mobile)),
                        );
                      }
                      if (index == 7) {
                        print('Thanks for 5 Only');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrackClaim(
                                  uname: this.uname, mobile: this.mobile)),
                        );
                      } else
                        print(index);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      services[index],
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Montserrat",
                          height: 1,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
