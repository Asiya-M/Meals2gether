import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui'; // Required for blur effect

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/background.jpg'), // Path to your image asset
                  fit: BoxFit.cover, // Makes the image cover the entire screen
                ),
              ),
            ),
            // Blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Blur intensity
              child: Container(
                color: Colors.black.withOpacity(0), // Transparent overlay
              ),
            ),
            // Foreground content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Name
                  Text(
                    'Meals2Gether',
                    style: GoogleFonts.pacifico(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(250, 250, 244, 1),
                    ),
                  ),
                  SizedBox(
                      height: 40), // Space between the app name and the form

                  // Login Form Box
                  Container(
                    width: 350,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 216, 102, 136)
                          .withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Username Field
                        TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              color: Colors.black, // Darker font color
                              fontWeight: FontWeight.bold, // Make it bold
                            ),
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(
                            color: Colors.black, // Darker input text color
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),

                        // Password Field
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.black, // Darker font color
                              fontWeight: FontWeight.bold, // Make it bold
                            ),
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(
                            color: Colors.black, // Darker input text color
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 24),

                        // Login Button
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to Profile Page
                            Navigator.pushReplacementNamed(context, '/profile');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
