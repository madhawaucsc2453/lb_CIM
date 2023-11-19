// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CustomStepper(),
  ));
}

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final Map<int, Map<String, double>> _formCompletion = {
    0: {
      'firstName': 0.0,
      'lastName': 0.0,
      'email': 0.0,
      'phone': 0.0,
    },
    1: {
      'password': 0.0,
      'confirm password': 0.0,
    },
    2: {
      'address': 0.0,
      'province': 0.0,
      'city': 0.0,
    },
  };

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController addressController;
  late TextEditingController confirmPasswordController;
  late TextEditingController provinceController;
  late TextEditingController cityController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    addressController = TextEditingController();
    confirmPasswordController = TextEditingController();
    provinceController = TextEditingController();
    cityController = TextEditingController();

    // Add listeners to controllers
    firstNameController.addListener(() => _updateProgress(
        0, 'firstName', _isFieldValid(firstNameController.text)));
    lastNameController.addListener(() =>
        _updateProgress(0, 'lastName', _isFieldValid(lastNameController.text)));
    emailController.addListener(
        () => _updateProgress(0, 'email', _isFieldValid(emailController.text)));
    phoneController.addListener(
        () => _updateProgress(0, 'phone', _isFieldValid(phoneController.text)));
    passwordController.addListener(() =>
        _updateProgress(1, 'password', _isFieldValid(passwordController.text)));
    addressController.addListener(() =>
        _updateProgress(2, 'address', _isFieldValid(addressController.text)));
    confirmPasswordController.addListener(() => _updateProgress(
        1, 'confirm password', _isFieldValid(confirmPasswordController.text)));
    provinceController.addListener(() =>
        _updateProgress(2, 'province', _isFieldValid(provinceController.text)));
    cityController.addListener(
        () => _updateProgress(2, 'city', _isFieldValid(cityController.text)));
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

  @override
  void dispose() {
    // Dispose controllers
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    addressController.dispose();
    confirmPasswordController.dispose();
    provinceController.dispose();
    cityController.dispose();
    _pageController.dispose();

    super.dispose();
  }

  double calculatePageProgress(int index) {
    int totalFields = _formCompletion[index]?.length ?? 0;
    double filledFields =
        _formCompletion[index]?.values.reduce((a, b) => a + b) ?? 0.0;

    return filledFields / totalFields;
  }

  void _submit() {
    final form = _formKeys[_currentIndex].currentState;
    if (form != null && form.validate()) {
      setState(() {
        _formCompletion[_currentIndex]?.forEach((key, value) {
          _formCompletion[_currentIndex]?[key] = 1.0;
        });

        if (_currentIndex <= 2) {
          _currentIndex++;
        }
      });
      _pageController.jumpToPage(_currentIndex);
    }
  }

  void _goToPage(int pageIndex) {
    setState(() {
      _currentIndex = pageIndex;
    });
    _pageController.jumpToPage(pageIndex);
  }

  void _updateProgress(int index, String fieldName, double progress) {
    setState(() {
      _formCompletion[index]?[fieldName] = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StepperComponent(
                      currentIndex: _currentIndex,
                      index: 0,
                      onTap: () => _goToPage(0),
                      progress: calculatePageProgress(0),
                    ),
                    StepperComponent(
                      currentIndex: _currentIndex,
                      index: 1,
                      onTap: () => _goToPage(1),
                      progress: calculatePageProgress(1),
                    ),
                    StepperComponent(
                      currentIndex: _currentIndex,
                      index: 2,
                      onTap: () {
                        _goToPage(2);
                      },
                      progress: calculatePageProgress(2),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
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
                              _buildPageContent(index),
                              ElevatedButton(
                                onPressed: _currentIndex < 2 ? _submit : null,
                                child: const Text('Next'),
                              ),
                              const SizedBox(height: 10),
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
    );
  }

  Widget _buildPageContent(int index) {
    return Form(
      key: _formKeys[index],
      child: Column(
        children: [
          if (index == 0)
            Column(
              children: [
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone';
                    }
                    return null;
                  },
                ),
              ],
            ),
          if (index == 1)
            Column(
              children: [
                TextFormField(
                  controller: passwordController,
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
              ],
            ),
          if (index == 2)
            Column(
              children: [
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: provinceController,
                  decoration: const InputDecoration(
                    labelText: 'Province',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your province';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
              ],
            ),
          if (index == 3) const Text('Success'),
        ],
      ),
    );
  }
}

class StepperComponent extends StatefulWidget {
  int index;
  int currentIndex;
  VoidCallback onTap;
  double progress;

  StepperComponent({
    Key? key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    required this.progress,
  }) : super(key: key);

  @override
  State<StepperComponent> createState() => _StepperComponentState();
}

class _StepperComponentState extends State<StepperComponent> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Expanded(
  child: Column(
    children: [
      Row(
        children: [
          Container(
            child: widget.index == 0
                ? Expanded(
                    child: Container(
                      height: 5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100)
                    ),
                     color: Colors.pink,
                  ),
                  
                  
                ),  
                  )
                : Expanded(
                    child: Container(
                      height: 5,
                      color: widget.currentIndex >= widget.index
                          ? Colors.pink
                          : Colors.black12,
                    ),
                  ),
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              width: width * 0.1,
              height: height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: widget.progress == 1.0
                    ? Colors.pink
                    : widget.currentIndex >= widget.index
                        ? const Color.fromRGBO(228, 184, 198, 1)
                        : Colors.grey,
                border: Border.all(
                  color: widget.currentIndex >= widget.index
                      ? Colors.pink
                      : Colors.black12,
                ),
              ),
              child: Center(
                child: Stack(
                  children: [
                    SizedBox(
                      width: width * 0.1,
                      height: height * 0.05,
                      child: CircularProgressIndicator(
                        value: widget.progress,
                        strokeWidth: 3.0,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          widget.progress == 1.0 ? Colors.pink : Colors.pink,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '${widget.index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
             Container(
            child: widget.index == 2
                ? Expanded(
                    child: Container(
                      height: 5,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100)
                    ),
                     color: widget.currentIndex==2 && widget.progress==1.0?Colors.pink:Colors.black12,
                  ),
                  
                  
                ),  
                  )
                : Expanded(
                    child: Container(
                      height: 5,
                      color: widget.currentIndex >= widget.index + 1
                          ? Colors.pink
                          : Colors.black12,
                    ),
                  ),
             
            ),
          
        ],
      ),
    ],
  ),
);
  }
}
