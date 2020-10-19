//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insurance/policyinfo.dart';
import 'package:insurance/src/pages/ProfilePage.dart';
import 'package:insurance/src/pages/raiseclaim.dart';
import 'package:insurance/src/pages/transaction.dart';

import 'entermobile.dart';
//import 'package:flutter/services.dart';

class NavDrawer extends StatelessWidget {
  final String uname, recordsetmsg, mobile;
  NavDrawer({
    Key key,
    @required this.uname,
    this.recordsetmsg,
    this.mobile,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 160.0,
            color: Colors.pink[700],
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/onboarding0.png",
                        height: 60,
                        //color: Colors.pink,
                      ),
                      Text(
                        '   Nyala',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                      Text(
                        ' Insurance',
                        style: TextStyle(color: Colors.pink, fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Welcome ' + this.uname + ' !!',
                        style: TextStyle(color: Colors.pink, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(225, 10, 27, .3),
                        blurRadius: 100,
                        offset: Offset(0, 10))
                  ]),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.input,
              color: Colors.blue,
            ),
            title: Text(
              'My Policy',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => {
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
              )
            },
          ),
          Divider(
            height: 5,
            thickness: 1,
            color: Colors.black.withOpacity(0.3),
            indent: 32,
            endIndent: 32,
          ),
          ListTile(
            leading: Icon(
              Icons.verified_user,
              color: Colors.blue,
            ),
            title: Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => {
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
              )
            },
          ),
          Divider(
            height: 5,
            thickness: 1,
            color: Colors.black.withOpacity(0.3),
            indent: 32,
            endIndent: 32,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: Text(
              'Claim',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        RaiseClaim(uname: this.uname, mobile: this.mobile)),
              )
            },
          ),
          Divider(
            height: 5,
            thickness: 1,
            color: Colors.black.withOpacity(0.3),
            indent: 32,
            endIndent: 32,
          ),
          ListTile(
            leading: Icon(
              Icons.border_color,
              color: Colors.blue,
            ),
            title: Text(
              'Transaction',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Transaction(uname: this.uname, mobile: this.mobile)),
              )
            },
          ),
          Divider(
            height: 5,
            thickness: 1,
            color: Colors.black.withOpacity(0.3),
            indent: 32,
            endIndent: 32,
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.blue,
            ),
            title: Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => EnterMobile(imei: 'abcd')),
              )
            },
          ),
        ],
      ),
    );
  }
}
