import 'package:flutter/material.dart';

class CustomerDetails extends StatefulWidget {
  final Function(String, dynamic) onFieldChanged;
  final VoidCallback onNext;
  final Map<String, String> formData;

  const CustomerDetails({Key? key, required this.onFieldChanged
  ,required this.onNext,
  required this.formData
  }) : super(key: key);

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  // Add your form fields and related logic here
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    firstNameController.text = widget.formData['firstName']??'';
    lastNameController.text = widget.formData['lastName']??'';
    emailController.text = widget.formData['email']??'';
    phoneController.text = widget.formData['phone']??'';
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Customer Details',
          style: TextStyle(fontSize: 24.0),
        ),
        TextFormField(
          controller: firstNameController,
          decoration: InputDecoration(labelText: 'First Name'),
          onChanged: (value) {
            // Add your validation logic if needed
           
            widget.onFieldChanged('firstName',value);
          },
        ),
        TextFormField(
          controller: lastNameController,
          decoration: InputDecoration(labelText: 'Last Name'),
          onChanged: (value) {
            // Add your validation logic if needed
            widget.onFieldChanged('lastName',value);
          },
        ),
        SizedBox(height: 16.0),
        TextFormField(
          decoration: InputDecoration(labelText: 'Email'),
          onChanged: (value) {
            // Add your validation logic if needed
            widget.onFieldChanged('email',value);
          },
        ),
        SizedBox(height: 16.0),
        TextFormField(
          decoration: InputDecoration(labelText: 'Phone'),
          onChanged: (value) {
            // Add your validation logic if needed
            widget.onFieldChanged('phone',value);
          }),
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
