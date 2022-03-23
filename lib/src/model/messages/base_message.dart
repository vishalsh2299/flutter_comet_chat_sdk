import 'package:flutter_comet_chat_sdk/flutter_comet_chat_sdk.dart';

enum ReceiverType { user, group }
enum MessageType { text, image, video, audio, file, custom, groupMember }

class BaseMessage extends AppEntity {
  String? category;
  String? conversationId;
  int? deletedAt;
  String? deletedBy;
  int? deliveredAt;
  int? deliveredToMeAt;
  int? editedAt;
  String? editedBy;
  int? id;
  Map<dynamic, dynamic>? metadata;
  String? muid;
  int? readAt;
  int? readByMeAt;
  AppEntity? receiver;
  ReceiverType receiverType;
  String receiverUid;
  User? sender;
  int? sentAt;
  // ignore: non_constant_identifier_names
  static String TABLE_CONVERSATIONS = CometChatConstants.TABLE_CONVERSATIONS;
  MessageType type;
  int? updatedAt;
  int? parentMessageId;

  BaseMessage({
    this.receiverUid = '',
    this.type = MessageType.text,
    this.receiverType = ReceiverType.user,
  }) {
    receiverUid = receiverUid;
    type = type;
    receiverType = receiverType;
  }

  /// Override  "=="
  @override
  bool operator ==(o) => (o is BaseMessage &&
      o.category == category &&
      o.conversationId == conversationId &&
      o.deletedAt == deletedAt &&
      o.deletedBy == deletedBy &&
      o.deliveredAt == deliveredAt &&
      o.deliveredToMeAt == deliveredToMeAt &&
      o.editedAt == editedAt &&
      o.editedBy == editedBy &&
      o.id == id &&
      o.metadata == metadata &&
      o.muid == muid &&
      o.readAt == readAt &&
      o.readByMeAt == readByMeAt &&
      o.receiverType == receiverType &&
      o.sender == sender &&
      o.sentAt == sentAt &&
      o.type == type &&
      o.updatedAt == updatedAt);

  /// Overrides HashCode
  @override
  int get hashCode => (category.hashCode ^
      conversationId.hashCode ^
      deletedAt.hashCode ^
      deletedBy.hashCode ^
      deliveredAt.hashCode ^
      deliveredToMeAt.hashCode ^
      editedAt.hashCode ^
      editedBy.hashCode ^
      id.hashCode ^
      metadata.hashCode ^
      muid.hashCode ^
      readAt.hashCode ^
      readByMeAt.hashCode ^
      receiverType.hashCode ^
      sender.hashCode ^
      sentAt.hashCode ^
      TABLE_CONVERSATIONS.hashCode ^
      type.hashCode ^
      updatedAt.hashCode);

  /// Get of the category of message
  String? getCategory() {
    return category;
  }

  /// Returns the id of the Conversation.
  String? getConversationId() {
    return conversationId;
  }

  /// Get timestamp of the message when it was deleted
  int? getDeletedAt() {
    return deletedAt;
  }

  /// Get UID of the user who deleted the message
  String? getDeletedBy() {
    return deletedBy;
  }

  /// Get delivery timestamp of the message
  int? getDeliveredAt() {
    return deliveredAt;
  }

  /// Get timestamp of the message at which it was delivered to logged in user
  int? getDeliveredToMeAt() {
    return deliveredToMeAt;
  }

  /// Get timestamp of the message when it was updated/edited
  int? getEditedAt() {
    return editedAt;
  }

  /// Get UID of the user who edited/updated the message
  String? getEditedBy() {
    return editedBy;
  }

  /// Get id of the message
  int? getId() {
    return id;
  }

  /// Get JSONObject of data set by developer
  Map<dynamic, dynamic>? getMetadata() {
    return metadata;
  }

  /// Get muid of Message Additional id field for the developers in case they want to use.
  String? getMuid() {
    return muid;
  }

  /// Get Timestamp of the when message was read at
  int? getReadAt() {
    return readAt;
  }

  /// Get timestamp when the message is read by logged in user
  int? getReadByMeAt() {
    return readByMeAt;
  }

  /// Returns User/Group object with the details of the receiver of the message.
  AppEntity? getReceiver() {
    return receiver;
  }

  /// Get type of receiver
  ReceiverType getReceiverType() {
    return receiverType;
  }

  /// Get id of the receiver
  String getReceiverUid() {
    return receiverUid;
  }

  /// Get sender object
  User? getSender() {
    return sender;
  }

