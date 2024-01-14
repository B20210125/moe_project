import 'package:flutter/material.dart';
import 'controllers/fetchdata.dart';
import 'storeform.dart';
import 'updateform.dart';
import 'controllers/deletedata.dart';

class FetchForm extends StatefulWidget {
  @override
  _FetchFormState createState() => _FetchFormState();
}

class _FetchFormState extends State<FetchForm> {
  final TextEditingController idController = TextEditingController();
  var fetchedData = "";
  var name = "";

  Future<void> _fetchData() async {
    final id = int.tryParse(idController.text) ?? 0;
    final Map<String, dynamic> data = await DataFetcher.fetchData(id);

    setState(() {
      fetchedData = data.toString();
      name = data['name'];
    });
  }

  Future<void> _deleteData() async {
    final id = int.tryParse(idController.text) ?? 0;
    await DataDeleter.deleteData(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch, Store, and Update Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'Enter ID'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchData,
              child: Text('Fetch Data'),
            ),
            SizedBox(height: 16),
            Text('Fetched Data:', style: TextStyle(fontSize: 18)),
            // Text(fetchedData, style: TextStyle(fontSize: 16)),
            Text(name, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StoreForm()),
                );
              },
              child: Text('Go to Store Form'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (idController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UpdateForm(dataId: idController.text)),
                  );
                }
              },
              child: Text('Update Data'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (idController.text.isNotEmpty) {
                  if (idController.text.isNotEmpty) {
                    _deleteData();
                  }
                }
              },
              child: Text('Delete Data'),
            ),
          ],
        ),
      ),
    );
  }
}
