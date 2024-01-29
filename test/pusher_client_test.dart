import 'package:flutter_test/flutter_test.dart';
import '../1/pusher_client.dart';
import '../1/pusher_client_platform_interface.dart';
import '../1/pusher_client_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPusherClientPlatform
    with MockPlatformInterfaceMixin
    implements PusherClientPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PusherClientPlatform initialPlatform = PusherClientPlatform.instance;

  test('$MethodChannelPusherClient is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPusherClient>());
  });

  test('getPlatformVersion', () async {
    PusherClient pusherClientPlugin = PusherClient();
    MockPusherClientPlatform fakePlatform = MockPusherClientPlatform();
    PusherClientPlatform.instance = fakePlatform;

    expect(await pusherClientPlugin.getPlatformVersion(), '42');
  });
}
