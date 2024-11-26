import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Select Users',
      home: SelectUsersScreen(),
    );
  }
}

class SelectUsersScreen extends StatefulWidget {
  @override
  _SelectUsersScreenState createState() => _SelectUsersScreenState();
}

class _SelectUsersScreenState extends State<SelectUsersScreen> {
  List<String> users = ['Jack', 'Ann', 'Jacob', 'Esther'];
  List<String> selectedUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: null,
              hint: Text('Select Users'),
              onChanged: (value) {
                setState(() {
                  if (selectedUsers.contains(value)) {
                    selectedUsers.remove(value);
                  } else {
                    selectedUsers.add(value!);
                  }
                });
              },
              items: users
                  .map((user) => DropdownMenuItem<String>(
                        value: user,
                        child: Row(
                          children: [
                            if (selectedUsers.contains(user))
                              Icon(Icons.check, color: Colors.green),
                            SizedBox(width: 8.0),
                            Text(user),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Selected Users:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              children: selectedUsers
                  .map((user) => Chip(
                        label: Text(user),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
