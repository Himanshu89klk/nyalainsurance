/*import 'package:flutter/material.dart';
import 'package:torch/torch.dart';

void main() => runApp(FlashLightDemo());

class FlashLightDemo extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<FlashLightDemo> {
	bool isOn = false;
	bool hasTorch = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
		Torch.hasTorch.then((_hasTorch) {
			setState(() {
				hasTorch = _hasTorch;			
			});
		});

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('In Build Torch Test'),
        ),
        body: Center(
          child: Column(
            
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>[
             SizedBox(height: 40,),
							Text('Does it have torch: $hasTorch',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.green),),
              SizedBox(height: 40,),
							RaisedButton(
								child: Text('TOGGLE TORCH !!'),
								onPressed: hasTorch ? () {
									if(isOn) {
										Torch.turnOff();
									} else {
										Torch.turnOn();
									}
									isOn = !isOn;
								} : null,
							),
              SizedBox(height: 40,),
							RaisedButton(
								child: Text('FLASH'),
								onPressed: hasTorch ?  () {
									Future.delayed(Duration(milliseconds: 500), () => Torch.flash(Duration(milliseconds: 200)));
									Torch.flash(Duration(milliseconds: 300));
								} : null,
							),
						],
					),
        )
      ),
    );
  }
}*/