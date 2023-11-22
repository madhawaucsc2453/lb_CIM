// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:register/widgets/customerDetails.dart';
import 'package:register/widgets/otherDetails.dart';
import 'package:register/widgets/securityDetails.dart';
import 'package:register/widgets/stepperComponent.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
 
  final Map<int, Map<String, double>> _formCompletion = {
    0: {
      'firstName': 0.0,
      'lastName': 0.0,
    },
    1: {'password': 0.0, 'confirmPassword': 0.0},
    2: {'address': 0.0, },
  };


  final Map<int, GlobalKey<FormState>> _formKeys = {
    0: GlobalKey<FormState>(),
    1: GlobalKey<FormState>(),
    2: GlobalKey<FormState>(),
  };
  double calculatePageProgress(int index) {
    int totalFields = _formCompletion[index]?.length ?? 0;
    double filledFields =
        _formCompletion[index]?.values.reduce((a, b) => a + b) ?? 0.0;

    return totalFields > 0 ? filledFields / totalFields : 0.0;
  }

  void _submit() {
    final form = _formKeys[_currentIndex]?.currentState;

    if (form != null && form.validate()) {
      setState(() {
        _formCompletion[_currentIndex]?.forEach((key, value) {
          _formCompletion[_currentIndex]?[key] = 1.0;
        });
      });
      _goToPage(_currentIndex + 1);
    }
  }

  void _goToPage(
    int pageIndex,
  ) {
    setState(() {
      _currentIndex = pageIndex;
    });
    _pageController.jumpToPage(pageIndex);
  }

  void _updateProgress(int index, String field, double progress) {
    setState(() {
      _formCompletion[index]?[field] = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageStorage(
          bucket: PageStorageBucket(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Image(
                image: AssetImage('assets/images/images.png'),
                height: 100,
                width: 100,
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (index) => StepperComponent(
                        currentIndex: _currentIndex,
                        index: index,
                        onTap: () => _goToPage(index),
                        progress: calculatePageProgress(index),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return PageView.builder(
                      controller: _pageController,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          child: Center(
                            child: Column(
                              children: [
                                // Content for each page
                                _buildPageContent(index, constraints),

                                Text(
                                  'Progress: ${calculatePageProgress(index) * 100}%',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageContent(int index, BoxConstraints constraints) {
    return _buildDetailsWidget(index, constraints);
  }

  Widget _buildDetailsWidget(int index, BoxConstraints constraints) {
    final detailsWidgets = [
      CustomerDetails(
        formKey: _formKeys[index]!,
        updateProgressCallback: (field, progress) =>
            _updateProgress(index, field, progress),
        submitCallback: () => _submit(),
        formData: _formCompletion[index]!,
      ),
      SecurityDetails(
        formKey: _formKeys[index]!,
        updateProgressCallback: (field, progress) =>
            _updateProgress(index, field, progress),
        submitCallback: () => _submit(),
        formData: _formCompletion[index]!,
      ),
      OtherDetails(
        formKey: _formKeys[index]!,
        updateProgressCallback: (field, progress) =>
            _updateProgress(index, field, progress),
        submitCallback: () => _submit(),
        formData: _formCompletion[index]!,
      ),
    ];

    return detailsWidgets[index];
  }
}