  /// Get message's sent at timestamp
  int? getSentAt() {
    return sentAt;
  }

  /// Get type of the message
  MessageType? getType() {
    return type;
  }

  /// Get timestamp of the message when it was updated/edited
  int? getUpdatedAt() {
    return updatedAt;
  }

  /// Set category of message
  void setCategory(String category) {
    this.category = category;
  }

  /// Set the id of the Conversation.
  void setConversationId(String conversationId) {
    this.conversationId = conversationId;
  }

  /// Set timestamp of the message when it was deleted
  void setDeletedAt(int deletedAt) {
    this.deletedAt = deletedAt;
  }

  /// Set UID of the user who deleted the message
  void setDeletedBy(String deletedBy) {
    this.deletedBy = deletedBy;
  }

  /// Set delivery timestamp of the message
  void setDeliveredAt(int deliveredAt) {
    this.deliveredAt = deliveredAt;
  }

  /// Set timestamp of the message at which it was delivered to logged in user
  void setDeliveredToMeAt(int deliveredToMeAt) {
    this.deliveredToMeAt = deliveredToMeAt;
  }

  /// Set timestamp of the message when it was updated/edited
  void setEditedAt(int editedAt) {
    this.editedAt = editedAt;
  }

  /// Set UID of the user who edited/updated the message
  void setEditedBy(String editedBy) {
    this.editedBy = editedBy;
  }

  /// Set id of the message
  void setId(int id) {
    this.id = id;
  }

  /// Set JSONObject of data
  void setMetadata(Map<dynamic, dynamic> metadata) {
    this.metadata = metadata;
  }

  /// Set muid of Message Additional id field for the developers in case they want to use.
  void setMuid(String muid) {
    this.muid = muid;
  }

  /// Set Timestamp of the when message was read at
  void setReadAt(int readAt) {
    this.readAt = readAt;
  }

  /// Set timestamp when the message is read by logged in user
  void setReadByMeAt(int readByMeAt) {
    this.readByMeAt = readByMeAt;
  }

  /// Set User/Group object with the details of the receiver of the message.
  void setReceiver(AppEntity receiver) {
    this.receiver = receiver;
  }

  /// Set type of receiver
  void setReceiverType(ReceiverType receiverType) {
    this.receiverType = receiverType;
  }

  /// Set id of the receiver
  void setReceiverUid(String receiverUid) {
    this.receiverUid = receiverUid;
  }

  /// Set sender object
  void setSender(User sender) {
    this.sender = sender;
  }

  /// Set message's sent at timestamp
  void setSentAt(int sentAt) {
    this.sentAt = sentAt;
  }

  /// Set type of the message
  void setType(MessageType type) {
    this.type = type;
  }

  /// Set timestamp of the message when it was updated/edited
  void setUpdatedAt(int updatedAt) {
    this.updatedAt = updatedAt;
  }

  void setParentMessageId(int parentMessageId) {
    this.parentMessageId = parentMessageId;
  }

  int? getParentMessageId() {
    return parentMessageId;
  }

  /// Overrides toString
  @override
  String toString() => toJson().toString();

  factory BaseMessage.fromJson(Map<dynamic, dynamic> json) {
    if (json['category'] != null && json['category'] == "message") {
      if (json["message_type"] != null) {
        MessageType type = getMessageType(json["messageType"]);
        if (type == MessageType.text) {
          return TextMessage.fromJson(json);
        }
        // if (type == MessageType.custom) {
        // return CustomMessage.fromJson(json);
        // }

        // return MediaMessage.fromJson(json);
      }
    }
    return TextMessage.fromJson(json);
  }

  /// Update properties from a map.
  /// Might give errors
  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    if (category != null && category == "message") {
      MessageType type = this.type;
      if (type == MessageType.text) {
        BaseMessage textMessage = this;
        data = textMessage.toJson();
      } else if (type == MessageType.custom) {
        //   CustomMessage customMessage = this;
        //   data = customMessage.toJson();
        // } else {
        //   MediaMessage mediaMessage = this;
        //   data = mediaMessage.toJson();
        // }
      }
    }
    return data;
  }

  static MessageType getMessageType(int value) {
    switch (value) {
      case 0:
        return MessageType.text;
      case 1:
        return MessageType.image;
      case 2:
        return MessageType.video;
      case 3:
        return MessageType.audio;
      case 4:
        return MessageType.file;
      case 5:
        return MessageType.custom;
      case 6:
        return MessageType.groupMember;
      default:
        return MessageType.text;
    }
  }
}
