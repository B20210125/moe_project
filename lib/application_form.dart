import 'package:flutter/material.dart';

import './form/application.dart';

class MyTabbedFormPage extends StatefulWidget {
  @override
  _MyTabbedFormPageState createState() => _MyTabbedFormPageState();
}

class _MyTabbedFormPageState extends State<MyTabbedFormPage>
    with SingleTickerProviderStateMixin {
  // Add SingleTickerProviderStateMixin
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application for Course / Certificate Accreditation'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Applicant'),
            Tab(text: 'Education'),
            Tab(text: 'Document'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ApplicantForm(),
          EducationForm(),
          DocumentForm(),
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
          ],
        ),
      ),
    );
  }
}
