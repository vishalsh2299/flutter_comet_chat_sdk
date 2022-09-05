import 'package:flutter/services.dart';
import 'package:flutter_comet_chat_sdk/flutter_comet_chat_sdk.dart';

class Calling {
  /// Calling methods
  Future<void> initiateCall(String receiverID,
      [String? receiverType, String? callType]) async {
    try {
      await FlutterCometChatDart.channel.invokeMethod('initiate_call', {
        'receiverID': receiverID,
        'receiverType': receiverType,
        'callType': callType
      });
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<dynamic> startCall(
      String sessionID, bool enableDefaultLayout, bool audioOnly) async {
    try {
      await FlutterCometChatDart.channel.invokeMethod('start_call', {
        "sessionID": sessionID,
        "enableDefaultLayout": enableDefaultLayout,
        "audioOnly": audioOnly
      });
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<dynamic> addCallListener(String listenerId) async {
    try {
      await FlutterCometChatDart.channel
          .invokeMethod('add_call_listener', {"listenerId": listenerId});
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<dynamic> removeCallListener(String listenerId) async {
    try {
      await FlutterCometChatDart.channel
          .invokeMethod('remove_call_listener', {"listenerId": listenerId});
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<dynamic> rejectCall(String sessionID) async {
    try {
      await FlutterCometChatDart.channel
          .invokeMethod('reject_call', {"sessionID": sessionID});
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<dynamic> acceptCall(String sessionID) async {
    try {
      await FlutterCometChatDart.channel
          .invokeMethod('accept_call', {"sessionID": sessionID});
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Stream<dynamic> callDetails() {
    return FlutterCometChatDart.callingEventChannel.receiveBroadcastStream();
  }
}
