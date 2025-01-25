import 'package:flutter/material.dart';
import 'package:tink_her/screens/HomeScreen.dart';
import 'package:tink_her/screens/LoginScreen.dart'; 
import 'package:tink_her/screens/SignupScreen.dart';
import 'package:tink_her/screens/ProfileScreen.dart';  // Import the ProfileScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals2Gether',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/profile': (context) => ProfileScreen(),  // Route to ProfileScreen
      },
    );
  }
}
