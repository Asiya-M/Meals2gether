import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tink_her/screens/HomeScreen.dart';
import 'package:tink_her/screens/LoginScreen.dart';
import 'package:tink_her/screens/SignupScreen.dart';
import 'package:tink_her/screens/ProfileScreen.dart';
import 'package:tink_her/screens/FoodCommunityScreen.dart';
import 'package:tink_her/screens/FoodComboScreen.dart';
import 'package:tink_her/screens/PersonalGoalStreakScreen.dart'; // Import the Personal Streak Screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: const FirebaseOptions(
      apiKey: 'AIzaSyBaQlHDyZrZzndet2_XGZaKVEjaIcM3xw4',
      appId: '1:75877769065:web:7db14a3ec07e6965a267f8',
      messagingSenderId: '75877769065',
      projectId: 'tinkher-ca968',
      // Add other necessary configuration
    ),
  ); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals2Gether',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: AuthWrapper(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/profile': (context) => ProfileScreen(),
        '/foodCommunity': (context) => FoodCommunityScreen(),
        '/foodCombo': (context) => FoodComboScreen(),
        '/personalStreak': (context) => PersonalGoalStreakScreen(), // Added Personal Streak page route
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return snapshot.data != null ? ProfileScreen() : HomeScreen();
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}