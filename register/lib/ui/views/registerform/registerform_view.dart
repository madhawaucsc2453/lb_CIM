import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/common/stepper_component/stepper_component.dart';
import 'registerform_viewmodel.dart';

class RegisterformView extends StackedView<RegisterformViewModel> {
  const RegisterformView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterformViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                child: Text(
                  viewModel.pageTitles[viewModel.currentPageIndex],
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
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
                        index: index,
                        currentPageIndex: viewModel.currentPageIndex,
                        progress: viewModel.progressCalculate(index),
                        onTap: () => viewModel.goToPage(index),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: LayoutBuilder(
                builder: (context, constraints) {
                  return PageView.builder(
                      controller: viewModel.pageController,
                      itemCount: 3,
                      itemBuilder: (context, index) => SizedBox(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            child: SingleChildScrollView(
                              child: Center(
                                child: Column(
                                  children: [
                                    viewModel.buildPageContent(index),
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  RegisterformViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterformViewModel();
}
