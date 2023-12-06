import 'package:flutter/material.dart';


import 'package:stacked/stacked.dart';


class OtherDetailsModel extends BaseViewModel {


  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();


  @override
  void dispose() {
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    super.dispose();
  }
  bool get isAddressValid =>
  addressController.text.isNotEmpty;
  bool get isCityValid =>
  cityController.text.isNotEmpty;
  bool get isStateValid =>
  stateController.text.isNotEmpty;
  bool get isZipValid =>
  zipController.text.isNotEmpty && zipController.text.length==6 && int.tryParse(zipController.text)!=null;
  bool get isFormValid =>
  isAddressValid && isCityValid && isStateValid && isZipValid;

  void submit (final Map<int,Map<String, String>> formData){
    
  }

 

}
 
 
