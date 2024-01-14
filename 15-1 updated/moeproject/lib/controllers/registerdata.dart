import 'package:http/http.dart' as http;
import './login.dart';

class RegistrationHandler {
  static Future<void> registerUser(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("http://localhost/moe_connection/register.php"),
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      print("Registration successful");
    } else {
      print("Error registering user");
    }
  }
}
