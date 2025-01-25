import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tink_her/screens/HomeScreen.dart' hide SignupScreen hide LoginScreen; // Import the HomeScreen
import 'package:tink_her/screens/LoginScreen.dart';
import 'package:tink_her/screens/SignupScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter binding is initialized
  
  try {
    await Firebase.initializeApp(); // Initializes Firebase
    print('Firebase Initialized');
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
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
