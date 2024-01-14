import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class SecRegisterPage extends StatefulWidget {
  @override
  _SecRegisterPageState createState() => _SecRegisterPageState();
}

class _SecRegisterPageState extends State<SecRegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController icNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    final String url = "http://10.0.2.2/moe_connection/register.php";
    final response = await http.post(Uri.parse(url), body: {
      'name': nameController.text,
      'ic_number': icNumberController.text,
      'email': emailController.text,
      'password': passwordController.text,
    });

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (responseData['status'] == 'success') {
      Fluttertoast.showToast(
        msg: responseData['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // Optionally, you can navigate to another page after successful registration
      // Navigator.pushReplacementNamed(context, '/home');
    } else {
      Fluttertoast.showToast(
        msg: responseData['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: icNumberController,
              decoration: InputDecoration(labelText: 'IC Number'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add validation or other checks before registering
                if (nameController.text.isEmpty ||
                    icNumberController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  Fluttertoast.showToast(
                    msg: 'Please fill in all fields',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return;
                }
                register();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
