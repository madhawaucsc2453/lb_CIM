// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class SecurityDetails extends StatefulWidget {
  final Function(String, dynamic) onFieldChanged;
  final VoidCallback onNext;
  final Map<String, String> formData;

  const SecurityDetails({Key? key, 
  required this.onFieldChanged
  ,required this.onNext,
  required this.formData}) : super(key: key);



  @override
  _SecurityDetailsState createState() => _SecurityDetailsState();
}

class _SecurityDetailsState extends State<SecurityDetails> {
  
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController securityQuestionController = TextEditingController();

    @override
  void initState() {
    super.initState();
    passwordController.text = widget.formData['password']??'';
    confirmPasswordController.text = widget.formData['confirmPassword']??'';
    securityQuestionController.text = widget.formData['securityQuestion']??'';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        const SizedBox(height: 16.0,), 
        TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(labelText: 'Password'),
          onChanged: (value) {
           
           widget.onFieldChanged('password',value);
          },
        ),
        TextFormField(
          controller: confirmPasswordController,
          obscureText: true,
          decoration: const InputDecoration(labelText: 'Confirm Password'),
          onChanged: (value) {
           
            widget.onFieldChanged('confirmPassword', value);
          },
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          controller: securityQuestionController,
          decoration: const InputDecoration(labelText: 'Security Question'),
          onChanged: (value) {
            
           
            widget.onFieldChanged('securityQuestion', value);
          },
        ),
  const SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: () {
            widget.onNext();
          },
          child: const Text('Next'),
        ),

      
      ],
    );
  }
}
