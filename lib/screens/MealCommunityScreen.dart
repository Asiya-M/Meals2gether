import 'package:flutter/material.dart';
import 'ProfileScreen.dart';  // Import the ProfileScreen

class MealCommunityScreen extends StatefulWidget {
  const MealCommunityScreen({super.key});

  @override
  _MealCommunityScreenState createState() => _MealCommunityScreenState();
}

class _MealCommunityScreenState extends State<MealCommunityScreen> {
  List<Map<String, String>> posts = [
    {"title": "Healthy Salad", "description": "A delicious and nutritious salad recipe."},
    {"title": "Veggie Stir Fry", "description": "Quick and easy veggie stir fry for lunch."},
    {"title": "Smoothie Bowl", "description": "A refreshing smoothie bowl packed with fruits."},
  ];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int _currentIndex = 0;

  void _addPost() {
    if (_titleController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
      setState(() {
        posts.add({
          "title": _titleController.text,
          "description": _descriptionController.text,
        });
      });
      _titleController.clear();
      _descriptionController.clear();
    }
  }

  void _openPostDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Create New Post"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Post Title"),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: "Post Description"),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _addPost();
                Navigator.pop(context);
              },
              child: const Text("Post"),
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (_currentIndex == 0) {
      // Stay on the Meal Community screen
    } else if (_currentIndex == 1) {
      // Navigate to Profile Screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Community"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _openPostDialog,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("Create New Post"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(posts[index]["title"]!),
                      subtitle: Text(posts[index]["description"]!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
