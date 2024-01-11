import 'package:http/http.dart' as http;

class LoginDataController {
  static const String baseUrl = "http://localhost/moe_connection/login.php";

  static Future<http.Response> login(String email, String password) {
    final String url = "$baseUrl/loginProcess.php";
    return http.post(Uri.parse(url), body: {
      'email': email,
      'password': password,
    });
  }
}
