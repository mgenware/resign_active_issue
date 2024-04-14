import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resign_active/resign_active_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelResignActive platform = MethodChannelResignActive();
  const MethodChannel channel = MethodChannel('resign_active');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('pushViewController', () async {
    expect(await platform.pushViewController(), '42');
  });
}
