/*import 'package:flutter/material.dart';
import 'package:insurance/deviceinfo.dart';
import 'package:insurance/Animation/FadeAnimation.dart';
import 'package:vibrate/vibrate.dart';

class Vibration extends StatefulWidget {
   final String uname;

// Receiving Email using Constructor.
Vibration({Key key, @required this.uname}) : super(key: key);
  @override
  VibrationPage createState() => VibrationPage(uname);
}


//class _AppFooterState extends State<AppFooter> {
    //class AppPage extends StatelessWidget {
class VibrationPage extends State{
  final String uname;
  VibrationPage(this.uname);
  bool _canVibrate = true;
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];
   GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();
 
  
    @override
  initState() {
    super.initState();
    init();
  }

  init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
      _canVibrate? print("This device can vibrate"): print("This device cannot vibrate");
     
    });
  }

//class Subscription extends StatelessWidget {
  // Creating String Var to Hold sent Email.  

int index;
// Receiving Email using Constructor.
//Subscription({Key key, @required this.uname}) : super(key: key);
  //AppPage({Key key}) : super(key: key);
 
  double width;

                
                 // final globalKey = GlobalKey<ScaffoldState>();

    @override
   Widget build(BuildContext context) {
    return Scaffold(
         
                    key: _scaffoldstate,
                    body: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: [
                            Colors.green[900],
                            Colors.pink[800],
                            Colors.yellow[400]
                           
                          ]
                        )
                      ),
                      
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           SizedBox(height: 10),
                          Expanded(
                            
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                              ),
                              child: SingleChildScrollView(
                              
                                child: Padding(
                                  padding: EdgeInsets.all(22),
                                  
                                  child: Column(
                                    
                                    children: <Widget>[
                                      
                                     SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                       crossAxisAlignment:CrossAxisAlignment.center,
                          children: <Widget>[
                                      FadeAnimation(1.6, Container(
                                        height: 80,
                                        width: 120,
                                       // margin: EdgeInsets.symmetric(horizontal: 50),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.teal[800]
                                        ),
                                        child:   RaisedButton(
                                                 //onPressed: (){
                                                  //Navigator.push( context,MaterialPageRoute(builder: (context) => VibratingApp()),);
                                                //},
                                                  onPressed:  () {
                                                      Vibrate.vibrate();
                                                      String values;
                                                      if(_canVibrate==true){
                                                       values="Vibration Test Successful";
                                                      }
                                                      else{
                                                       values="Vibration Test Fail";
                                                      }
                                                     final snackBar = SnackBar(content: Text(values,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),),
                                                   backgroundColor: Colors.yellow,
                                                    duration: Duration(seconds: 3),);
                                                  _scaffoldstate.currentState.showSnackBar(snackBar);
                                                   new Future.delayed(new Duration(seconds: 1), () {
                                                  Navigator.push( context,MaterialPageRoute(builder: (context) => MyApp()),);
                                                 });
                                               
                                                
                                                    },
                                                color: Colors.teal,
                                                textColor: Colors.white,
                                                splashColor: Colors.yellow[200],
                                                //padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                                shape: RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(18.0),),
                                                child: Text('Vibration Test',style: TextStyle(fontSize: 14, color: Colors.yellow),),
                                              ), 
                                              
                                        
                                       )
                                        
                                       ),
                                     ],
                                       
                                       ),
                                      
                                   
                                   
                                 
                                 
                           
                                    
                               
                                        
                                       
                                   
                            
                                      
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
              // Content Page after sucessfull Login
              class Insurance extends StatelessWidget{
                @override
                Widget build(BuildContext context)
                {
                  AssetImage assetImage = AssetImage('images/insurance.png');
                  Image image= Image(image:assetImage,height: 50, width: 100);
                  return Container(child: image,);
                }
                
              }
              
              
              
*/