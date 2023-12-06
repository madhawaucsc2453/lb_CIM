import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SecurityDetailsModel extends BaseViewModel {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController securityQuestionController = TextEditingController();

  
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
}
