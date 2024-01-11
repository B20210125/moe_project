import 'dart:convert';
import 'package:http/http.dart' as http;

class DataFetcher {
  static Future<Map<String, dynamic>> fetchData(int id) async {
    final response = await http.get(
      Uri.parse("http://localhost/moe_connection/fetch.php?id=$id"),
    );

    print("Response Body: ${response.body}");

    if (response.body.isNotEmpty) {
      print("Data fetched successfully");

      // Decode the JSON response into a Map
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      print("Error fetching data");
      return {'error': 'Error fetching data'};
    }
  }
}
