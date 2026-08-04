import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_eleonoraguzzy/core/services/local_storage/splash_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('shows the splash once and skips it afterwards', () async {
    SharedPreferences.setMockInitialValues({});

    expect(await SplashStorage.shouldShowSplash(), isTrue);
    expect(await SplashStorage.shouldShowSplash(), isFalse);
  });
}
