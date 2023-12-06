import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';



import 'other_details_model.dart';

class OtherDetails extends StackedView<OtherDetailsModel> {
  
  final Function(String, dynamic) onFieldChanged;
  final Function() onNext;
  final Map<int,Map<String, String>> formData;
  const OtherDetails(
      {Key? key,
      required this.onFieldChanged,
      required this.onNext,
      required this.formData})
      : super(key: key);

  @override
  void onViewModelReady(OtherDetailsModel viewModel) {
    viewModel.addressController.text = formData[2]!['address']!;
    viewModel.cityController.text = formData[2]!['city']!;
    viewModel.stateController.text = formData[2]!['state']!;
    viewModel.zipController.text = formData[2]!['zip']!;
    super.onViewModelReady(viewModel);
  }
  @override
  Widget builder(
    BuildContext context,
    OtherDetailsModel viewModel,
    Widget? child,
  ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: viewModel.addressController,
            decoration: const InputDecoration(
              labelText: 'Address',
              hintText: 'Enter your Address',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => onFieldChanged(
              'address',
              value,
            ),

            ),
          const SizedBox(
            height: 16,
          ),

          TextFormField(
            controller: viewModel.cityController,
            decoration: const InputDecoration(
              labelText: 'City',
              hintText: 'Enter your City',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => onFieldChanged(
              'city',
              value,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: viewModel.stateController,
            decoration: const InputDecoration(
              labelText: 'State',
              hintText: 'Enter your State',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => onFieldChanged(
              'state',
              value,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: viewModel.zipController,
            decoration: const InputDecoration(
              labelText: 'Zip Code',
              hintText: 'Enter your Zip Code',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => onFieldChanged(
              'zip',
              value,
            ),
          ),
        
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed:
                viewModel.isFormValid ? ()=>viewModel.submit(formData) : 
                viewModel.isAddressValid && viewModel.isCityValid && viewModel.isStateValid && viewModel.isZipValid ? ()=>ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Successfully Registered'),
                  ),
                ):()=>ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill all the fields'),
                  ),
                ),
                
                
            child: const Text('Submit'),
          ),


        ],
      ),
    );
  }

  @override
  OtherDetailsModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtherDetailsModel(
       
      );
}
