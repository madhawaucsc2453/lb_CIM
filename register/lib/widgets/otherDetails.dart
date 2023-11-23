import 'package:flutter/material.dart';

class OtherDetails extends StatefulWidget {
  final Function(String, dynamic) onFieldChanged;
  final VoidCallback onNext;
  final Map<String, String> formData;

  const OtherDetails({Key? key, 
  required this.onFieldChanged,
  required this.onNext
  ,required this.formData
  }) : super(key: key);

  @override
  _OtherDetailsState createState() => _OtherDetailsState();
}

class _OtherDetailsState extends State<OtherDetails> {
  // Add your form fields and related logic here
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    addressController.text = widget.formData['address']??'';
    cityController.text = widget.formData['city']??'';
    stateController.text = widget.formData['state']??'';
    zipController.text = widget.formData['zip']??'';
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Other Details',
          style: TextStyle(fontSize: 24.0),
        ),
        TextFormField(
          controller: addressController,
          decoration: InputDecoration(labelText: 'Address'),
          onChanged: (value) {
            // Add your validation logic if needed
           
            widget.onFieldChanged('address', value);
          },
        ),
        SizedBox(height: 16.0),
        TextFormField(
          controller: cityController,
          decoration: InputDecoration(labelText: 'City'),
          onChanged: (value) {
            // Add your validation logic if needed
           
            widget.onFieldChanged('city', value);
          },
        ),
        SizedBox(height: 16.0),
        TextFormField(
          controller: stateController,
          decoration: InputDecoration(labelText: 'State'),
          onChanged: (value) {
            // Add your validation logic if needed
           
            widget.onFieldChanged('state', value);
          },
        ),
        SizedBox(height: 16.0),
        TextFormField(
          controller: zipController,
          decoration: InputDecoration(labelText: 'Zip'),
          onChanged: (value) {
            // Add your validation logic if needed
           
            widget.onFieldChanged('zip', value);
          },
        ),
          SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            widget.onNext();
          },
          child: Text('Next'),
        ),
        // Add more form fields as needed
      ],
    );
  }
}
