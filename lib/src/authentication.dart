import 'package:flutter_comet_chat_sdk/flutter_comet_chat_sdk.dart';
import 'package:flutter/services.dart';

/// Chat client - main entry point for the Chat SDK.
class Authentication {
  //#Channel to invoke native SDK.

  Future<dynamic> initialize({
    required String appId,
    required AppSettings appSettings,
  }) async {
    try {
      dynamic res = await FlutterCometChatDart.channel.invokeMethod(
          'initialize', {'appId': appId, 'appSettings': appSettings.toJson()});
      return res;
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<dynamic> login({
    String? authKey,
    String? uid,
    String? authToken,
  }) async {
    try {
      var res = await FlutterCometChatDart.channel.invokeMethod(
          'login', {'authKey': authKey, 'UID': uid, 'authToken': authToken});
      return res;
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<dynamic> logout() async {
    try {
      var res = await FlutterCometChatDart.channel.invokeMethod('logout');
      return res;
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<void> addLoginListener(String uniqueID) async {
    try {
      await FlutterCometChatDart.channel
          .invokeMethod('add_login_listeners', {"uniqueId": uniqueID});
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<void> removeLoginListener() async {
    try {
      await FlutterCometChatDart.channel.invokeMethod('remove_login_listeners');
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Stream<dynamic> loginEventTrigger() {
    return FlutterCometChatDart.loginEventTrigger.receiveBroadcastStream();
  }

  Stream<dynamic> loginEventListener() {
    return FlutterCometChatDart.loginEventListener.receiveBroadcastStream();
  }
}
