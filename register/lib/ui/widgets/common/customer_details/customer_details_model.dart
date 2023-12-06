import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CustomerDetailsModel extends BaseViewModel {


  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  

    @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
 bool get isFirstNameValid =>
 firstNameController.text.isNotEmpty ;
  bool get isLastNameValid =>
  lastNameController.text.isNotEmpty ;
  bool get isEmailValid =>
  emailController.text.isNotEmpty ;
  bool get isPhoneValid =>
  phoneController.text.isNotEmpty && phoneController.text.length==10 && int.tryParse(phoneController.text)!=null;
  bool get isFormValid =>
  isFirstNameValid && isLastNameValid && isEmailValid && isPhoneValid; 

  



 




}

