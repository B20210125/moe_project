import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> logout(BuildContext context) async {
  final String url = "http://10.0.2.2/moe_connection/logout.php";

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Successful logout, navigate to login page
      Navigator.pushReplacementNamed(context, '/');
    } else {
      // Handle error
      print("Logout failed. Status code: ${response.statusCode}");
    }
  } catch (e) {
    // Handle exception
    print("Exception during logout: $e");
  }
}
