import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'bottom_navi.dart';
import 'services.dart';
import 'home.dart';
import 'functions/logout.dart';

class ProfilePage extends StatefulWidget {
  final String name,
      ic,
      email,
      id,
      iccolor,
      birthdate,
      gender,
      address,
      postalcode,
      phonehome,
      phonemobile,
      phoneoffice;

  ProfilePage({
    Key? key,
    required this.name,
    required this.ic,
    required this.email,
    required this.id,
    required this.iccolor,
    required this.birthdate,
    required this.gender,
    required this.address,
    required this.postalcode,
    required this.phonehome,
    required this.phonemobile,
    required this.phoneoffice,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  _buildProfileInfo('Name', widget.name),
                  _buildProfileInfo('IC Number', widget.ic),
                  _buildProfileInfo('Email', widget.email),
                  _buildProfileInfo('IC Color', widget.iccolor),
                  _buildProfileInfo('Date of Birth', widget.birthdate),
                  _buildProfileInfo('Gender', widget.gender),
                  _buildProfileInfo('Address', widget.address),
                  _buildProfileInfo('Postal Code', widget.postalcode),
                  _buildProfileInfo('Telephone Home', widget.phonehome),
                  _buildProfileInfo('Telephone Mobile', widget.phonemobile),
                  _buildProfileInfo('Telephone Office', widget.phoneoffice),
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
                  iccolor: widget.iccolor,
                  birthdate: widget.birthdate,
                  gender: widget.gender,
                  address: widget.address,
                  postalcode: widget.postalcode,
                  phonehome: widget.phonehome,
                  phonemobile: widget.phonemobile,
                  phoneoffice: widget.phoneoffice,
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
                  iccolor: widget.iccolor,
                  birthdate: widget.birthdate,
                  gender: widget.gender,
                  address: widget.address,
                  postalcode: widget.postalcode,
                  phonehome: widget.phonehome,
                  phonemobile: widget.phonemobile,
                  phoneoffice: widget.phoneoffice,
                ),
              ),
            );
          }
          if (index == 2) {}
        },
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
