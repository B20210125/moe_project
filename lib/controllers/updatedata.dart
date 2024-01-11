import 'package:http/http.dart' as http;

class DataUpdater {
  static Future<void> updateData(
      int id, String name, String email, String message) async {
    final response = await http.post(
      Uri.parse("http://localhost/moe_connection/update.php"),
      body: {
        'id': id.toString(), // Convert 'id' to String
        'name': name.toString(),
        'email': email.toString(),
        'message': message.toString(),
      },
    );

    if (response.statusCode == 200) {
      print("Data updated successfully");
    } else {
      print("Error updating data");
    }
  }
}
