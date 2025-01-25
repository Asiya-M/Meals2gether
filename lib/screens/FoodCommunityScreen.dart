import 'package:flutter/material.dart';

// Dummy data for posts (You can replace this with actual data from a backend)
class Post {
  final String title;
  final String description;
  final String username;
  final String profileImageUrl;
  final String postImageUrl;

  Post({
    required this.title,
    required this.description,
    required this.username,
    required this.profileImageUrl,
    required this.postImageUrl,
  });
}

class FoodCommunityScreen extends StatelessWidget {
  // Sample post data
  final List<Post> posts = [
    Post(
      title: 'Spaghetti Bolognese',
      description: 'A classic Italian dish. Love the flavor!',
      username: 'Jane Doe',
      profileImageUrl: 'assets/profile_placeholder.png', // Replace with actual image path
      postImageUrl: 'assets/spaghetti.png', // Replace with actual post image path
    ),
    Post(
      title: 'Sushi Rolls',
      description: 'Fresh sushi, perfect for a healthy meal.',
      username: 'John Smith',
      profileImageUrl: 'assets/profile_placeholder.png',
      postImageUrl: 'assets/sushi.png',
    ),
    // Add more posts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Community'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display the posts in a ListView
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    elevation: 4.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Post header: username and profile image
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(post.profileImageUrl),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                post.username,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),

                          // Post title and description
                          Text(
                            post.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            post.description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 8.0),

                          // Post image (if any)
                          Image.asset(post.postImageUrl), // Display post image
                          SizedBox(height: 8.0),

                          // Interaction buttons (like, comment)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.thumb_up),
                                onPressed: () {
                                  // Add like functionality here
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.comment),
                                onPressed: () {
                                  // Navigate to comment section (optional)
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Add a new post button at the bottom
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to post creation screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreatePostScreen()),
                  );
                },
                child: Text('Post New Meal'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Updated to use backgroundColor
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreatePostScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Post'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Post Title
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Post Description
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),

            // Post Button
            ElevatedButton(
              onPressed: () {
                // Here, you can send the post data to Firebase or any backend.
                // For now, just print the entered data to console.
                print('Post Title: ${_titleController.text}');
                print('Post Description: ${_descriptionController.text}');
                Navigator.pop(context); // Go back after posting
              },
              child: Text('Post'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Updated to use backgroundColor
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

