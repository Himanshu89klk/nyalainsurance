import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:insurance/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insurance/src/pages/scratcher.dart';
//import 'package:insurance/main.dart';
//import 'package:insurance/vphomepage.dart';

//void main() => runApp(Signup());

//class Signup extends StatelessWidget {
// @override
//Widget build(BuildContext context) {
//  return MaterialApp(home: Scaffold(body: Center(child: RegisterUser())));
//}
//}

//class RegisterUser extends StatefulWidget {
// RegisterUserState createState() => RegisterUserState();
//}

class Signup extends StatefulWidget {
  final String uname;
  final String plan;
  final String mob;
  final String imei;
  @override
  // ReportPageState createState() => ReportPageState();
  Signup({Key key, @required this.imei, this.mob, this.uname, this.plan})
      : super(key: key);
  RegisterUserState createState() => RegisterUserState(imei, mob, uname, plan);
}

class RegisterUserState extends State {
  String uname;
  String plan;
  String mob;
  String imei, userstate, usercity;
  // Boolean variable for CircularProgressIndicator.
  bool visible = false;
  bool _namevalidate = false;
  bool _emailvalidate = false;
  bool _addressvalidate = false;

  // Getting value from TextField widget.
  final nameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final handsetvalueController = TextEditingController();
  //final amobileController = TextEditingController();

  final imeiController = TextEditingController();
  RegisterUserState(this.imei, this.mob, this.uname, this.plan);

  //final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];

