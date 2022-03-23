import 'package:flutter/services.dart';
import 'package:flutter_comet_chat_sdk/flutter_comet_chat_sdk.dart';

///Includes everthing needed to send and recieve messages.
class Messaging {
  Future<void> addMessageListeners(String listenerID) async {
    try {
      await FlutterCometChatDart.channel.invokeMethod('add_message_listeners', {
        "listenerID": listenerID,
      });
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<void> removeMessageListeners(String listenerID) async {
    try {
      await FlutterCometChatDart.channel
          .invokeMethod('remove_message_listeners', {
        "listenerID": listenerID,
      });
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<void> sendMessage(TextMessage textMessage) async {
    try {
      await FlutterCometChatDart.channel.invokeMethod('send_message', {
        "textMessage": textMessage.toJson(),
      });
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  // Delete message
  Future<void> deleteMessage(int id) async {
    try {
      await FlutterCometChatDart.channel.invokeMethod('delete_message', {
        "id": id,
      });
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  // Mark as Read
  Future<void> markAsRead(
      int id, String receiverId, String receiverType) async {
    try {
      await FlutterCometChatDart.channel.invokeMethod('mark_as_read', {
        "id": id,
        "receiverId": receiverId,
        "receiverType": receiverType,
      });
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  // Get Messsages receipts
  Future<void> getMessageReceipts(int id) async {
    try {
      await FlutterCometChatDart.channel
          .invokeMethod('get_message_receipts', {"id": id});
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<int> getLastDeliveredMessageId() async {
    try {
      int latestId = await FlutterCometChatDart.channel
          .invokeMethod('get_last_delivered_message_id');
      return latestId;
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  //# Messages Count Start
  Future<void> getUnreadMessageCount(bool hideMessagesFromBlockedUsers) async {
    try {
      await FlutterCometChatDart.channel.invokeMethod(
          'get_unread_message_count',
          {"hideMessagesFromBlockedUsers": hideMessagesFromBlockedUsers});
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<void> getUnreadMessageCountForAllUsers(
      bool hideMessagesFromBlockedUsers) async {
    try {
      await FlutterCometChatDart.channel.invokeMethod(
          'get_unread_message_count_for_all_users',
          {"hideMessagesFromBlockedUsers": hideMessagesFromBlockedUsers});
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<void> getUnreadMessageCountForAllGroups(
      bool hideMessagesFromBlockedUsers) async {
    try {
      await FlutterCometChatDart.channel.invokeMethod(
          'get_unread_message_count_for_all_groups',
          {"hideMessagesFromBlockedUsers": hideMessagesFromBlockedUsers});
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<void> getUnreadMessageCountForUser(
      String uid, bool hideMessagesFromBlockedUsers) async {
    try {
      await FlutterCometChatDart.channel
          .invokeMethod('get_unread_message_count_for_user', {
        "UID": uid,
        "hideMessagesFromBlockedUsers": hideMessagesFromBlockedUsers,
      });
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }

  Future<void> getUnreadMessageCountForGroup(
      String guid, bool hideMessagesFromBlockedUsers) async {
    try {
      await FlutterCometChatDart.channel
          .invokeMethod('get_unread_message_count_for_group', {
        "GUID": guid,
        "hideMessagesFromBlockedUsers": hideMessagesFromBlockedUsers,
      });
    } on PlatformException catch (e) {
      throw FlutterCometChatDart.convertException(e);
    }
  }
  //# Messages Count End

  Stream<dynamic> messageEventTrigger() {
    return FlutterCometChatDart.messageEventTrigger.receiveBroadcastStream();
  }

  Stream<dynamic> messageEventListener() {
    return FlutterCometChatDart.messageEventListener.receiveBroadcastStream();
  }
}
