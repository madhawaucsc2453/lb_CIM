// ignore_for_file: library_private_types_in_public_api, file_names

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
    return SingleChildScrollView(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16.0,), 
          TextFormField(
            controller: firstNameController,
            decoration: const InputDecoration(labelText: 'First Name'),
            onChanged: (value) {
              widget.onFieldChanged('firstName',value);
            },
          ),
          TextFormField(
            controller: lastNameController,
            decoration: const InputDecoration(labelText: 'Last Name'),
            onChanged: (value) {
              
              widget.onFieldChanged('lastName',value);
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            onChanged: (value) {
            widget.onFieldChanged('email',value);
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(labelText: 'Phone'),
            onChanged: (value) {
              widget.onFieldChanged('phone',value);
            }),
             const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              widget.onNext();
            },
            child: const Text('Next'),
          ),
          // Add more form fields as needed
        ],
      ),
    );
  }
}
