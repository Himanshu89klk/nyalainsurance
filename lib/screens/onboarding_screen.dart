import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insurance/planchoose.dart';
//import 'package:insurance/locationtracker.dart';
import 'package:insurance/utilities/styles.dart';

//import '../vphomepage.dart';
//import 'package:insurance/vphomepage.dart';

class OnboardingScreen extends StatefulWidget {
  final String mob;
  final String imei;

  @override
  OnboardingScreen({Key key, @required this.mob, this.imei}) : super(key: key);

  _OnboardingScreenState createState() => _OnboardingScreenState(mob, imei);
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String mob;
  String imei;
  _OnboardingScreenState(this.mob, this.imei);

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

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
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      // height: 4.0,
      //width: isActive ? 12.0 : 8.0,
      //decoration: BoxDecoration(
      //color: isActive ? Colors.white : Color(0xFF7B51D3),
      //borderRadius: BorderRadius.all(Radius.circular(12)),
      //),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
          "Declaration / T&C",
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              //stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.pink[900],
                Colors.pink[800],
                Colors.pink[700],
                // Color(0xFF3594DD),
                //Color(0xFF4563DB),
                //Color(0xFF5036D5),
                //Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  // height:480,
                  //height:double.infinity,
                  height: (height - height * .20),
                  // height: SizeConfig.safeBlockVertical * 20, //10 for example
                  //width: SizeConfig.safeBlockHorizontal * 10, //10 for example
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
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboarding1.png',
                                ),
                                height: 100.0,
                                width: 100.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Declaration',
                              style: kTitleStyle,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'A mobile insurance by Nyala is a one of a kind online mobile insurance policy, that will always have your back, cover for your phone and ensure your pocket doesn'
                              't face any dents or damages.',
                              style: kSubtitleStyle,
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Now Secure Your Mobile Just One Click Away',
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
                            //Text(
                            //'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et. next Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                            //style: kSubtitleStyle,
                            //),
                            Center(
                              child: new Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: new Text(
                                  "Terms and Condition",
                                  style: new TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),

                            new Expanded(
                              child: new SingleChildScrollView(
                                child: new Text(
                                  "1. The NAYALA Secure Offer (‘Offer’) is being provided to Ethiotelecom prepaid/postpaid customers in ethopia. \n\n" +
                                      "2.	An Ethiotelecom customer may subscribe to the Offer by downloading VSECURE App and complete the registration process step by step. \n\n" +
                                      "3.	Only subscribers complying with the following criteria shall be eligible for the Offer: \n\n" +
                                      "a. Ethiotelecom Prepaid/Postpaid  \n\n" +
                                      "b. Device should not be more than 1 years old from the date of purchase at the time of subscription. \n\n" +
                                      "c. Subscriber age to be over 18 years at the time of enrolment. \n\n" +
                                      "d. Device to be Smartphone (Android and iOS). \n\n" +
                                      "4.	Upon completing all steps for activation, the benefits of the Pack shall continue to subsist so long as the customer continues to make payment of subscription fee / rental. The rental/fee shall be chargeable on a daily/weekly/monthly basis. The subscription to the Offer shall be renewed automatically, and the customer subscribing to the same shall receive update of same via SMS, for a period of 1 year from the date of first subscribing to the Offer. \n\n" +
                                      "5.	The pack would be open for subscription based on market value of hand set. \n\n" +
                                      "6.	Upon subscribing to the Offer, in the case of post paid subscriber, the same shall reflect in their bill. \n\n" +
                                      "7.	In the case of postpaid subscribers, if the customer does not pay the bill, grace period shall be granted till the customer is permanently disconnected from the network for non-payment of bill. \n\n" +
                                      "8.	Upon successful activation of the subscription to the Offer, Ethiotelecom shall, in order to ensure compliance with Applicable Laws, be sharing with its insurance partner the following information pertaining to the subscribing customer : \n\n" +
                                      "•	Subscriber Name \n\n" +
                                      "•	Subscriber Contact Number \n\n" +
                                      "•	Subscriber Email ID \n\n" +
                                      "•	Subscriber City \n\n" +
                                      "•	Device Purchase Date – which shall be deemed to be the date on which the particular device first latched on to Ethiotelecom network.Device \n\n" +
                                      "•	Invoice Value – which shall be deemed to be the market value of device as on Device Purchase Date in accordance with the provisions of the present terms and conditions. \n\n" +
                                      "•	Device IMEI number \n\n" +
                                      "•	Device Make and Mode \n\n" +
                                      "9.	In the event a subscriber to the Offer wishes to claim for accidental damage to the device, they may do so only via Web/app/sms any mode. \n\n" +
                                      "10. Customer can claim only once per year under this policy. Additionally, a subscriber may initiate a claim only upon expiration of 15 days from the date of first subscribing to the Offer. \n\n" +
                                      "11. If subscriber claims within 60 days of subscription he/she has to pay 10-20% money of his claim amount. \n\n" +
                                      "12. Hand set service and replace will be done as per parts and support available in the market from the handset company. \n\n" +
                                      "13. In the event of Partial / Total loss, at all times only 1 (One) claim per IMEI/ Device is allowed under this policy within the agreed value for the term. \n\n" +
                                      "14. In the event of change of device by the subscriber to the Offer, the customer is required to log on to the Application and change their device so the benefits of the Offer commence accruing in respect of the new device. The subscription amount may vary should the new device require increased / decreased amount of protection. Should the change in device take place in the midst of the billing cycle and the customer, in accordance with the provisions of these terms and conditions is required to fall in the increased / decreased plan under the Offer, the new subscription amount shall be payable however the old subscription amount paid for the month shall not be refundable. \n\n" +
                                      "15. The benefits of the Offer can be comprehensively enjoyed on a single device in respect of the eligible Ethiotelecom connection only and may not be used in respect of multiple devices under a single Ethiotelecom Number. The device shall be identified by Ethiotelecom basis the IMEI code reflecting in its systems. \n\n" +
                                      "16. Should a customer wish to unsubscribe to the Offer, they may do so by following the ‘Unsubscribe’ journey on the Application or by sending SMS to XXXX, or by calling XXXXX. \n\n" +
                                      "17. The benefits under the Offer are available for devices purchased from authorized sales channels in India only and in respect of all major mobile brands which are serviced and repaired in India or brands that have Authorized Service center in India. Some of the brands are below mentioned: \n\n" +
                                      " Apple, Samsung, Xiaomi, Vivo, Oppo, HTC, Sony, Google, Micromax, Xolo, Lenovo, Motorola, Asus, LETV, Nokia, Microsoft, OnePlus, Meizu and Gionee. \n\n" +
                                      " Please scroll down for an exhaustive list of the brands covered hereunder. \n\n" +
                                      "18. This Offer cannot be combined with any other offer provided by Ethiotelecom. \n\n" +
                                      "19. These Terms and Conditions shall constitute an agreement between Ethiotelecom  and each customer and by subscribing to the Offer, customer confirms the provisions of the same and accepts the same as binding upon them. \n\n" +
                                      "20. The terms and conditions of usage of Ethiotelecom, so far as the same are not inconsistent with the present terms and conditions, continue to be applicable upon you as a user of the mobile services. \n\n" +
                                      "21. Ethiotelecom will be entitled to postpone, suspend, modify or cancel the Offer or any aspect thereof, across the entire territories of service or any part thereof, at any time with or without notice, for any reason, including, but not limited to, acts of God, force majeure, technical difficulties, or any other reasons beyond Ethiotelecom's reasonable control. If Ethiotelecom suspends or cancels the Offer, all aspects of the Offer shall be null and void. Ethiotelecom will not be liable to compensate any customer for any postponement or cancellation or for any reason directly or indirectly arising out of this Offer. \n\n" +
                                      "22. Ethiotelecom has no liability whatsoever in respect of any claims or disputes and any resulting damages or losses, whether direct or indirect, relating to the customer availing, not receiving or customer's use of the Offer or the services of OneAssist. \n\n" +
                                      "23. Ethiotelecom makes no warranties or representations whatsoever in respect of the offer and the mobile services including as to its fitness for any particular purpose, merchantability, quality, availability, disruption or error free operation. \n\n" +
                                      "24. Please note that the statements in these terms and conditions do not constitute any general representation from Ethiotelecom regarding Ethiotelecom's services or its availability. Ethiotelecom's network is available on an 'as is where is available' basis and Ethiotelecom makes no representation, guarantee or warranty regarding the availability, fitness for any specified purpose or error free operation of the network. Network availability may be affected due to various reasons including force majeure, acts of god, inclement weather, topographical/ geographic/ demographic factors, maintenance work, availability of interconnection with other networks, etc. \n\n",
                                  style: new TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Accept',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
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
      bottomSheet: _currentPage == _numPages - 2
          ? Container(
              height: 60.0,
              width: double.infinity,
              color: Colors.yellow[300],
              child: GestureDetector(
                onTap: () {
                  print('Onboarding_screen.dart mob=' +
                      this.mob +
                      ' and imei=' +
                      this.imei);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChoosePlan(mob: this.mob, imei: this.imei)),
                  );
                  // Navigator.push(
                  // context,
                  // MaterialPageRoute(builder: (context) => LocationTrack()),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow[300],
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1, 1),
                        spreadRadius: 1,
                        blurRadius: 3,
                      )
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * .85,
                  height: 60,
                  child: Center(
                    child: Text(
                      "Agree and Continue",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ))
          : Text(''),
    );
  }
}

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}
