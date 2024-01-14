import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SecondRegisterPage extends StatefulWidget {
  final String name;
  final String icNumber;
  final String email;
  final String password;
  final String confirmPassword;
  final bool acceptTerms;

  // Constructor to receive data from the first register page
  SecondRegisterPage({
    required this.name,
    required this.icNumber,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.acceptTerms,
  });

  @override
  _SecondRegisterPageState createState() => _SecondRegisterPageState();
}

class _SecondRegisterPageState extends State<SecondRegisterPage> {
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController phoneHomeController = TextEditingController();
  final TextEditingController phoneMobileController = TextEditingController();
  final TextEditingController phoneOfficeController = TextEditingController();

  String? selectedIcColor;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${widget.name}'),
                  Text('IC Number: ${widget.icNumber}'),
                  Text('Email: ${widget.email}'),
                  Text('Password: ${widget.password}'),
                  Text('Accept Terms: ${widget.acceptTerms}'),

                  SizedBox(height: 20),

                  // Dropdown for IC Color
                  DropdownButtonFormField<String>(
                    value: selectedIcColor,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedIcColor = newValue;
                      });
                    },
                    items: ['Yellow', 'Red', 'Green']
                        .map((color) => DropdownMenuItem<String>(
                              value: color,
                              child: Text(color),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'IC Color',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Date Picker for Birth Date
                  TextFormField(
                    controller: birthDateController,
                    readOnly: true,
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );

                      if (selectedDate != null) {
                        birthDateController.text =
                            selectedDate.toLocal().toString().split(' ')[0];
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Birth Date',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Gender Selection
                  Row(
                    children: [
                      Text('Gender: '), // Added gender label
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedGender = 'Male';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: selectedGender == 'Male'
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        child: Text('Male'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedGender = 'Female';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: selectedGender == 'Female'
                              ? Colors.pink
                              : Colors.grey,
                        ),
                        child: Text('Female'),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  // Address Text Field
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Postal Code Text Field
                  TextFormField(
                    controller: postalCodeController,
                    decoration: InputDecoration(
                      labelText: 'Postal Code',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Phone Home Text Field
                  TextFormField(
                    controller: phoneHomeController,
                    decoration: InputDecoration(
                      labelText: 'Phone Home',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Phone Mobile Text Field
                  TextFormField(
                    controller: phoneMobileController,
                    decoration: InputDecoration(
                      labelText: 'Phone Mobile',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Phone Office Text Field
                  TextFormField(
                    controller: phoneOfficeController,
                    decoration: InputDecoration(
                      labelText: 'Phone Office',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      // Call the method to send data to the server
                      submitDataToServer();
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Method to send data to the server
  Future<void> submitDataToServer() async {
    final String url = "http://10.0.2.2/moe_connection/register.php";
    final response = await http.post(Uri.parse(url), body: {
      'name': widget.name,
      'ic_number': widget.icNumber,
      'email': widget.email,
      'password': widget.password,
      'confirmpassword': widget.confirmPassword,
      'acceptTerms': widget.acceptTerms.toString(),
      'icColor': selectedIcColor ?? '',
      'birthDate': birthDateController.text,
      'gender': selectedGender ?? '',
      'address': addressController.text,
      'postalCode': postalCodeController.text,
      'phoneHome': phoneHomeController.text,
      'phoneMobile': phoneMobileController.text,
      'phoneOffice': phoneOfficeController.text,
    });

    final Map<String, dynamic> responseData = json.decode(response.body);

    // Print the response for debugging
    print("Server Response Status Code: ${response.statusCode}");

    String title = 'Registration Error';
    String message = responseData['message'];

    if (responseData['status'] == 'success') {
      title = 'Registration Success';

      // Clear the input fields after successful registration
      birthDateController.clear();
      selectedIcColor = null;
      selectedGender = null;
      addressController.clear();
      postalCodeController.clear();
      phoneHomeController.clear();
      phoneMobileController.clear();
      phoneOfficeController.clear();
    }

    // Show the result in an alert dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
