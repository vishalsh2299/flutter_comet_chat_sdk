import 'package:flutter_comet_chat_sdk/flutter_comet_chat_sdk.dart';

class AppSettings {
  // ignore: non_constant_identifier_names
  static String SUBSCRIPTION_TYPE_ALL_USERS =
      CometChatConstants.SUBSCRIPTION_TYPE_ALL_USERS;
  // ignore: non_constant_identifier_names
  static String SUBSCRIPTION_TYPE_FRIENDS =
      CometChatConstants.SUBSCRIPTION_TYPE_FRIENDS;
  // ignore: non_constant_identifier_names
  static String SUBSCRIPTION_TYPE_NONE =
      CometChatConstants.SUBSCRIPTION_TYPE_NONE;
  // ignore: non_constant_identifier_names
  static String SUBSCRIPTION_TYPE_ROLES =
      CometChatConstants.SUBSCRIPTION_TYPE_ROLES;

  String subscriptionType = SUBSCRIPTION_TYPE_NONE;
  String? region;
  List<String>? roles;

  String? getRegion() {
    return region;
  }

  List<String>? getRoles() {
    return roles;
  }

  String getSubscriptionType() {
    return subscriptionType;
  }

  void setRoles(List<String> roles) {
    this.roles = roles;
  }

  /// Update properties from a map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscriptionType'] = subscriptionType;
    data['region'] = region;
    data['roles'] = roles;
    return data;
  }
}
