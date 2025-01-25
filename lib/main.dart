import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/HomeScreen.dart'; // Import the HomeScreen
import 'screens/LoginScreen.dart'; // Import the LoginScreen
import 'screens/SignupScreen.dart'; // Import the SignupScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter binding is initialized
  await Firebase.initializeApp(); // Initializes Firebase
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @overridess
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals2Gether',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}