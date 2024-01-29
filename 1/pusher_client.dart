
import 'pusher_client_platform_interface.dart';

class PusherClient {
  Future<String?> getPlatformVersion() {
    return PusherClientPlatform.instance.getPlatformVersion();
  }
}
