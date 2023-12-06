// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:register/ui/views/registerform/registerform_view.dart' as _i2;
import 'package:register/ui/widgets/common/customer_details/customer_details.dart'
    as _i3;
import 'package:register/ui/widgets/common/other_details/other_details.dart'
    as _i4;
import 'package:register/ui/widgets/common/security_details/security_details.dart'
    as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i7;

class Routes {
  static const registerformView = '/registerform-view';

  static const customerDetails = '/customer-details';

  static const otherDetails = '/other-details';

  static const securityDetails = '/security-details';

  static const all = <String>{
    registerformView,
    customerDetails,
    otherDetails,
    securityDetails,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.registerformView,
      page: _i2.RegisterformView,
    ),
    _i1.RouteDef(
      Routes.customerDetails,
      page: _i3.CustomerDetails,
    ),
    _i1.RouteDef(
      Routes.otherDetails,
      page: _i4.OtherDetails,
    ),
    _i1.RouteDef(
      Routes.securityDetails,
      page: _i5.SecurityDetails,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.RegisterformView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.RegisterformView(),
        settings: data,
      );
    },
    _i3.CustomerDetails: (data) {
      final args = data.getArgs<CustomerDetailsArguments>(nullOk: false);
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.CustomerDetails(
            key: args.key,
            onFieldChanged: args.onFieldChanged,
            onNext: args.onNext,
            formData: args.formData),
        settings: data,
      );
    },
    _i4.OtherDetails: (data) {
      final args = data.getArgs<OtherDetailsArguments>(nullOk: false);
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.OtherDetails(
            key: args.key,
            onFieldChanged: args.onFieldChanged,
            onNext: args.onNext,
            formData: args.formData),
        settings: data,
      );
    },
    _i5.SecurityDetails: (data) {
      final args = data.getArgs<SecurityDetailsArguments>(nullOk: false);
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.SecurityDetails(
            key: args.key,
            onFieldChanged: args.onFieldChanged,
            onNext: args.onNext,
            formData: args.formData),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CustomerDetailsArguments {
  const CustomerDetailsArguments({
    this.key,
    required this.onFieldChanged,
    required this.onNext,
    required this.formData,
  });

  final _i6.Key? key;

  final void Function(
    String,
    dynamic,
  ) onFieldChanged;

  final void Function() onNext;

  final Map<int, Map<String, String>> formData;

  @override
  String toString() {
    return '{"key": "$key", "onFieldChanged": "$onFieldChanged", "onNext": "$onNext", "formData": "$formData"}';
  }

  @override
  bool operator ==(covariant CustomerDetailsArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.onFieldChanged == onFieldChanged &&
        other.onNext == onNext &&
        other.formData == formData;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        onFieldChanged.hashCode ^
        onNext.hashCode ^
        formData.hashCode;
  }
}

class OtherDetailsArguments {
  const OtherDetailsArguments({
    this.key,
    required this.onFieldChanged,
    required this.onNext,
    required this.formData,
  });

  final _i6.Key? key;

  final dynamic Function(
    String,
    dynamic,
  ) onFieldChanged;

  final dynamic Function() onNext;

  final Map<int, Map<String, String>> formData;

  @override
  String toString() {
    return '{"key": "$key", "onFieldChanged": "$onFieldChanged", "onNext": "$onNext", "formData": "$formData"}';
  }

  @override
  bool operator ==(covariant OtherDetailsArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.onFieldChanged == onFieldChanged &&
        other.onNext == onNext &&
        other.formData == formData;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        onFieldChanged.hashCode ^
        onNext.hashCode ^
        formData.hashCode;
  }
}

class SecurityDetailsArguments {
  const SecurityDetailsArguments({
    this.key,
    required this.onFieldChanged,
    required this.onNext,
    required this.formData,
  });

  final _i6.Key? key;

  final dynamic Function(
    String,
    dynamic,
  ) onFieldChanged;

  final dynamic Function() onNext;

  final Map<int, Map<String, String>> formData;

  @override
  String toString() {
    return '{"key": "$key", "onFieldChanged": "$onFieldChanged", "onNext": "$onNext", "formData": "$formData"}';
  }

  @override
  bool operator ==(covariant SecurityDetailsArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.onFieldChanged == onFieldChanged &&
        other.onNext == onNext &&
        other.formData == formData;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        onFieldChanged.hashCode ^
        onNext.hashCode ^
        formData.hashCode;
  }
}

extension NavigatorStateExtension on _i7.NavigationService {
  Future<dynamic> navigateToRegisterformView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerformView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCustomerDetails({
    _i6.Key? key,
    required void Function(
      String,
      dynamic,
    ) onFieldChanged,
    required void Function() onNext,
    required Map<int, Map<String, String>> formData,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.customerDetails,
        arguments: CustomerDetailsArguments(
            key: key,
            onFieldChanged: onFieldChanged,
            onNext: onNext,
            formData: formData),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtherDetails({
    _i6.Key? key,
    required dynamic Function(
      String,
      dynamic,
    ) onFieldChanged,
    required dynamic Function() onNext,
    required Map<int, Map<String, String>> formData,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.otherDetails,
        arguments: OtherDetailsArguments(
            key: key,
            onFieldChanged: onFieldChanged,
            onNext: onNext,
            formData: formData),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSecurityDetails({
    _i6.Key? key,
    required dynamic Function(
      String,
      dynamic,
    ) onFieldChanged,
    required dynamic Function() onNext,
    required Map<int, Map<String, String>> formData,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.securityDetails,
        arguments: SecurityDetailsArguments(
            key: key,
            onFieldChanged: onFieldChanged,
            onNext: onNext,
            formData: formData),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterformView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerformView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCustomerDetails({
    _i6.Key? key,
    required void Function(
      String,
      dynamic,
    ) onFieldChanged,
    required void Function() onNext,
    required Map<int, Map<String, String>> formData,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.customerDetails,
        arguments: CustomerDetailsArguments(
            key: key,
            onFieldChanged: onFieldChanged,
            onNext: onNext,
            formData: formData),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtherDetails({
    _i6.Key? key,
    required dynamic Function(
      String,
      dynamic,
    ) onFieldChanged,
    required dynamic Function() onNext,
    required Map<int, Map<String, String>> formData,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.otherDetails,
        arguments: OtherDetailsArguments(
            key: key,
            onFieldChanged: onFieldChanged,
            onNext: onNext,
            formData: formData),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSecurityDetails({
    _i6.Key? key,
    required dynamic Function(
      String,
      dynamic,
    ) onFieldChanged,
    required dynamic Function() onNext,
    required Map<int, Map<String, String>> formData,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.securityDetails,
        arguments: SecurityDetailsArguments(
            key: key,
            onFieldChanged: onFieldChanged,
            onNext: onNext,
            formData: formData),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
