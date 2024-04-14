import 'package:flutter_test/flutter_test.dart';
import 'package:resign_active/resign_active.dart';
import 'package:resign_active/resign_active_platform_interface.dart';
import 'package:resign_active/resign_active_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockResignActivePlatform
    with MockPlatformInterfaceMixin
    implements ResignActivePlatform {
  @override
  Future<String?> pushViewController() => Future.value('42');
}

void main() {
  final ResignActivePlatform initialPlatform = ResignActivePlatform.instance;

  test('$MethodChannelResignActive is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelResignActive>());
  });

  test('pushViewController', () async {
    ResignActive resignActivePlugin = ResignActive();
    MockResignActivePlatform fakePlatform = MockResignActivePlatform();
    ResignActivePlatform.instance = fakePlatform;

    expect(await resignActivePlugin.pushViewController(), '42');
  });
}
