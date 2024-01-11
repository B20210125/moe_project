import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'bottom_navi.dart';
import 'services.dart';
import 'home.dart';
import 'functions/logout.dart';

class ProfilePage extends StatefulWidget {
  final String name, ic, email, id;

  ProfilePage({
    Key? key,
    required this.name,
    required this.ic,
    required this.email,
    required this.id,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _icNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _icColorController = TextEditingController();
  final TextEditingController _passportNumberController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();
  final TextEditingController _citizenshipController = TextEditingController();
  final TextEditingController _raceController = TextEditingController();
  final TextEditingController _religionController = TextEditingController();
  final TextEditingController _telephoneHomeController =
      TextEditingController();
  final TextEditingController _telephoneMobileController =
      TextEditingController();
  final TextEditingController _telephoneOfficeController =
      TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch user data when the widget is initialized
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final response = await http.get(
      Uri.parse('http://localhost/moe_connection/profile.php?id=${widget.id}'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = jsonDecode(response.body);
      setState(() {
        _nameController.text = userData['name'];
        _icNumberController.text = userData['ic_number'];
        _emailController.text = userData['email'];
        _icColorController.text = userData['ic_color'] ?? '';
        _passportNumberController.text = userData['passport_number'] ?? '';
        _addressController.text = userData['address'] ?? '';
        _postCodeController.text = userData['post_code'] ?? '';
        _citizenshipController.text = userData['citizenship'] ?? '';
        _raceController.text = userData['race'] ?? '';
        _religionController.text = userData['religion'] ?? '';
        _telephoneHomeController.text = userData['telephone_home'] ?? '';
        _telephoneMobileController.text = userData['telephone_mobile'] ?? '';
        _telephoneOfficeController.text = userData['telephone_office'] ?? '';
        _genderController.text = userData['gender'] ?? '';
        _dobController.text = userData['date_of_birth'] ?? '';
      });
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(40, 100, 159, 1),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              logout(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    controller: _icNumberController,
                    decoration: InputDecoration(labelText: 'IC Number'),
                    readOnly: true,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(height: 20.0),
                  // Additional TextFormFields
                  TextFormField(
                    controller: _icColorController,
                    decoration: InputDecoration(labelText: 'IC Color'),
                  ),
                  TextFormField(
                    controller: _passportNumberController,
                    decoration: InputDecoration(labelText: 'Passport Number'),
                  ),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(labelText: 'Address'),
                  ),
                  TextFormField(
                    controller: _postCodeController,
                    decoration: InputDecoration(labelText: 'Post Code'),
                  ),
                  TextFormField(
                    controller: _citizenshipController,
                    decoration: InputDecoration(labelText: 'Citizenship'),
                  ),
                  TextFormField(
                    controller: _raceController,
                    decoration: InputDecoration(labelText: 'Race'),
                  ),
                  TextFormField(
                    controller: _religionController,
                    decoration: InputDecoration(labelText: 'Religion'),
                  ),
                  TextFormField(
                    controller: _telephoneHomeController,
                    decoration: InputDecoration(labelText: 'Telephone Home'),
                  ),
                  TextFormField(
                    controller: _telephoneMobileController,
                    decoration: InputDecoration(labelText: 'Telephone Mobile'),
                  ),
                  TextFormField(
                    controller: _telephoneOfficeController,
                    decoration: InputDecoration(labelText: 'Telephone Office'),
                  ),
                  TextFormField(
                    controller: _genderController,
                    decoration: InputDecoration(labelText: 'Gender'),
                  ),
                  TextFormField(
                    controller: _dobController,
                    decoration: InputDecoration(labelText: 'Date of Birth'),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Save or process the information here
                    },
                    child: Text('Update'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  name: widget.name,
                  ic: widget.ic,
                  email: widget.email,
                  id: widget.id,
                ),
              ),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ServicesPage(
                  name: widget.name,
                  ic: widget.ic,
                  email: widget.email,
                  id: widget.id,
                ),
              ),
            );
          }
          if (index == 2) {}
        },
      ),
    );
  }
}
