import 'package:flutter/material.dart';
import 'controllers/storedata.dart';

class StoreForm extends StatefulWidget {
  @override
  _StoreFormState createState() => _StoreFormState();
}

class _StoreFormState extends State<StoreForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future<void> _storeData() async {
    final name = nameController.text;
    final email = emailController.text;
    final message = messageController.text;

    await DataStorer.storeData(name, email, message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: messageController,
              decoration: InputDecoration(labelText: 'Message'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _storeData,
              child: Text('Store Data'),
            ),
          ],
        ),
      ),
    );
  }
}
