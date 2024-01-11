import 'package:http/http.dart' as http;

class DataStorer {
  static Future<void> storeData(
      String name, String email, String message) async {
    final response = await http.post(
      Uri.parse("http://localhost/moe_connection/store.php"),
      body: {
        'name': name,
        'email': email,
        'message': message,
      },
    );

    if (response.statusCode == 200) {
      print("Data submitted successfully");
    } else {
      print("Error submitting data");
    }
  }
}
