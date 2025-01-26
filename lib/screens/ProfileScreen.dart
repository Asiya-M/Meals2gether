import 'package:flutter/material.dart';
import 'package:tink_her/screens/FoodCommunityScreen.dart';
import 'package:tink_her/screens/FoodComboScreen.dart';
import 'package:tink_her/screens/PersonalGoalStreakScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;

  // List of pages for each tab
  final List<Widget> _pages = [
    FoodCommunityScreen(), // Food Community Screen
    FoodComboScreen(), // Food Combo Screen
    PersonalGoalStreakScreen(), // Personal Goal Streak Screen
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header with Profile Photo and Username
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/profile_placeholder.png'), // Add your image path here
                  ),
                  SizedBox(height: 16),
                  Text(
                    'John Doe', // Replace with the actual username
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'johndoe@example.com', // Optional email or subtitle
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // History Section
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Activity History'),
              subtitle: Text('View your app activity'),
              onTap: () {
                // Navigate to history or perform some action
                Navigator.pop(context);
              },
            ),

            Divider(),

            // Additional Options (if needed)
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to settings or perform some action
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle logout action
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile Section (Photo and Username)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Photo
                    GestureDetector(
                      onTap: () {
                        // Open the Drawer
                        Scaffold.of(context).openDrawer();
                      },
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                            'assets/profile_placeholder.png'), // Add your image path here
                      ),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: _pages[_selectedIndex],
                ),
              ],
            ),
          ),
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
            label: 'Combos', // Food Combo section
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

      




