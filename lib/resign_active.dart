import 'resign_active_platform_interface.dart';

class ResignActive {
  Future<String?> pushViewController() {
    return ResignActivePlatform.instance.pushViewController();
  }
}
