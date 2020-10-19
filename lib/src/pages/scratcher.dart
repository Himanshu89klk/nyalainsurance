import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:insurance/src/pages/report.dart';
import 'package:insurance/src/pages/snackbar.dart';
//import 'package:insurance/src/pages/savedata.dart';
import 'package:scratcher/scratcher.dart';

//void main() => runApp(MyApp());
class ScratchApp extends StatelessWidget {
  final String uname;
  final String plan;
  final String mob;
  final String imei;
  final String userstate, usercity;
// Receiving Email using Constructor.
  ScratchApp(
      {Key key,
      @required this.mob,
      this.uname,
      this.plan,
      this.imei,
      this.userstate,
      this.usercity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            "Screen Test",
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
        body: ScratchAppBody(mob, uname, plan, imei, userstate, usercity),
      ),
    );
  }
}

class ScratchAppBody extends StatelessWidget {
  String uname;
  String pass;
  String touch;
  String plan;
  String mob;
  String imei, userstate, usercity;
  int nvalue;
  ScratchAppBody(this.mob, this.uname, this.plan, this.imei, this.userstate,
      this.usercity);
  double _opacity = 0.0;

  Future<void> scratchCardDialog(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Scratch Complete Black Screen ',
              // this.plan,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          content: StatefulBuilder(builder: (context, StateSetter setState) {
            return Scratcher(
              accuracy: ScratchAccuracy.low,
              threshold: 90,
              brushSize: 50,
              onChange: (value) {
                print("Scratch progress: $value%");
              },

              onThreshold: () {
                setState(() {
                  _opacity = 1;
                  nvalue = 90;
                });
              },
              //imagePath: "assets/diamond_bw.png",
              //Image.asset("assets/diamond_bw.png", height: 22,),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 250),
                opacity: _opacity,
                child: Container(
                  height: height,
                  width: width,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        child: Insurance(),
                      ),
                      Text(
                        'Test Successful above 80%',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[700],
                        ),
                      ),
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text(
                          "\n\n Next ->",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          setState(() {
                            touch = 'Success';
                          });
                          print('scratcher.dart value of imei  = ' +
                              this.imei +
                              ' and phone=  ' +
                              this.mob +
                              ' Plan=' +
                              this.plan);
                          //Navigator.push( context,MaterialPageRoute(builder: (context) => SaveData(uname: this.uname,pass:this.pass)),);
                          if (nvalue == 90) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SnackBarDemo(
                                      mob: this.mob,
                                      uname: this.uname,
                                      pass: this.pass,
                                      plan: this.plan,
                                      imei: this.imei,
                                      userstate: this.userstate,
                                      usercity: this.usercity)),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: BorderSide.none,
              ),
              color: Colors.lightBlue,
              child: Text(
                "Screen Test begin to verfiy\nQuality of Touch Screen\n\n\nStart Screen Test",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onPressed: () => scratchCardDialog(context),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: FlatButton(
                  onPressed: () => scratchCardDialog(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class Insurance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/insurance.png');
    Image image = Image(image: assetImage, height: 200, width: 200);
    return Container(
      child: image,
    );
  }
}
