// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OtherDetails extends StatefulWidget {
    final GlobalKey<FormState> formKey;
  final Function(String, double) updateProgressCallback;
  final Function() submitCallback;
  final Map<String, double> formData;

  const OtherDetails({
    Key? key,
    required this.formKey,
    required this.updateProgressCallback,
    required this.submitCallback,
    required this.formData,
  }) : super(key: key);
  @override
  State<OtherDetails> createState() => _OtherDetailsState();
}

class _OtherDetailsState extends State<OtherDetails> {
  final TextEditingController _addressController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _addressController.addListener(
      () => _updateProgress(
        'address',
        _isFieldValid(_addressController.text),
      ),
    );
  }
  void _submit() {
    final form = widget.formKey.currentState;

    if (form != null && form.validate()) {
      setState(() {
        widget.formData.forEach((key, value) {
          widget.formData[key] = 1.0;
        });
      });
      widget.submitCallback();
    }
  }
  double _isFieldValid(String value) {
    // You can customize this logic based on your validation requirements
    // For example, you might want to check if the field is not empty and meets certain criteria
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
    widget.updateProgressCallback(
        fieldName, progress); // Notify parent widget about progress
  }
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
        children: [
          TextFormField(
            controller: _addressController,
            onSaved: (newValue) => _addressController.text = newValue!,
             decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                    
                  ),
                   validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
          ),
          ElevatedButton(onPressed: (){
                  
                  _submit();
                }

                , child: const Text('Next'))
        ],
      )),
    );
  }
}