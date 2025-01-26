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

  // Pages for the bottom navigation bar
  final List<Widget> _pages = [
    FoodCommunityScreen(),
    FoodComboScreen(),
    PersonalGoalStreakScreen(),
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
            // Drawer Header with Profile Photo and User Information
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace with your image
                  ),
                  SizedBox(height: 16),
                  Text(
                    'John Doe', // Replace with dynamic username
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'johndoe@example.com', // Replace with dynamic email
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Drawer Options
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Activity History'),
              subtitle: Text('View your app activity'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add logic to navigate or display activity history
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to settings or perform relevant action
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add logout logic here
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Profile Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace with your image
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe', // Replace with dynamic username
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'johndoe@example.com', // Replace with dynamic email
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 32),

          // Main content of the selected page
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
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
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Combos',
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


