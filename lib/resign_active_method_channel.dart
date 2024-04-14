import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'resign_active_platform_interface.dart';

/// An implementation of [ResignActivePlatform] that uses method channels.
class MethodChannelResignActive extends ResignActivePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('resign_active');

  @override
  Future<String?> pushViewController() async {
    final version =
        await methodChannel.invokeMethod<String>('pushViewController');
    return version;
  }
}
