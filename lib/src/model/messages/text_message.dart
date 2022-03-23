import 'dart:convert';
import 'package:flutter_comet_chat_sdk/flutter_comet_chat_sdk.dart';

class TextMessage extends BaseMessage {
  String text = '';

  TextMessage({
    required String receiverUid,
    required String text,
    required ReceiverType receiverType,
  }) : super(
            receiverUid: receiverUid,
            type: MessageType.text,
            receiverType: receiverType) {
    text = text;
  }

  String getText() {
    return text;
  }

  void setText(String text) {
    this.text = text;
  }

  /// Update properties from a map.
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['category'] = category;
    data['conversationId'] = conversationId;
    data['deletedAt'] = deletedAt;
    data['deletedBy'] = deletedBy;
    data['deliveredAt'] = deliveredAt;
    data['deliveredToMeAt'] = deliveredToMeAt;
    data['editedAt'] = editedAt;
    data['editedBy'] = editedBy;
    data['id'] = id;
    data['metadata'] = metadata;
    data['muid'] = muid;
    data['readAt'] = readAt;
    data['readByMeAt'] = readByMeAt;
    data['receiver'] = receiver?.toJson();
    data['receiverUid'] = receiverUid;
    data['receiverType'] = receiverType;
    data['sender'] = sender?.toJson();
    data['sentAt'] = sentAt;
    data['type'] = type;
    data['updatedAt'] = updatedAt;
    data['parentMessageId'] = parentMessageId;
    return data;
  }

  /// Construct from a map.
  TextMessage.fromJson(Map<dynamic, dynamic> json) {
    text = json['text'];
    category = json['category'];
    conversationId = json['conversationId'];
    deletedAt = json['deletedAt'];
    deletedBy = json['deletedBy'];
    deliveredAt = json['deliveredAt'];
    deliveredToMeAt = json['deliveredToMeAt'];
    editedAt = json['editedAt'];
    editedBy = json['editedBy'];
    id = json['id'];
    metadata = json['metadata'];
    muid = json['muid'];
    readAt = json['readAt'];
    readByMeAt = json['readByMeAt'];
    receiver = json['receiver'] != null
        ? AppEntity.fromJson(jsonDecode(json['receiver']), json['receiverType'])
        : null;
    receiverUid = json['receiverUid'];
    receiverType = json['receiverType'];
    sender = json['sender'] != null
        ? User.fromJson(jsonDecode(json['sender']))
        : null;
    sentAt = json['sentAt'];
    type = json['type'];
    updatedAt = json['updatedAt'];
    parentMessageId = json['parentMessageId'];
  }
}
