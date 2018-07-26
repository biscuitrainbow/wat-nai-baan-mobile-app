import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  group('LOGIN TEST', () {
    FlutterDriver driver;

    setUp(() async {
      driver = await FlutterDriver.connect();
    });

    tearDown(() {
      driver?.close();
    });

    test('User should see login text', () async {
      final SerializableFinder loginText = find.text('Login');
      await driver.waitFor(loginText);
    });
  });
}
