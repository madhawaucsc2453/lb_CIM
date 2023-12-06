import 'package:flutter/material.dart';
import 'package:register/ui/widgets/common/other_details/other_details.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/common/customer_details/customer_details.dart';
import '../../widgets/common/security_details/security_details.dart';

class RegisterformViewModel extends BaseViewModel {
  final PageController pageController=PageController();
final List<String> pageTitles=[
  'Customer Details',
  'Security Details',
  'Other Details',
  

];
final Map<int,Map<String, String>> pageData={
  0:{
    'firstName':'',
    'lastName':'',
    'email':'',
    'phone':'',

   
  },
  1:{
    'password':'',
    'confirmPassword':'',
    'securityQuestion':'',
  },
  2:{
    'address':'',
    'city':'',
    'state':'',
    'zip':'',

  }
};

  int _currentPageIndex=0;
  
  int get currentPageIndex=>_currentPageIndex;
  
 
  
  void _onNext(){
    if(_currentPageIndex<=2){
      goToPage(_currentPageIndex+1);
      notifyListeners();
    }
  }
  void updateProgress( int index,String field, dynamic value){
    pageData[index]![field]=value;
    notifyListeners();
  }

  double progressCalculate(int index){
   int totalFields=pageData[index]?.length??0;
   double filledFields=0;
   if(totalFields>0){
     pageData[index]!.forEach((key, value) {
       if(value.isNotEmpty){
         filledFields++;
       }
     });
   }
   return totalFields>0?filledFields/totalFields:0.0;
  }
  

 
  void setCurrentPageIndex(int index){
    _currentPageIndex=index;
    notifyListeners();
  }
void goToPage(int index){
   _currentPageIndex=index;
   pageController.jumpToPage(index);
    notifyListeners();
  
}

  buildPageContent(int index) {
   return buildDetailsForm(index);

  }
  
  buildDetailsForm(int index) {
    final detailsWidget=[
      CustomerDetails(
        onFieldChanged:(field,progress)=>updateProgress(index,field,progress),
        onNext:_onNext,
        formData:pageData,
      ),
      SecurityDetails(
      onFieldChanged:(field,progress)=>updateProgress(index,field,progress),
        onNext:_onNext,
        formData:pageData,
      ),
      OtherDetails(
    onFieldChanged:(field,progress)=>updateProgress(index,field,progress),
        onNext:_onNext,
        formData:pageData,
      ),
    ];
    return detailsWidget[index];
  }
  
  
}
