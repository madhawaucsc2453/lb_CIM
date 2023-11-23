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

  final Map<int, Map<String, String>> _formData = {
    0: {'firstName': '', 'lastName': '', 'email': '', 'phone': ''},
    1: {'password': '', 'confirmPassword': '', 'securityQuestion': ''},
    2: {'address': '', 'city': '', 'state': '', 'zip': ''},
  };
  final List<String> _pageTitles = [
    'Customer Details',
    'Security Details',
    'Other Details',
  ];


  double calculatePageProgress(int index) {
    int totalFields = _formData[index]?.length ?? 0;
    double filledFields = 0;
    if(totalFields > 0){
      _formData[index]?.forEach((key, value) {
        if (value.isNotEmpty) {
          filledFields += 1;
        }
      });
    }

    return totalFields > 0 ? filledFields / totalFields : 0.0;
  }

  void _goToPage(
    int pageIndex,
  ) {
    setState(() {
      _currentIndex = pageIndex;
    });
    _pageController.jumpToPage(pageIndex);
  }

  void _updateProgress(int index, String field, dynamic value) {
    setState(() {
      _formData[index]?[field] = value;
    });
  }

  void _onNext() {
    if (_currentIndex < 2) {
      _goToPage(_currentIndex + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: PageStorage(
            
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
                const SizedBox(
                  height: 10,
                ),
                Center(
                  //set index name
                  child: Text(
                    _pageTitles[_currentIndex],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                            child: SingleChildScrollView(
                              child: Center(
                                child: Column(
                                  children: [
                                    // Content for each page
                                    _buildPageContent(index, constraints),
                                        
                                  ],
                                ),
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
      ),
    );
  }

  Widget _buildPageContent(int index, BoxConstraints constraints) {
    return _buildDetailsWidget(index, constraints);
  }

  Widget _buildDetailsWidget(int index, BoxConstraints constraints) {
    final detailsWidgets = [
      CustomerDetails(
        onFieldChanged: (field, progress) =>
            _updateProgress(index, field, progress),
        onNext: _onNext,
        formData: _formData[index]??{},
      ),
      SecurityDetails(
        onFieldChanged: (field, progress) =>
            _updateProgress(index, field, progress),
        onNext: _onNext,
        formData: _formData[index]??{},
      ),
      OtherDetails(
        onFieldChanged: (field, progress) =>
            _updateProgress(index, field, progress),
        onNext: _onNext,
        formData: _formData[index]??{},
      ),
    ];

    return detailsWidgets[index];
  }
}
