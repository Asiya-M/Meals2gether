import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signup Screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to home screen
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
