import 'package:flutter_comet_chat_sdk/flutter_comet_chat_sdk.dart';

class AppEntity {
  AppEntity();

  /// Update properties from a map.
  Map<String, dynamic>? toJson() {
    if (this is BaseMessage) {
      return toJson();
    }
    if (this is User) {
      return toJson();
    }

    return null;
  }

  factory AppEntity.fromJson(Map<dynamic, dynamic> json, String type) {
    if (type == "baseMessage") {
      return BaseMessage.fromJson(json);
    }
    if (type == "user") {
      return User.fromJson(json);
    }
    return User.fromJson(json);
  }
}
