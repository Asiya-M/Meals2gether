import 'package:flutter/material.dart';

class FoodCombo {
  final String comboName;
  final String description;
  final String username;
  final String profileImageUrl;
  final String comboImageUrl;

  FoodCombo({
    required this.comboName,
    required this.description,
    required this.username,
    required this.profileImageUrl,
    required this.comboImageUrl,
  });
}

class FoodComboScreen extends StatelessWidget {
  // Sample food combo data
  final List<FoodCombo> combos = [
    FoodCombo(
      comboName: 'Pizza with Pineapple',
      description: 'Sweet and savory! Love it or hate it?',
      username: 'Alice Wonder',
      profileImageUrl: 'assets/profile_placeholder.png',
      comboImageUrl: 'assets/pizza_pineapple.png',
    ),
    FoodCombo(
      comboName: 'Fries with Ice Cream',
      description: 'A perfect balance of hot and cold!',
      username: 'John Smith',
      profileImageUrl: 'assets/profile_placeholder.png',
      comboImageUrl: 'assets/fries_icecream.png',
    ),
    // Add more combos here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Combos'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: combos.length,
          itemBuilder: (context, index) {
            final combo = combos[index];
            return Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header: Username and profile image
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(combo.profileImageUrl),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          combo.username,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),

                    // Combo name and description
                    Text(
                      combo.comboName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      combo.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8.0),

                    // Combo image
                    Image.asset(combo.comboImageUrl),
                    SizedBox(height: 8.0),

                    // Reaction bar with emojis
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_up, color: Colors.green),
                          onPressed: () {
                            // Handle thumbs up reaction
                            print('Thumbs Up for ${combo.comboName}');
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.thumb_down, color: Colors.red),
                          onPressed: () {
                            // Handle thumbs down reaction
                            print('Thumbs Down for ${combo.comboName}');
                          },
                        ),
                        IconButton(
                          icon: Text('😡', style: TextStyle(fontSize: 24)),
                          onPressed: () {
                            // Handle angry reaction
                            print('Angry for ${combo.comboName}');
                          },
                        ),
                        IconButton(
                          icon: Text('🤢', style: TextStyle(fontSize: 24)),
                          onPressed: () {
                            // Handle disgusted reaction
                            print('Disgusted by ${combo.comboName}');
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),

                    // Comment button
                    TextButton(
                      onPressed: () {
                        // Navigate to comment section
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ComboCommentScreen(comboName: combo.comboName),
                          ),
                        );
                      },
                      child: Text(
                        'Leave a Comment',
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ComboCommentScreen extends StatelessWidget {
  final String comboName;

  ComboCommentScreen({required this.comboName});

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments for $comboName'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Comment input field
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Write your comment',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Submit button
            ElevatedButton(
              onPressed: () {
                // Handle comment submission
                print('Comment on $comboName: ${_commentController.text}');
                _commentController.clear();
                Navigator.pop(context);
              },
              child: Text('Post Comment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
