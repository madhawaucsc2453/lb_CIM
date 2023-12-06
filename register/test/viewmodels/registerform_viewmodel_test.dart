import 'package:flutter_test/flutter_test.dart';
import 'package:register/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('RegisterformViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
