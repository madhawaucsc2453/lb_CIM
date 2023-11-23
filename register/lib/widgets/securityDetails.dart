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
  // Add your form fields and related logic here
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
        Text(
          'Security Details',
          style: TextStyle(fontSize: 24.0),
        ),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
          onChanged: (value) {
            // Add your validation logic if needed
           widget.onFieldChanged('password',value);
          },
        ),
        TextFormField(
          controller: confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Confirm Password'),
          onChanged: (value) {
            // Add your validation logic if needed
           
            widget.onFieldChanged('confirmPassword', value);
          },
        ),
        SizedBox(height: 16.0),
        TextFormField(
          controller: securityQuestionController,
          decoration: InputDecoration(labelText: 'Security Question'),
          onChanged: (value) {
            // Add your validation logic if needed
           
            widget.onFieldChanged('securityQuestion', value);
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
