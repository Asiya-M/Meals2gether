import 'package:flutter/material.dart';

class PersonalGoalStreakScreen extends StatefulWidget {
  @override
  _PersonalGoalStreakScreenState createState() =>
      _PersonalGoalStreakScreenState();
}

class _PersonalGoalStreakScreenState extends State<PersonalGoalStreakScreen> {
  String? _currentGoal; // Stores the current goal
  final TextEditingController _goalController = TextEditingController();

  void _setGoal() {
    setState(() {
      _currentGoal = _goalController.text;
      _goalController.clear(); // Clear the text field after setting the goal
    });
    Navigator.pop(context); // Close the dialog
  }

  void _showSetGoalDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Set a New Goal'),
        content: TextField(
          controller: _goalController,
          decoration: InputDecoration(
            hintText: 'Enter your goal',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog without saving
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: _setGoal,
            child: Text('Set Goal'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Goal Streak'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Personal Goal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Display the current goal or a message prompting the user to set a goal
            _currentGoal == null
                ? Text(
                    'No goal set yet!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  )
                : Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Current Goal:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            _currentGoal!,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(height: 30),

            // Button to set a new goal
            ElevatedButton(
              onPressed: _showSetGoalDialog,
              child: Text(
                _currentGoal == null ? 'Set a Goal' : 'Update Goal',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
