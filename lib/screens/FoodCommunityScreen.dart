import 'package:flutter/material.dart';

// Dummy data for posts (You can replace this with actual data from a backend)
class Post {
  final String title;
  final String description;
  final String username;
  final String profileImageUrl;
  final String postImageUrl;
  List<String> comments; // Make this mutable
  int likes; // New property for likes

  Post({
    required this.title,
    required this.description,
    required this.username,
    required this.profileImageUrl,
    required this.postImageUrl,
    List<String>? comments, // Allow null and provide a default mutable list
    this.likes = 0, // Default likes count is 0
  }) : comments = comments ?? [];
}

class FoodCommunityScreen extends StatefulWidget {
  @override
  _FoodCommunityScreenState createState() => _FoodCommunityScreenState();
}

class _FoodCommunityScreenState extends State<FoodCommunityScreen> {
  // Sample post data
  final List<Post> posts = [
    Post(
      title: 'Spaghetti Bolognese',
      description: 'A classic Italian dish. Love the flavor!',
      username: 'Jane Doe',
      profileImageUrl: 'assets/profile_placeholder.png',
      postImageUrl: 'assets/spagetti.png',
    ),
    Post(
      title: 'Sushi Rolls',
      description: 'Fresh sushi, perfect for a healthy meal.',
      username: 'John Smith',
      profileImageUrl: 'assets/profile_placeholder.png',
      postImageUrl: 'assets/sushi.png',
    ),
  ];

  void _addComment(Post post, String comment) {
    setState(() {
      post.comments.add(comment);
    });
  }

  void _likePost(Post post) {
    setState(() {
      post.likes++;
    });
  }

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

                          // Comments section
                          if (post.comments.isNotEmpty) ...[
                            Text(
                              'Comments:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: post.comments.map((comment) => Text('- $comment')).toList(),
                            ),
                          ],
                          SizedBox(height: 8.0),

                          // Interaction buttons (like, comment)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.thumb_up),
                                    onPressed: () {
                                      _likePost(post);
                                    },
                                  ),
                                  Text(
                                    '${post.likes} likes',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(Icons.comment),
                                onPressed: () {
                                  _showCommentDialog(post);
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreatePostScreen()),
                  );
                },
                child: Text('Post New Meal'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
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

  void _showCommentDialog(Post post) {
    final TextEditingController commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add a Comment'),
        content: TextField(
          controller: commentController,
          decoration: InputDecoration(hintText: 'Write your comment here'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final comment = commentController.text;
              if (comment.isNotEmpty) {
                _addComment(post, comment);
              }
              Navigator.pop(context);
            },
            child: Text('Post'),
          ),
        ],
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
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                print('Post Title: ${_titleController.text}');
                print('Post Description: ${_descriptionController.text}');
                Navigator.pop(context);
              },
              child: Text('Post'),
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




