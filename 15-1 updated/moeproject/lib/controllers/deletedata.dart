import 'package:http/http.dart' as http;

class DataDeleter {
  static Future<void> deleteData(int id) async {
    final response = await http.post(
      Uri.parse("http://localhost/moe_connection/delete.php"),
      body: {'id': id.toString()},
    );

    if (response.statusCode == 200) {
      print("Data deleted successfully");
    } else {
      print("Error deleting data");
    }
  }
}
