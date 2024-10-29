import 'package:flutter/material.dart';
import 'homeScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  //showing account selection dialog --> workaround for account selection
  void _showAccountSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select an Account'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Account 1'),
                onTap: () {
                  Navigator.pop(context);
                  _navigateToMainScreen(context, 'Account 1');
                },
              ),
              ListTile(
                title: const Text('Account 2'),
                onTap: () {
                  Navigator.pop(context);
                  _navigateToMainScreen(context, 'Account 2');
                },
              ),
              ListTile(
                title: const Text('Account 3'),
                onTap: () {
                  Navigator.pop(context);
                  _navigateToMainScreen(context, 'Account 3');
                },
              ),
            ],
          ),
        );
      },
    );
  }
  //function to navigate to main screen with selected account
  void _navigateToMainScreen(BuildContext context, String account) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(account: account)),
    );
  }

  //login screen UI
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showAccountSelectionDialog(context), //single button to show account selection
          child: const Text('Login'),
        ),
      ),
    );
  }
}