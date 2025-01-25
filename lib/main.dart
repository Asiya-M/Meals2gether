import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';
import 'screens/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',  // Initial route
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => LoginScreen(),
      },
    );
  }
}


