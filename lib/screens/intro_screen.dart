import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insurance/utilities/styles.dart';

import '../entermobile.dart';

class IntroScreen extends StatefulWidget {
  final String imei;
  @override
  IntroScreen({Key key, @required this.imei}) : super(key: key);
  _OnboardingScreenState createState() => _OnboardingScreenState(imei);
}

class _OnboardingScreenState extends State<IntroScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  String imei;
  _OnboardingScreenState(this.imei);
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 16.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.pink[400],
                Colors.pink[600],
                Colors.pink[700],
                Colors.pink[800],
                /*Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),*/
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      print(
                          'value of imei on Intro_Screen.dart = ' + this.imei);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnterMobile(imei: this.imei)),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 450.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/intro0.png',
                                ),
                                height: 100.0,
                                width: 100.0,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Mobile Insurance',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Nyala insurance offers protection against a number of perils and damages to the phone.\nFor higher value smartphones, this protection is even more important .',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/intro1.png',
                                ),
                                height: 100.0,
                                width: 100.0,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Subscribe Insurance',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'It’s always a better option to protect your mobile with mobile insurance.\n\nIt can be beneficial for old as well as new phones.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/intro2.png',
                                ),
                                height: 100.0,
                                width: 100.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Nyala Insurance Covers',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              '> Damage caused due to malicious intent.\n> Screen damage.\n> Damage to the interior or exterior components of the device.\n> Many More..',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              //mainAxisSize: MainAxisSize.,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 28.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 80.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  print('value of imei on Intro_Screen.dart = ' + this.imei);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EnterMobile(imei: this.imei)),
                  );
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
