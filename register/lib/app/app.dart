import 'package:register/ui/widgets/common/customer_details/customer_details.dart';
import 'package:register/ui/widgets/common/other_details/other_details.dart';
import 'package:register/ui/widgets/common/security_details/security_details.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:register/ui/views/registerform/registerform_view.dart';


// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: RegisterformView),
    MaterialRoute(page: CustomerDetails),
    MaterialRoute(page: OtherDetails),
    MaterialRoute(page: SecurityDetails),

// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    
    // @stacked-service
  ],

)
class App {}
