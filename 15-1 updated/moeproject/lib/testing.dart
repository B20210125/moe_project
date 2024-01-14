import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyCardList extends StatefulWidget {
  @override
  _MyCardListState createState() => _MyCardListState();
}

Future<List<Map<String, dynamic>>> fetchData() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2/moe_connection/testing.php'));

  if (response.statusCode == 200) {
    print(response.body);
    // Parse the JSON response
    List<dynamic> jsonData = jsonDecode(response.body);

    // Return data as List<Map<String, dynamic>>
    return List<Map<String, dynamic>>.from(jsonData);
  } else {
    // Handle error
    throw Exception('Failed to fetch data');
  }
}

class _MyCardListState extends State<MyCardList> {
  late Future<List<Map<String, dynamic>>> data;

  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // Access individual properties based on your table structure
                String name = snapshot.data![index]['name'];
                String email = snapshot.data![index]['email'];

                return Card(
                  child: ListTile(
                    title: Text('Name: $name\nEmail: $email'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
