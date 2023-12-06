import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'security_details_model.dart';

class SecurityDetails extends StackedView<SecurityDetailsModel> {
  final Function(String, dynamic) onFieldChanged;
  final Function() onNext;
  final Map<int, Map<String, String>> formData;
  const SecurityDetails(
      {Key? key,
      required this.onFieldChanged,
      required this.onNext,
      required this.formData})
      : super(key: key);

  @override
  void onViewModelReady(SecurityDetailsModel viewModel) {
    viewModel.passwordController.text = formData[1]!['password']!;
    viewModel.confirmPasswordController.text = formData[1]!['confirmPassword']!;
    viewModel.securityQuestionController.text =
        formData[1]!['securityQuestion']!;
    viewModel.securityAnswerController.text = formData[1]!['securityAnswer']!;
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    SecurityDetailsModel viewModel,
    Widget? child,
  ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),

          TextFormField(
            controller: viewModel.passwordController,
            obscureText: viewModel.visiblebool,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your Password',
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: viewModel.visible,
                icon: Icon(
                  viewModel.visiblebool
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
            ),
            onChanged: (value) => onFieldChanged(
              'password',
              value,
            ),
          ),

          const SizedBox(
            height: 16,
          ),

          TextFormField(
            controller: viewModel.confirmPasswordController,
            obscureText: viewModel.visiblebool,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              hintText: 'Enter your Confirm Password',
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: viewModel.visible,
                icon: Icon(
                  viewModel.visiblebool
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
            ),
            onChanged: (value) => onFieldChanged(
              'confirmPassword',
              value,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // TextFormField(
          //   controller:viewModel.securityQuestionController,
          //   decoration: const InputDecoration(
          //     labelText: 'Security Question',
          //     hintText: 'Enter your Security Question',
          //     border: OutlineInputBorder(),
          //   ),
          //   onChanged: (value) => onFieldChanged(
          //     'securityQuestion',
          //     value,
          //   ),
          // ),
       

          DropdownButtonFormField<String>(
            value: viewModel.selectedSecurityQuestion,
            decoration: const InputDecoration(
              labelText: 'Security Question',
              hintText: 'Select your Security Question',
              border: OutlineInputBorder(),
            ),
            items: viewModel.securityQuestions.map((String question) {
              return DropdownMenuItem<String>(
                value: question,
                child: Text(question),
              );
            }).toList(),
            onChanged: (value) {
              onFieldChanged(
                'securityQuestion',
                value,
              );
              viewModel.selectedSecurityQuestion = value!;
            },
          ),
          const SizedBox(
            height: 16,
          ),
            TextFormField(
            controller:viewModel.securityAnswerController,
            
            decoration: const InputDecoration(
              labelText: 'Answer',
              hintText: 'Enter your Answer',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => onFieldChanged(
              'securityAnswer',
              value,
            ),
          
              
            
          ),

          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: viewModel.isFormValid
                ? onNext
                : viewModel.isPasswordValid &&
                        viewModel.isConfirmPasswordValid &&
                        viewModel.isSecurityQuestionValid
                    ? () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all the fields'),
                          ),
                        )
                    : () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Password, Confirm Password and Security Question are required'),
                          ),
                        ),
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }

  @override
  SecurityDetailsModel viewModelBuilder(
    BuildContext context,
  ) =>
      SecurityDetailsModel();
}
