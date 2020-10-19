	
import 'package:flutter/material.dart';
 class HomePagee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification')),
      body: Center(
        child: UselesslyNestedButton(),
      ),
    );
  }
}

class UselesslyNestedButton extends StatelessWidget {
  const UselesslyNestedButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Show Default'),
      onPressed: () => showDefaultSnackbar(context),
    );
  }

  void showDefaultSnackbar(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Hello from the default snackbar'),
        action: SnackBarAction(
          label: 'Click Me',
          onPressed: () {},
        ),
      ),
    );
  }
}