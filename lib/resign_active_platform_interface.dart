import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'resign_active_method_channel.dart';

abstract class ResignActivePlatform extends PlatformInterface {
  /// Constructs a ResignActivePlatform.
  ResignActivePlatform() : super(token: _token);

  static final Object _token = Object();

  static ResignActivePlatform _instance = MethodChannelResignActive();

  /// The default instance of [ResignActivePlatform] to use.
  ///
  /// Defaults to [MethodChannelResignActive].
  static ResignActivePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ResignActivePlatform] when
  /// they register themselves.
  static set instance(ResignActivePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> pushViewController() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
