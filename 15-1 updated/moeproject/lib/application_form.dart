import 'package:flutter/material.dart';

import './form/application.dart';

class MyTabbedFormPage extends StatefulWidget {
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

  MyTabbedFormPage({
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
  _MyTabbedFormPageState createState() => _MyTabbedFormPageState();
}

class _MyTabbedFormPageState extends State<MyTabbedFormPage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application for Course / Certificate Accreditation'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                ApplicantForm(
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
                EducationForm(),
                DocumentForm(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  ElevatedButton(
                    onPressed: () {
                      _goToPage(_currentPage - 1);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Back'),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentPage == index ? Colors.blue : Colors.grey,
                      ),
                    );
                  }),
                ),
                if (_currentPage < 2)
                  ElevatedButton(
                    onPressed: () {
                      _goToPage(_currentPage + 1);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Next'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EducationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Education Form'),
          ],
        ),
      ),
    );
  }
}

class DocumentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Document Form'),
            SizedBox(height: 26),
            ElevatedButton(
              onPressed: () {
                // Handle "Submit" button tap
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Blue color for "Submit" button
                onPrimary: Colors.white, // White text color
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
