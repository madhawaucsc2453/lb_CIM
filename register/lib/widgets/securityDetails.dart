// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SecurityDetails extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String, double) updateProgressCallback;
  final Function() submitCallback;
  final Map<String, double> formData;

  const SecurityDetails({
    Key? key,
    required this.formKey,
    required this.updateProgressCallback,
    required this.submitCallback,
    required this.formData,
  }) : super(key: key); 
  @override
  State<SecurityDetails> createState() => _SecurityDetailsState();
}

class _SecurityDetailsState extends State<SecurityDetails> {
 
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordController.addListener(
      () => _updateProgress(
        'password',
        _isFieldValid(passwordController.text),
      ),
    );
    confirmPasswordController.addListener(
      () => _updateProgress(
        'confirmPassword',
        _isFieldValid(confirmPasswordController.text),
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
        fieldName, progress);
         // Notify parent widget about progress
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: passwordController,
            onChanged: (value) => _updateProgress(
              'password',
              _isFieldValid(value),
            ),
            obscureText: true,
            obscuringCharacter: '*',
            enableSuggestions: false,
            onSaved: (newValue) => passwordController.text = newValue!,

            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
          ),
          TextFormField(
            controller: confirmPasswordController,
            onChanged: (value) => _updateProgress(
              'confirmPassword',
              _isFieldValid(value),
            ),
            obscureText: true,
            obscuringCharacter: '*',
            onSaved: (newValue) => confirmPasswordController.text = newValue!,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () => _submit(),
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
