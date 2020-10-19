//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:insurance/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insurance/mainPage.dart';
import 'package:insurance/src/pages/sms.dart';
//import 'package:insurance/agreecontinue.dart';
//import 'package:insurance/screens/onboarding_screen.dart';
//import 'package:insurance/agreecontinue.dart';
//import 'package:insurance/deviceinfo.dart';
//import 'package:insurance/registration.dart';
//import 'package:insurance/src/pages/home_page.dart';
//import 'package:insurance/src/pages/scratcher.dart';
import 'package:insurance/verifty_phone.dart';

//import 'src/theme/theme.dart';

class EnterMobile extends StatefulWidget {
  final String imei;
  @override
  EnterMobile({Key key, @required this.imei}) : super(key: key);
  CheckUserState createState() => CheckUserState(imei);
}

class CheckUserState extends State {
  bool visible = false;
  String imei;
  int index;
  CheckUserState(this.imei);

  // Getting value from TextField widget.
  final emailInput = TextEditingController();

  Future userCheck() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String email = emailInput.text;

    int emailLength = email.length;
    if ((emailLength > 1 && emailLength < 9) || emailLength > 9) {
      print('wrong mobile entered=' + email);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)), //this right here
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Entered Mobile is Incorrect, Kindly Enter Correct Value',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 320.0,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              visible = false;
                            });
                            //Navigator.push(context,MaterialPageRoute(builder: (context) => AppPage()),);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "OK",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }
    if (emailLength == 9) {
// new code

//new code end

      // SERVER API URL
      //var url = 'http://172.20.10.2/vpsecure/register_user.php';
      print(emailLength);
      email = '251' + email;
      var rndnumber = "";
      var rnd = new Random();
      for (var i = 0; i < 4; i++) {
        rndnumber = rndnumber + rnd.nextInt(9).toString();
      }
      print(rndnumber);
      var url = 'https://www.vasplanet.in/flutter/new_user.php';
      //var url = 'http://196.188.95.131:8086/charge/new_user.php';

      // Store all data with Param Name.
      var data = {'email': email, 'password': rndnumber};

      // Starting Web API Call.
      var loginresponse = await http.post(url, body: json.encode(data));

      // Getting Server loginresponse into variable.
      var loginmessage = jsonDecode(loginresponse.body);
      print('enter mobile message respose ' + loginmessage);

      // If Web call Success than Hide the CircularProgressIndicator.
      if (loginresponse.statusCode == 200) {
        print(loginresponse.statusCode);
        print(json.decode(loginresponse.body));
        setState(() {
          visible = false;
        });
      } else {
        print(loginresponse.statusCode);
      }

      // if(loginmessage == 'Login Matched'){
      if (loginmessage == 'OK') {
        // If Email or Password Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = true;
        });
        var url2 = 'https://www.vasplanet.in/flutter/billing_check.php';
        //var url = 'http://196.188.95.131:8086/charge/new_user.php';
        print('Url 2 Hit ' +
            url2 +
            ' email and password ' +
            email +
            " " +
            rndnumber);
        // Store all data with Param Name.
        var datab = {'email': email, 'password': rndnumber};

        // Starting Web API Call.
        var loginstat = await http.post(url2, body: json.encode(datab));

        // Getting Server loginresponse into variable.
        var billingstatus = jsonDecode(loginstat.body);
        print('Billing status=' + billingstatus);

        // If Web call Success than Hide the CircularProgressIndicator.
        if (loginstat.statusCode == 200) {
          print(loginresponse.statusCode);
          print(json.decode(loginresponse.body));
          setState(() {
            visible = false;
          });
        } else {
          print(loginstat.statusCode);
        }

        if (billingstatus == 'success') {
          var url1 = 'http://www.vasplanet.in/flutter/fetch.php';
          //var url = 'http://196.188.95.131:8086/charge/new_user.php';

          // Store all data with Param Name.
          var data = {'mobile': email};

          // Starting Web API Call.
          var recordset = await http.post(url1, body: json.encode(data));

          // Getting Server loginresponse into variable.
          var recordsetmsg = jsonDecode(recordset.body);
          print(recordsetmsg);
          // Showing Alert Dialog with loginresponse JSON loginmessage.

          // Showing Alert Dialog with loginresponse JSON loginmessage.
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30.0)), //this right here
                  child: Container(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome !! Now you Can Protect Your Mobile here. ',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 320.0,
                            child: RaisedButton(
                              onPressed: () {
                                //Navigator.push(context,MaterialPageRoute(builder: (context) => AppPage()),);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainPage(
                                          uname: loginmessage.toString(),
                                          recordsetmsg:
                                              recordsetmsg.toString()),
                                    ));
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        }
        if (billingstatus == 'pending') {
          setState(() {
            visible = false;
          });

          print('entermobile.dart value of imei  = ' +
              this.imei +
              ' and phone=  ' +
              email +
              ' OTP=' +
              rndnumber);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyPhone(
                    email: email, imei: this.imei, rndnumber: rndnumber)),
          );
        }
      }
      if (loginmessage == 'pending') {
        // If Email or Password Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SendSms(),
            ));
      }

      if (loginmessage == 'OTP Sent') {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SendSms(),
            ));
        /* print('entermobile.dart value of imei  = ' +
            this.imei +
            ' and phone=  ' +
            email +
            ' OTP=' +
            rndnumber);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyPhone(
                  email: email, imei: this.imei, rndnumber: rndnumber)),
        );*/

      }
    }
    if (emailLength == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please Insert Your Phone Number to Receive OTP ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 320.0,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              visible = false;
                            });
                            //Navigator.push(context,MaterialPageRoute(builder: (context) => AppPage()),);
                            Navigator.pop(context);

                            //for testing commented and new navigation added
                            //Navigator.push( context,MaterialPageRoute(builder: (context) => VPHomePage()),);
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScratchApp(
                                      mob: 'abcd', uname: 'test user')),
                            );*/

                            // Navigator.push(
                            // context,
                            //  MaterialPageRoute(
                            //   builder: (context) =>
                            //       AppFooter(uname: 'test user')),
                            // );
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }
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
          "OTP Verification",
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
                colors: [Colors.white, Colors.white, Colors.white])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 0,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Insurance(),
                  Row(
                    children: <Widget>[
                      FadeAnimation(
                        1,
                        Text(
                          "NYALA ",
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      FadeAnimation(
                        1,
                        Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //FadeAnimation(1, Text("VP-Secure Login", style: TextStyle(color: Colors.white, fontSize: 22),)),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "A Complete Mobile Protection Solution",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(22),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.4,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(225, 10, 27, .3),
                                        blurRadius: 50,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: emailInput,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          icon: const Icon(
                                              Icons.mobile_screen_share,
                                              color: Colors.black),
                                          labelText: "Without Prerix 251",
                                          hintText: "Enter Your Mobile",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                            1.6,
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.green[800]),
                              child: RaisedButton(
                                onPressed: userCheck,
                                color: Colors.pink,
                                textColor: Colors.white,
                                splashColor: Colors.yellow[200],
                                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                                child: Text('Send OTP'),
                              ),
                            )),
                        Visibility(
                            visible: visible,
                            child: Container(
                                margin: EdgeInsets.only(bottom: 30),
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.yellow),
                                ))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
    Image image = Image(image: assetImage, height: 120, width: 120);
    return Container(
      child: image,
    );
  }
}
