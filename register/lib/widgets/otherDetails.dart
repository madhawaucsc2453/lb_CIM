// ignore_for_file: library_private_types_in_public_api, file_names

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
       const SizedBox(height: 16.0,), 
        TextFormField(
          controller: addressController,
          decoration: const InputDecoration(labelText: 'Address'),
          onChanged: (value) {
            
           
            widget.onFieldChanged('address', value);
          },
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          controller: cityController,
          decoration: const InputDecoration(labelText: 'City'),
          onChanged: (value) {
         
           
            widget.onFieldChanged('city', value);
          },
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          controller: stateController,
          decoration: const InputDecoration(labelText: 'State'),
          onChanged: (value) {
           
           
            widget.onFieldChanged('state', value);
          },
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          controller: zipController,
          decoration: const InputDecoration(labelText: 'Zip'),
          onChanged: (value) {
           
           
            widget.onFieldChanged('zip', value);
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
