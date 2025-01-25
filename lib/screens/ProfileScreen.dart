import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
<<<<<<< HEAD
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
      child: Text(
        'Meal Community',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Food Combos',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
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
>>>>>>> 6acf33373a9dae608116209aa5414d1e2e1b01ba
  }

  @override
  Widget build(BuildContext context) {
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

            // Logout Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login'); // Navigate back to login
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Log Out',
                style: TextStyle(fontSize: 18),
              ),
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