  Future userRegistration() async {
    // Showing CircularProgressIndicator.

    setState(() {
      nameController.text.isEmpty
          ? _namevalidate = true
          : _namevalidate = false;
      lnameController.text.isEmpty
          ? _namevalidate = true
          : _namevalidate = false;
      emailController.text.isEmpty
          ? _emailvalidate = true
          : _emailvalidate = false;
      addressController.text.isEmpty
          ? _addressvalidate = true
          : _addressvalidate = false;
    });
    String name = nameController.text;
    String lname = lnameController.text;
    String email = emailController.text;
    String address = addressController.text;
    String amobile = this.mob;
    //String imei = this.imei;

    if (_namevalidate == false &&
        _emailvalidate == false &&
        _addressvalidate == false) {
      // Getting value from Controller
      visible = true;
      // SERVER API URL
      //var url = 'http://172.20.10.2/vpsecure/register_user.php';
      var url = 'http://www.vasplanet.in/flutter/register_user.php';
      //var url = 'http://196.188.95.131:8086/charge/register_user.php';
      // Store all data with Param Name.
      var data = {
        'name': name,
        'lname': lname,
        'email': email,
        'address': address,
        'amobile': amobile,
      };
      print(json.encode(data));

      // Starting Web API Call.
      var response = await http.post(url, body: json.encode(data));

      // Getting Server response into variable.
      var message = jsonDecode(response.body);

      int len = message.length;
      // If Web call Success than Hide the CircularProgressIndicator.
      if (response.statusCode == 200) {
        setState(() {
          visible = false;
        });
      }
      if (message ==
          'Email Already Exist, Please Try Again With New Email Address..!') {
        len = 0;
      }

      // Showing Alert Dialog with Response JSON Message.
      if (len >= 1) {
        print('registration.dart value of imei  = ' +
            this.imei +
            ' and phone=  ' +
            mob +
            ' Plan=' +
            this.plan);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ScratchApp(
                  mob: mob,
                  uname: name,
                  plan: this.plan,
                  imei: this.imei,
                  userstate: this.userstate,
                  usercity: this.usercity)),
        );
        /* showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0)), //this right here
                child: Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                        SizedBox(
                          width: 320.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScratchApp(
                                        mob: mob,
                                        uname: name,
                                        plan: this.plan)),
                              );
                            },
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: const Color(0xFFC51162),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });*/
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0)), //this right here
                child: Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                        SizedBox(
                          width: 320.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup(
                                          imei: this.imei,
                                          mob: this.mob,
                                          uname: this.uname,
                                          plan: this.plan,
                                        )),
                              );
                            },
                            child: Text(
                              "Register Again",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: const Color(0xFFC51162),
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
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Map<String, String> stateCity = {
    "Addis Ababa": "Addis Ababa",
    "Mekelle": "Tigray",
    "Gondar": "Amhara",
    "Adama": "Oromia",
    "Hawassa": "SNNPR",
    "Bahir Dar": "Amhara",
    "Dire Dawa": "Dire Dawa",
    "Sodo": "SNNPR",
    "Dessie": "Amhara",
    "Jimma": "Oromia",
    "Jijiga": "Somali",
    "Shashamane": "Oromia",
    "Bishoftu": "Oromia",
    "Arba Minch": "SNNPR",
    "Hosaena": "SNNPR",
    "Harar": "Harar",
    "Dilla": "SNNPR",
    "Nekemte": "Oromia",
    "Debre Birhan": "Amhara",
    "Asella": "Oromia",
    "Debre Mark os": "Amhara",
    "Kombolcha": "Amhara",
    "Debre Tabor": "Amhara",
    "Adigrat": "Tigray",
    "Woldiya": "Amhara",
    "Sebeta": "Oromia",
    "Burayu": "Oromia",
    "Shire (Inda Selassie)": "Tigray",
    "Ambo": "Oromia",
    "Arsi Negele": "Oromia",
    "Aksum": "Tigray",
    "Gambela": "Gambela",
    "Bale Robe": "Oromia",
    "Butajira": "SNNPR",
    "Ziway": "Oromia",
    "Adwa": "Tigray",
    "Areka": "SNNPR",
    "Yirgalem": "SNNPR",
    "Woliso": "Oromia",
    "Welkite": "SNNPR",
    "Gode": "Somali",
    "Meki": "Oromia",
    "Negele Borana": "Oromia",
    "Alaba Kulito": "SNNPR",
    "Alamata": "Tigray",
    "Chiro": "Oromia",
    "Tepi": "SNNPR",
    "Durame": "SNNPR",
    "Goba": "Oromia",
    "Asosa": "Benishangul-Gumuz",
    "Boditi": "SNNPR",
    "Gimbi": "Oromia",
    "Wukro": "Tigray",
    "Alemaya": "Oromia",
    "Mizan Teferi": "SNNPR",
    "Sawla": "SNNPR",
    "Modjo": "Oromia",
    "Dembi Dolo": "Oromia",
    "Aleta Wendo": "SNNPR",
    "Metu": "Oromia",
    "Mota": "Amhara",
    "Fiche": "Oromia",
    "Finote Selam": "Amhara",
    "Bule Hora Town": "Oromia",
    "Bonga": "SNNPR",
    "Kobo": "Amhara",
    "Jinka": "SNNPR",
    "Dangila": "Amhara",
    "Degehabur": "Somali",
    "Wolaita Dimtu": "SNNPR",
  };

  List<String> state = [
    'Addis Ababa',
    'Tigray',
    'Amhara',
    'Oromia',
    'SNNPR',
    'Dire Dawa',
    'Somali',
    'Harar',
    'Gambela',
    'Benishangul-Gumuz'
  ];
  List<String> city = [];

  String selectedState;
  String selectedcity;
  //The list of values we want on the dropdown
  //String _currentlySelected = "";
  var geners;
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
          "Save Profile",
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
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          //Colors.pink[900],
          //Colors.pink[800],
          //Colors.pink[400]
          Colors.white10,
          Colors.white12,
          Colors.white24
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // FadeAnimation(1, Text("Register Information", style: TextStyle(color: Colors.white, fontSize: 22),)),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "images/insurance.png",
                        height: 80,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: <Widget>[
                          FadeAnimation(
                            1,
                            Text(
                              "Register ",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          FadeAnimation(
                            1,
                            Text(
                              "Information",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            //SizedBox(height: 5),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(0))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.4,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(225, 10, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    //child: Text('Plan Selected = ' + this.plan),
                                    child: Text(
                                      'Plan Selected = ' +
                                          this.plan +
                                          ' birr/Day',
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      controller: nameController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          icon: const Icon(Icons.person,
                                              color: Colors.teal),
                                          hintText: "First Name",
                                          errorText: _namevalidate
                                              ? 'Value Can\'t Be Empty'
                                              : null,
                                          hintStyle: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      controller: lnameController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          icon: const Icon(Icons.person,
                                              color: Colors.teal),
                                          hintText: "Last Name",
                                          errorText: _namevalidate
                                              ? 'Value Can\'t Be Empty'
                                              : null,
                                          hintStyle: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          icon: const Icon(Icons.mail,
                                              color: Colors.teal),
                                          hintText: "Email Id",
                                          errorText: _emailvalidate
                                              ? 'Value Can\'t Be Empty'
                                              : null,
                                          hintStyle: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: DropdownButtonFormField(
                                      icon: const Icon(Icons.location_city,
                                          color: Colors.teal),
                                      hint: Text('Select State'),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedState = value;
                                          selectedcity = null;
                                          city.clear();
                                          stateCity.forEach((k, v) {
                                            //print(k);
                                            if (selectedState == v) {
                                              city.add(k);
                                            }
                                          });
                                          userstate = value;
                                          print('userstate=' + userstate);
                                        });
                                      },
                                      value: selectedState,
                                      items: state
                                          .map((state) => DropdownMenuItem(
                                                child: Text(state),
                                                value: state,
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: DropdownButtonFormField(
                                        icon: const Icon(Icons.add_location,
                                            color: Colors.teal),
                                        hint: Text('Select City'),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedcity = value;
                                          });

                                          usercity = value;
                                          print('userity=' + usercity);
                                        },
                                        value: selectedcity,
                                        items: selectedState != null
                                            ? city
                                                .map((city) => DropdownMenuItem(
                                                      child: Text(city),
                                                      value: city,
                                                    ))
                                                .toList()
                                            : [],
                                      )
                                      /*child: TextField(
                                      controller: addressController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          icon: const Icon(Icons.home,
                                              color: Colors.black),
                                          hintText: "City",
                                          errorText: _addressvalidate
                                              ? 'Value Can\'t Be Empty'
                                              : null,
                                          hintStyle: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                          border: InputBorder.none),
                                    ),*/
                                      ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: addressController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          icon: const Icon(Icons.home,
                                              color: Colors.teal),
                                          hintText: "Permanent Address",
                                          errorText: _addressvalidate
                                              ? 'Value Can\'t Be Empty'
                                              : null,
                                          hintStyle: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: handsetvalueController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          icon: const Icon(
                                              Icons.perm_device_information,
                                              color: Colors.teal),
                                          hintText: "Handset Cost",
                                          hintStyle: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  /* Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: amobileController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          icon: const Icon(
                                              Icons.mobile_screen_share,
                                              color: Colors.black),
                                          // labelText: "10 Digit Mobile No.",
                                          hintText: "Alternate Mobile If Any",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),*/
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            1.6,
                            Container(
                              alignment: Alignment.bottomRight,
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 30),

                              child: RaisedButton(
                                onPressed: userRegistration,
                                color: Colors.transparent,
                                textColor: Colors.black,
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                                child: Text(
                                  'Next-->',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              // child: Text("Click Here To Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
            )
          ],
        ),
      ),
    );
  }
}
