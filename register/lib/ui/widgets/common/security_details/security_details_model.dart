// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SecurityDetailsModel extends BaseViewModel {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController securityQuestionController = TextEditingController();
  TextEditingController securityAnswerController = TextEditingController();
 
  
  bool get isPasswordValid =>
  passwordController.text.isNotEmpty && passwordController.text.length>=8;
  bool get isConfirmPasswordValid =>
  confirmPasswordController.text.isNotEmpty && confirmPasswordController.text==passwordController.text;
  bool get isSecurityQuestionValid =>
  securityQuestionController.text.isNotEmpty;
  bool get isFormValid =>
  isPasswordValid && isConfirmPasswordValid && isSecurityQuestionValid;

  bool _visible=true;

  bool get visiblebool=>_visible;
  String selectedSecurityQuestion='What is your favorite color?';

  void visible(){
    if(_visible==true){
      _visible=false;
    }
    else{
      _visible=true;
    }
    notifyListeners();
  }
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    securityQuestionController.dispose();
    super.dispose();
  }
 List<String> securityQuestions=[
    'What is your favorite color?',
    'What is your favorite food?',
    'What is your favorite movie?',
    'What is your favorite book?',
    'What is your favorite game?',
    'What is your favorite animal?',
    'What is your favorite sport?',
    'What is your favorite hobby?',
    'What is your favorite song?',
    'What is your favorite cartoon?',
    'What is your favorite subject?',
    'What is your favorite teacher?',
    'What is your favorite place?',
    'What is your favorite country?',
    'What is your favorite city?',
    'What is your favorite state?',
    'What is your favorite flower?',
    'What is your favorite tree?',
    'What is your favorite fruit?',
    'What is your favorite vegetable?',
    'What is your favorite car?',
    'What is your favorite bike?',
    'What is your favorite bike?',
    'What is your favorite bike?',
    
 ];



}


