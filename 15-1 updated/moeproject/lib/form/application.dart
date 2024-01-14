import 'package:flutter/material.dart';

class ApplicantForm extends StatefulWidget {
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

  ApplicantForm({
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
  _ApplicantFormState createState() => _ApplicantFormState();
}

class _ApplicantFormState extends State<ApplicantForm> {
  String selectedModeOfLearning = 'Full Time';
  String selectedReasonForApply = 'Scholarship';

  TextEditingController _nameController = TextEditingController();
  TextEditingController _icNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _durationController = TextEditingController();
  TextEditingController _highestQualificationController =
      TextEditingController();
  TextEditingController _remarksController = TextEditingController();

  Map<String, String> dropdownSelections = {};

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with widget values
    _nameController.text = widget.name;
    _icNumberController.text = widget.ic;
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Applicant Form ${widget.id} . ${widget.name}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    buildNonEditableTextField('Name', _nameController),
                    buildNonEditableTextField('IC Number', _icNumberController),
                    buildNonEditableTextField('Email', _emailController),
                    buildRoundedTextField(
                        'Duration of Study (Year)', _durationController),
                    buildRoundedTextField(
                        'Highest Qualification Before Following Course',
                        _highestQualificationController),
                    buildRoundedTextField(
                        'Remarks (Any issue with certificate)',
                        _remarksController),
                    buildDropdownSelection(
                        'Course / Qualification', ['Option 1', 'Option 2']),
                    buildDropdownSelection(
                        'Institution / College / University / Professional',
                        ['Option 1', 'Option 2']),
                    buildDropdownSelection('Country', ['Option 1', 'Option 2']),
                    buildButtonSelection('Mode of Learning',
                        ['Full Time', 'Part Time'], selectedModeOfLearning),
                    buildButtonSelection(
                        'Reason For Apply',
                        [
                          'Scholarship',
                          'Employment',
                          'Continue Study',
                          'Others'
                        ],
                        selectedReasonForApply),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNonEditableTextField(
      String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        enabled: false,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Widget buildRoundedTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Widget buildDropdownSelection(String label, List<String> options) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          DropdownButton<String>(
            value: dropdownSelections[label],
            onChanged: (String? newValue) {
              setState(() {
                dropdownSelections[label] = newValue!;
              });
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildButtonSelection(
      String label, List<String> options, String selectedValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          ButtonBar(
            children: options.map((option) {
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedValue = option;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    option == selectedValue ? Colors.blue : Colors.grey,
                  ),
                ),
                child: Text(option),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
