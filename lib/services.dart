import 'package:flutter/material.dart';

import 'bottom_navi.dart';
import 'home.dart';
import 'profile.dart';
import 'functions/logout.dart';
import 'note/accreditation_note.dart';

class ServicesPage extends StatefulWidget {
  final String name, ic, email, id;

  ServicesPage({
    Key? key,
    required this.name,
    required this.ic,
    required this.email,
    required this.id,
  }) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Services',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ServiceCard(
              title:
                  'Secretariat of Brunei Darussalam National Accreditation Council',
              services: ['Accreditation Application'],
            ),
            ServiceCard(
              title: 'Department of Examination',
              services: [
                'IGCSE / BGCE O Level Examination Form',
                'BGCE AS / A Level Examination Form',
                'Testimonial Application (Declaration Letter & Examination Slip)',
              ],
            ),
            ServiceCard(
              title: 'Scholarship Section',
              services: ['Registration as a Private Student'],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
          currentIndex: 1,
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
            if (index == 2) {
              // Handle other index taps if needed
            }
            if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    name: widget.name,
                    ic: widget.ic,
                    email: widget.email,
                    id: widget.id,
                  ),
                ),
              );
            }
          }),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final List<String> services;

  ServiceCard({Key? key, required this.title, required this.services})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.blue, // Adjust color as needed
          ),
        ),
        children: services
            .map(
              (service) => ListTile(
                title: Text(
                  service,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black, // Adjust color as needed
                  ),
                ),
                onTap: () {
                  // Navigate to accreditation_note.dart when "Accreditation Application" is clicked
                  if (service == 'Accreditation Application') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotedPage(),
                      ),
                    );
                  }
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
