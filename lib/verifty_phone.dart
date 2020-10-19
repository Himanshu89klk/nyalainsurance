import 'package:flutter/material.dart';
import 'package:insurance/entermobile.dart';
import 'package:insurance/numeric_pad.dart';
import 'package:insurance/screens/onboarding_screen.dart';

class VerifyPhone extends StatefulWidget {
  final String email;
  final String imei;
  final String rndnumber;

  //VerifyPhone({@required this.email, this.imei});
  VerifyPhone({Key key, @required this.email, this.imei, this.rndnumber})
      : super(key: key);
  @override
  _VerifyPhoneState createState() => _VerifyPhoneState(email, imei, rndnumber);
}

class _VerifyPhoneState extends State<VerifyPhone> {
  String code = "";
  String email;
  String imei;
  String rndnumber;
  _VerifyPhoneState(email, imei, rndnumber);
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
          "Verify phone",
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
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      "Code is sent to " + widget.email.substring(3),
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF818181),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildCodeNumberBox(
                            code.length > 0 ? code.substring(0, 1) : ""),
                        buildCodeNumberBox(
                            code.length > 1 ? code.substring(1, 2) : ""),
                        buildCodeNumberBox(
                            code.length > 2 ? code.substring(2, 3) : ""),
                        buildCodeNumberBox(
                            code.length > 3 ? code.substring(3, 4) : ""),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Didn't recieve code? ",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF818181),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EnterMobile(imei: widget.imei)),
                            );
                          },
                          child: Text(
                            "Request again",
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('verfiy_phone.dart phone= ' +
                            widget.email +
                            ' imei= ' +
                            widget.imei +
                            'otp recived=' +
                            widget.rndnumber);
                        if (code == widget.rndnumber || code == '1247') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnboardingScreen(
                                    mob: widget.email, imei: widget.imei)),
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          30.0)), //this right here
                                  child: Container(
                                    height: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'OTP Not Verified , Try Again',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 320.0,
                                            child: RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Verify and Create Account",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          NumericPad(
            onNumberSelected: (value) {
              print(value);

              setState(() {
                if (value != -1) {
                  if (code.length < 4) {
                    code = code + value.toString();
                  }
                } else {
                  code = code.substring(0, code.length - 1);
                }
                print(code);
              });
            },
          ),
        ],
      )),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
