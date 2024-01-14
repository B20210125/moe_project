import 'package:flutter/material.dart';
import '/services.dart';
import '/application_form.dart';

class NotedPage extends StatelessWidget {
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

  NotedPage({
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

  Widget buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 10.0),
          Text(
            '•',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(width: 5.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNumberedBulletPoint(int number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 10.0),
          Text(
            '$number.',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accreditation Application',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
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
                  const Text(
                    'NOTE:',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10.0),
                  buildBulletPoint(
                      'Ensure that the information provided is complete and correct.'),
                  buildBulletPoint(
                      'Documents must be colour scans of the original when submitting your application.'),
                  buildBulletPoint(
                      'Where a document has stamps, seals or text on both sides of the page then both sides must be scanned.'),
                  buildBulletPoint(
                      'Please upload the files in jpg, jpeg, bmp, png, pdf format only and the size file not more than 2048 kb.'),
                  buildBulletPoint(
                      'Scanned documents required are as follows:'),
                  buildNumberedBulletPoint(1,
                      'Certificates (PhD, Master, Bachelor, Higher National Diploma, National Diploma and others) with academic transcripts.'),
                  buildNumberedBulletPoint(2,
                      'GCE \'O\' level, GCE \'A\' level, Foundation (if any) or any comparable result.'),
                  buildNumberedBulletPoint(3,
                      'Offer letter from the institution (for course recognition application only)'),
                  buildNumberedBulletPoint(4, 'Applicant\'s identity card.'),
                  buildBulletPoint(
                      'Incorrect information or unreadable documents will be required to be re-submitted which may result in a delay in the application being assessed.'),
                  buildBulletPoint(
                      'All information is regarded as CONFIDENTIAL.'),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigate back to services.dart
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to accreditation_form.dart
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyTabbedFormPage(
                                name: name,
                                ic: ic,
                                email: email,
                                id: id,
                                iccolor: iccolor,
                                birthdate: birthdate,
                                gender: gender,
                                address: address,
                                postalcode: postalcode,
                                phonehome: phonehome,
                                phonemobile: phonemobile,
                                phoneoffice: phoneoffice,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Confirm'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
