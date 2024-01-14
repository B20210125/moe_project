import 'package:flutter/material.dart';
import 'controllers/fetchdata.dart';
import 'controllers/updatedata.dart';
import 'dart:convert';

class UpdateForm extends StatefulWidget {
  final String dataId;

  UpdateForm({required this.dataId});

  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future<void> _updateData() async {
    final id = int.tryParse(widget.dataId) ?? 0;
    final name = nameController.text;
    final email = emailController.text;
    final message = messageController.text;

    await DataUpdater.updateData(id, name, email, message);
  }

  Future<void> _fetchData() async {
    final id = int.parse(widget.dataId);
    final data = await DataFetcher.fetchData(id);

    setState(() {
      nameController.text = data['name'];
      emailController.text = data['email'];
      messageController.text = data['message'];
    });
  }

  @override
  void initState() {
    super.initState();
    // Fetch data when the page is initialized
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data'),
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
              onPressed: _updateData,
              child: Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}
