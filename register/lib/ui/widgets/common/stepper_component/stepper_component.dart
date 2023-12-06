// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'stepper_component_model.dart';

class StepperComponent extends StackedView<StepperComponentModel> {
  int index;
  int currentPageIndex;
  VoidCallback onTap;
  double progress;
  
  StepperComponent({Key? key, required this.index, required this.currentPageIndex, required this.onTap, required this.progress}) : super(key: key);
 


  
  @override
  Widget builder(
    BuildContext context,
    StepperComponentModel viewModel,
    Widget? child,
    
  ) {
   
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
              Container(
                child: index==0?
                Expanded(
                  child: Container(
                    height: 5,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        
                      ),
                      color: Colors.pink,
                    ),
                  ),
                  ):Expanded(
                   child: Container(
                    height: 5,
                    color: currentPageIndex >= index?
                    Colors.pink:Colors.black12,
                   ),
                  ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: width*0.1,
                  height: height*0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: progress==1.0?
                    Colors.pink:
                    currentPageIndex >= index?
                    const Color.fromRGBO(228, 184, 198, 1):Colors.grey,
                    border: Border.all(
                      color:currentPageIndex >= index?
                      Colors.pink:Colors.black12,
                    )
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        SizedBox(
                          width: width*0.1,
                          height: height*0.05,  
                          child: CircularProgressIndicator(
                            value: progress,
                            strokeWidth: 3,
                           valueColor: AlwaysStoppedAnimation<Color>(
                            progress==1.0?
                            Colors.pink:
                            Colors.pink,
                           ),
                          ),
                          ),
                          Center(
                            child: Text(
                              '${index+1}',
                              style: TextStyle(
                                color: progress==1.0?
                                Colors.white:
                                currentPageIndex >= index?
                                Colors.white:Colors.black12,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          )
                      ],
                        )
                    
                    ),
                  ),
                ),
              Container(
                child: index==2?
                Expanded(
                  child: Container(
                    height: 5,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                        
                      ),
                      color: currentPageIndex==2 && progress==1.0?
                      
                      Colors.pink:Colors.black12,
                    ),
                  ),
                  ):
                  Expanded(
                   child: Container(
                    height: 5,
                    color: currentPageIndex >= index+1 
                    ? Colors.pink:Colors.black12,
                   ),
                  ),
              ),
            ],
            )
          ],
        ),
      ),
    );
  }

  @override
  StepperComponentModel viewModelBuilder(
    BuildContext context,
  ) =>
      StepperComponentModel();
}
