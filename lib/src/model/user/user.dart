import 'dart:convert';
import 'package:flutter_comet_chat_sdk/flutter_comet_chat_sdk.dart';

enum UserStatus { online, offline }

class User extends AppEntity {
  String? avatar;
  bool? blockedByMe = false;
  int? credits;
  bool? hasBlockedMe = false;
  num? lastActiveAt;
  String? link;
  Map<dynamic, dynamic>? metadata;
  String? name;
  String? role;
  UserStatus? status;
  String? statusMessage;
  String? uid;

  /// Construct from a map.
  User.fromJson(Map<dynamic, dynamic> json) {
    avatar = json['avatar'];
    blockedByMe = json['blockedByMe'];
    credits = json['credits'];
    hasBlockedMe = json['hasBlockedMe'];
    lastActiveAt = json['lastActiveAt'];
    link = json['link'];
    metadata = json['metadata'];
    name = json['name'];
    role = json['role'];
    status = getUserStatus(json['status']);
    statusMessage = json['statusMessage'];
    uid = json['uid'];
  }

  UserStatus? getUserStatus(String value) {
    switch (value) {
      case "online":
        return UserStatus.online;
      case "offline":
        return UserStatus.offline;

      default:
    }
  }

  /// Update properties from a map.
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['blockedByMe'] = blockedByMe ?? false;
    data['credits'] = credits;
    data['hasBlockedMe'] = hasBlockedMe ?? false;
    data['lastActiveAt'] = lastActiveAt ?? -1;
    data['link'] = link;
    data['metadata'] = metadata ?? {};
    data['name'] = name;
    data['role'] = role;
    data['status'] = status.toString();
    data['statusMessage'] = statusMessage;
    data['uid'] = uid;
    return data;
  }

  /// Gives list of User type
  static List<User> listFromJsonArray(String json) {
    List convertedJson = jsonDecode(json);
    return convertedJson.map((e) => User.fromJson(e)).toList();
  }

  ///
  static Map<String, User> fromJsonArray(String json) {
    Map<String, dynamic> convertedJson = jsonDecode(json);
    Map<String, User> map = <String, User>{};
    if (convertedJson != null) {
      convertedJson.forEach((key, value) {
        map[key] = User.fromJson(value);
      });
    }
    return map;
  }

  /// Overrides toString
  @override
  String toString() => toJson().toString();

  /// Overrides toMap
  Map<String, dynamic> toMap() => toJson();

  /// Override  "=="
  @override
  bool operator ==(o) => (o is User &&
      o.avatar == avatar &&
      o.blockedByMe == blockedByMe &&
      o.credits == credits &&
      o.hasBlockedMe == hasBlockedMe &&
      o.lastActiveAt == lastActiveAt &&
      o.link == link &&
      o.metadata == metadata &&
      o.name == name &&
      o.role == role &&
      o.status == status &&
      o.statusMessage == statusMessage &&
      o.uid == uid);

  /// Overrides HashCode
  @override
  int get hashCode => (avatar.hashCode ^
      blockedByMe.hashCode ^
      credits.hashCode ^
      hasBlockedMe.hashCode ^
      lastActiveAt.hashCode ^
      link.hashCode ^
      metadata.hashCode ^
      name.hashCode ^
      role.hashCode ^
      status.hashCode ^
      statusMessage.hashCode ^
      uid.hashCode);

  /// Get avatar of the user
  String getAvatar() {
    return avatar ?? "";
  }

  /// Get credits of the user
  int getCredits() {
    return credits ?? -1;
  }

  /// Get last online timestamp of the user
  num? getLastActiveAt() {
    return lastActiveAt;
  }

  /// Get link of the user
  String getLink() {
    return link ?? "";
  }

  /// Get JSONObject of data set by developer
  Map<dynamic, dynamic>? getMetadata() {
    return metadata;
  }

  /// Get name of the user
  String getName() {
    return name ?? "";
  }

  /// Get role of the user set by developer
  String getRole() {
    return role ?? "";
  }

  /// Get status of the user
  UserStatus? getStatus() {
    return status;
  }

  /// Get status message set by developer
  String getStatusMessage() {
    return statusMessage ?? "";
  }

  /// Get unique identifier of the User
  String getUid() {
    return uid ?? "";
  }

  /// Get whether the user has been blocked by logged in user
  bool isBlockedByMe() {
    return blockedByMe ?? false;
  }

  /// Get whether the user has blocked logged in user
  bool isHasBlockedMe() {
    return hasBlockedMe ?? false;
  }

  /// Set avatar of the user
  void setAvatar(String avatar) {
    this.avatar = avatar;
  }

  /// Set whether the user has been blocked by logged in user
  void setBlockedByMe(bool blockedByMe) {
    this.blockedByMe = blockedByMe;
  }

  /// Set credits of user
  void setCredits(int credits) {
    this.credits = credits;
  }

  /// Set whether the user has blocked logged in user
  void setHasBlockedMe(bool hasBlockedMe) {
    this.hasBlockedMe = hasBlockedMe;
  }

  /// Set last online timestamp of the user
  void setLastActiveAt(num lastActiveAt) {
    this.lastActiveAt = lastActiveAt;
  }

  /// Set link of the user
  void setLink(String link) {
    this.link = link;
  }

  /// Set JSONObject of data set by developer
  void setMetadata(Map<dynamic, dynamic> metadata) {
    this.metadata = metadata;
  }

  /// Set name of the user
  void setName(String name) {
    this.name = name;
  }

  /// Set role of the user set by developer
  void setRole(String role) {
    this.role = role;
  }

  /// Set status of the user
  void setStatus(UserStatus status) {
    this.status = status;
  }

  /// Set status message set by developer
  void setStatusMessage(String statusMessage) {
    this.statusMessage = statusMessage;
  }

  /// Set unique identifier of the User
  void setUid(String uid) {
    this.uid = uid;
  }
}

/*
equals
fromJsonArray
 */
