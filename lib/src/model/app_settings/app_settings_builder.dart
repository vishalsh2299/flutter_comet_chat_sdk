import 'package:flutter_comet_chat_sdk/flutter_comet_chat_sdk.dart';

class AppSettingsBuilder extends AppSettings {
  late AppSettings _appSettings;

  AppSettingsBuilder() {
    _appSettings = AppSettings();
  }

  AppSettings build() {
    return _appSettings;
  }

  setRegion(String region) {
    _appSettings.region = region;
    return _appSettings;
  }

  subcribePresenceForRoles(List<String> roles) {
    _appSettings.roles = roles;
    _appSettings.subscriptionType = AppSettings.SUBSCRIPTION_TYPE_ROLES;
  }

  subscribePresenceForAllUsers() {
    _appSettings.subscriptionType = AppSettings.SUBSCRIPTION_TYPE_ALL_USERS;
  }

  subscribePresenceForFriends() {
    _appSettings.subscriptionType = AppSettings.SUBSCRIPTION_TYPE_FRIENDS;
  }
}
