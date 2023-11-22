// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomerDetails extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String, double) updateProgressCallback;
  final Function() submitCallback;
  final Map<String, double> formData;
  

  

  const CustomerDetails({
    Key? key,
    required this.formKey,
    required this.updateProgressCallback,
    required this.submitCallback,
    required this.formData,
  }) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {


  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  
    
    
    firstNameController.addListener(
      () => _updateProgress(
        'firstName',
        _isFieldValid(firstNameController.text),
      ),
    );
    lastNameController.addListener(
      () => _updateProgress(
        'lastName',
        _isFieldValid(lastNameController.text),
      ),
    );

  }
  @override
void dispose() {
  firstNameController.dispose();
  lastNameController.dispose();

  super.dispose();
}

  double _isFieldValid(String value) {
    if (value.isNotEmpty) {
      return 1.0; // Field is valid
    } else {
      return 0.0; // Field is not valid
    }
  }

  void _updateProgress(String fieldName, double progress) {
    setState(() {
      widget.formData[fieldName] = progress;

    });
    widget.updateProgressCallback(fieldName, progress);
  }
void _submit() {
    final form = widget.formKey.currentState;

    if (form != null && form.validate()) {
      setState(() {
        widget.formData.forEach((key, value) {
          widget.formData[key] = value;
        });
      });
      widget.submitCallback();
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: firstNameController,
            
            decoration: const InputDecoration(
              labelText: 'First Name',

            ),
            onSaved: (newValue) => firstNameController.text = newValue!,
            onChanged: (value) => _updateProgress(
              'firstName',
              _isFieldValid(firstNameController.text),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: lastNameController,
            
            decoration: const InputDecoration(
              labelText: 'Last Name',
            ),
            onSaved: (newValue) => lastNameController.text = newValue!,

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
          ),
        
       
          const Padding(padding: EdgeInsets.only(top: 50)),
          ElevatedButton(
            onPressed: (){
              _submit();
            } 
            ,
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
