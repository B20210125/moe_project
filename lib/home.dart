import 'package:flutter/material.dart';

import 'bottom_navi.dart';
import 'services.dart';
import 'profile.dart';
import 'functions/logout.dart';

class HomePage extends StatefulWidget {
  final String name, ic, email, id;
  HomePage({
    Key? key,
    required this.name,
    required this.ic,
    required this.email,
    required this.id,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello ${widget.id} . ${widget.name}, welcome back.',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                children: [
                  // Add your cards here
                  CustomCard(
                      title: 'Applicant ID: ',
                      subtitle: 'Date Created: ',
                      status: 'Status:'),
                  CustomCard(
                      title: 'Applicant ID: ',
                      subtitle: 'Date Created:',
                      status: 'Status:'),
                  // Add more cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
          currentIndex: 0,
          onTap: (index) {
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

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;

  const CustomCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(status),
      ),
    );
  }
}
