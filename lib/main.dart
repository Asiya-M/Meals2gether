import 'package:flutter/material.dart';
import 'package:tink_her/screens/HomeScreen.dart';
import 'package:tink_her/screens/LoginScreen.dart';
import 'package:tink_her/screens/SignupScreen.dart';
import 'package:tink_her/screens/ProfileScreen.dart';
import 'package:tink_her/screens/FoodCommunityScreen.dart';
import 'package:tink_her/screens/FoodComboScreen.dart';
import 'package:tink_her/screens/PersonalGoalStreakScreen.dart'; // Import the Personal Streak Screen

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
        '/profile': (context) => ProfileScreen(),
        '/foodCommunity': (context) => FoodCommunityScreen(),
        '/foodCombo': (context) => FoodComboScreen(),
        '/personalStreak': (context) => PersonalGoalStreakScreen(), // Added Personal Streak page route
      },
    );
  }
}
