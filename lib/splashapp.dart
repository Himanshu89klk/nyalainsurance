import 'package:flutter/rendering.dart';
import 'package:insurance/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:insurance/checksub.dart';
//import 'package:insurance/agreecontinue.dart';
//import 'package:insurance/entermobile.dart';
import 'src/theme/theme.dart';

void main() => runApp(SplashApp());

class SplashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        //theme: ThemeData(primarySwatch: Colors.blue, ),
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToHome();
      } else {
        _navigateToHome();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => CheckSub()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: new BoxDecoration(color: Colors.black),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(opacity: 1, child: Image.asset('assets/img/white.png')),
            // Padding(
            // padding: EdgeInsets.all(0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 90,
                ),
                Opacity(
                    opacity: 1,
                    //child: Image.asset('assets/img/black.png')
                    child: Image.asset(
                      'images/insurance.png',
                      height: 200,
                      width: 200,
                    )),
                FadeAnimation(
                  1,
                  Text(
                    "NYALA",
                    style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 44,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1.3,
                    Text(
                      "Mobile Insurance",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ],
            ),
            //),
          ],
        ),
      ),
      /*bottomNavigationBar: BottomAppBar(
        child: Image.asset(
          'images/insurance.png',
          height: 50,
          width: 50,
          alignment: Alignment.bottomRight,
        ),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/vasplanet.png',
                height: 50,
                width: 50,
              ),
              title: new Text(
                'VASPLANET',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/0.png',
                height: 10,
                width: 10,
              ),
              title: new Text(
                '@ Nyala Co. Ltd',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/SZM.png',
                height: 50,
                width: 50,
              ),
              title: new Text(
                'SZM',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ))
        ],
      ),
    );
  }
}
