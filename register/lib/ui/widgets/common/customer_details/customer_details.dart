
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'customer_details_model.dart';

class CustomerDetails extends StackedView<CustomerDetailsModel> {
  final Map<int,Map<String, String>> formData;
  final void Function(String, dynamic) onFieldChanged;
  final void Function() onNext;
  const CustomerDetails(
      {Key? key,
      required this.onFieldChanged,
      required this.onNext,
      required this.formData})
      : super(key: key);

  

  
  @override
  void onViewModelReady(CustomerDetailsModel viewModel) {
    viewModel.firstNameController.text = formData[0]!['firstName']!;
    viewModel.lastNameController.text = formData[0]!['lastName']!;
    viewModel.emailController.text = formData[0]!['email']!;
    viewModel.phoneController.text = formData[0]!['phone']!;
    super.onViewModelReady(viewModel);
  }

  

  @override
  Widget builder(
    BuildContext context,
    CustomerDetailsModel viewModel,
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
            controller: viewModel.firstNameController,
            decoration: const InputDecoration(
              labelText: 'First Name',
              hintText: 'Enter your first name',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => onFieldChanged(
              'firstName',
              value,
            ),
            validator: viewModel.isFirstNameValid ? null : (value) => 'First Name is required',

            ),
          const SizedBox(
            height: 16,
          ),

          TextFormField(
            controller: viewModel.lastNameController,
            decoration: const InputDecoration(
              labelText: 'Last Name',
              hintText: 'Enter your last name',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => onFieldChanged(
              'lastName',
              value,
            ),
            validator: viewModel.isLastNameValid ? null : (value) => 'Last Name is required',
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller:viewModel.emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => onFieldChanged(
              'email',
              value,
            ),
            validator: viewModel.isEmailValid ? null : (value) => 'Email is required',
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: viewModel.phoneController,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              hintText: 'Enter your phone number',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => onFieldChanged(
              'phone',
              value,
            ),
            validator: viewModel.isPhoneValid ? null : (value) => 'Phone Number is required',
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
          onPressed: viewModel.isFormValid ? onNext : 
          viewModel.isFirstNameValid && viewModel.isLastNameValid && viewModel.isEmailValid ? () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Phone Number is required'),
            ),
          ) : () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('First Name, Last Name and Email are required'),
            ),
          ),
          

            child: const Text('Next'),

          ),


        ],
      ),
    );
  }

  @override
  CustomerDetailsModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomerDetailsModel(
      );
}
