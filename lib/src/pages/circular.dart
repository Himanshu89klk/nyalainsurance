import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
           appBar: AppBar(title: Text('Circular Progress Indicator')),
            body: Center(
              child: CircularIndicator()
              )
            )
          );
  }
}

class CircularIndicator extends StatefulWidget {

  CircularIndicatorWidget createState() => CircularIndicatorWidget();

}

class CircularIndicatorWidget extends State {

  bool visible = true ;

  loadProgress(){

    if(visible == true){
      setState(() {
       visible = false; 
      });
    }
    else{
      setState(() {
       visible = true; 
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Visibility(
              maintainSize: true, 
              maintainAnimation: true,
              maintainState: true,
              visible: visible, 
              child: Container(
                margin: EdgeInsets.only(top: 50, bottom: 30),
                child: CircularProgressIndicator()
                )
              ),

              RaisedButton(
                onPressed: loadProgress,
                color: Colors.pink,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Text('Click Here To Show Hide Circular Progress Indicator'),
              ),

            ],
          ),
        ));
  }
}