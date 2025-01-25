import 'package:flutter/material.dart';
import 'package:tink_her/screens/FoodCommunityScreen.dart';
import 'package:tink_her/screens/FoodComboScreen.dart';  // Import the Food Combo screen

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;

  // List of pages for each tab
  final List<Widget> _pages = [
    FoodCommunityScreen(),  // Food Community Screen
    FoodComboScreen(),  // Food Combo Screen (added this)
    Center(
      child: Text(
        'Personal Streak',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Section (Photo and Username)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Photo
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile_placeholder.png'), // Add your image path here
                ),
                SizedBox(width: 16),
                // Username
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe', // Replace with the actual username
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'johndoe@example.com', // Optional email or subtitle
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),

            // Main content of the selected page
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community', // Food Community section
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Combos',  // Food Combo section
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Streak',
          ),
        ],
      ),
    );
  }
}
