class CometChatConstants {
  // ignore: non_constant_identifier_names
  static String AUDIO_MODE_SPEAKER = "AudioModeSpeaker";
  // ignore: non_constant_identifier_names
  static String AUDIO_MODE_EARPIECE = "AudioModeEarpiece";
  // ignore: non_constant_identifier_names
  static String RECEIVER_TYPE_USER = "user";
  // ignore: non_constant_identifier_names
  static String RECEIVER_TYPE_GROUP = "group";
  // ignore: non_constant_identifier_names
  static String CONVERSATION_TYPE_USER = "user";
  // ignore: non_constant_identifier_names
  static String CONVERSATION_TYPE_GROUP = "group";
  // ignore: non_constant_identifier_names
  static String MESSAGE_TYPE_TEXT = "text";
  // ignore: non_constant_identifier_names
  static String MESSAGE_TYPE_IMAGE = "image";
  // ignore: non_constant_identifier_names
  static String MESSAGE_TYPE_VIDEO = "video";
  // ignore: non_constant_identifier_names
  static String MESSAGE_TYPE_AUDIO = "audio";
  // ignore: non_constant_identifier_names
  static String MESSAGE_TYPE_FILE = "file";
  // ignore: non_constant_identifier_names
  static String MESSAGE_TYPE_CUSTOM = "custom";
  // ignore: non_constant_identifier_names
  static String USER_STATUS_ONLINE = "online";
  // ignore: non_constant_identifier_names
  static String USER_STATUS_OFFLINE = "offline";
  // ignore: non_constant_identifier_names
  static String GROUP_TYPE_PUBLIC = "public";
  // ignore: non_constant_identifier_names
  static String GROUP_TYPE_PRIVATE = "private";
  // ignore: non_constant_identifier_names
  static String GROUP_TYPE_PASSWORD = "password";

  // ignore: non_constant_identifier_names
  static String CATEGORY_MESSAGE = "message";
  // ignore: non_constant_identifier_names
  static String CATEGORY_ACTION = "action";
  // ignore: non_constant_identifier_names
  static String CATEGORY_CALL = "call";
  // ignore: non_constant_identifier_names
  static String CATEGORY_CUSTOM = "custom";
  // ignore: non_constant_identifier_names
  static String SCOPE_ADMIN = "admin";
  // ignore: non_constant_identifier_names
  static String SCOPE_MODERATOR = "moderator";
  // ignore: non_constant_identifier_names
  static String SCOPE_PARTICIPANT = "participant";
  // ignore: non_constant_identifier_names
  static String CALL_TYPE_AUDIO = "audio";
  // ignore: non_constant_identifier_names
  static String CALL_TYPE_VIDEO = "video";
  // ignore: non_constant_identifier_names
  static String CALL_STATUS_INITIATED = "initiated";
  // ignore: non_constant_identifier_names
  static String CALL_STATUS_ONGOING = "ongoing";
  // ignore: non_constant_identifier_names
  static String CALL_STATUS_UNANSWERED = "unanswered";
  // ignore: non_constant_identifier_names
  static String CALL_STATUS_REJECTED = "rejected";
  // ignore: non_constant_identifier_names
  static String CALL_STATUS_BUSY = "busy";
  // ignore: non_constant_identifier_names
  static String CALL_STATUS_CANCELLED = "cancelled";
  // ignore: non_constant_identifier_names
  static String CALL_STATUS_ENDED = "ended";
  // ignore: non_constant_identifier_names
  static String WS_STATE_CONNECTED = "connected";
  // ignore: non_constant_identifier_names
  static String WS_STATE_CONNECTING = "connecting";
  // ignore: non_constant_identifier_names
  static String WS_STATE_DISCONNECTED = "disconnected";
  // ignore: non_constant_identifier_names
  static String WS_STATE_FEATURE_THROTTLED = "featureThrottled";

  // Conversation Keys
  // ignore: non_constant_identifier_names
  static String KEY_CONVERSATION_ID = "conversationId";
  // ignore: non_constant_identifier_names
  static String KEY_CONVERSATION_TYPE = "conversationType";
  // ignore: non_constant_identifier_names
  static String KEY_UNREAD_MESSAGE_COUNT = "unreadMessageCount";
  // ignore: non_constant_identifier_names
  static String KEY_UPDATED_AT = "updatedAt";
  // ignore: non_constant_identifier_names
  static String KEY_LAST_MESSAGE = "lastMessage";
  // ignore: non_constant_identifier_names
  static String KEY_CONVERSATION_WITH = "conversationWith";

  // Success Message
  // ignore: non_constant_identifier_names
  static String MESSAGE_INIT_SUCCESS = "Init Successful";
  // ignore: non_constant_identifier_names
  static String MESSAGE_GROUP_JOIN_SUCCESS = "Group joined successfully.";
  // ignore: non_constant_identifier_names
  static String MESSAGE_GROUP_LEAVE_SUCCESS = "Group left successfully.";
  // ignore: non_constant_identifier_names
  static String MESSAGE_GROUP_DELETE_SUCCESS = "Group deleted successfully.";
  // ignore: non_constant_identifier_names
  static String MESSAGE_MEMBER_KICKED_SUCCESS =
      "Group member kicked successfully";
  // ignore: non_constant_identifier_names
  static String MESSAGE_MEMBER_BANNED_SUCCESS =
      "Group member banned successfully";
  // ignore: non_constant_identifier_names
  static String MESSAGE_MEMBER_UNBANNED_SUCCESS =
      "Group member unbanned successfully.";
  // ignore: non_constant_identifier_names
  static String MESSAGE_MEMBER_SCOPE_CHANGED_SUCCESS =
      "Group member scope changed successfully.";
  // ignore: non_constant_identifier_names
  static String MESSAGE_LOGOUT_SUCCESS = "User logged out successfully.";
  // ignore: non_constant_identifier_names
  static String MESSAGE_REGISTRATION_SUCCESS = "Token Registration successful.";
  // ignore: non_constant_identifier_names
  static String MESSAGE_TRANSFER_OWNERSHIP_SUCCESS =
      "Group Ownership Transferred successfully.";

  // Call Keys
  // ignore: non_constant_identifier_names
  static String CALL_ID = "id";
  // ignore: non_constant_identifier_names
  static String CALL_SESSION_ID = "sessionid";
  // ignore: non_constant_identifier_names
  static String CALL_RECEIVER = "receiver";
  // ignore: non_constant_identifier_names
  static String CALL_SENDER = "sender";
  // ignore: non_constant_identifier_names
  static String CALL_RECEIVER_TYPE = "receiverType";
  // ignore: non_constant_identifier_names
  static String CALL_STATUS = "status";
  // ignore: non_constant_identifier_names
  static String CALL_TYPE = "type";
  // ignore: non_constant_identifier_names
  static String CALL_INITIATED_AT = "initiatedAt";
  // ignore: non_constant_identifier_names
  static String CALL_JOINED_AT = "joinedAt";
  // ignore: non_constant_identifier_names
  static String CALL_METADATA = "metadata";
  // ignore: non_constant_identifier_names
  static String CALL_ENTITIES = "entities";
  // ignore: non_constant_identifier_names
  static String CALL_ENTITY_TYPE = "entityType";
  // ignore: non_constant_identifier_names
  static String CALL_ENTITY = "entity";
  // ignore: non_constant_identifier_names
  static String CALL_ENTITY_USER = "user";
  // ignore: non_constant_identifier_names
  static String CALL_ENTITY_GROUP = "group";

  // Action Messages
  // ignore: non_constant_identifier_names
  static String ACTION_GROUP_JOINED_MESSAGE = "%s joined";
  // ignore: non_constant_identifier_names
  static String ACTION_GROUP_LEFT_MESSAGE = "%s left";
  // ignore: non_constant_identifier_names
  static String ACTION_MEMBER_KICKED_MESSAGE = "%s kicked %s";
  // ignore: non_constant_identifier_names
  static String ACTION_MEMBER_BANNED_MESSAGE = "%s banned %s";
  // ignore: non_constant_identifier_names
  static String ACTION_MEMBER_UNBANNED_MESSAGE = "%s unbanned %s";
  // ignore: non_constant_identifier_names
  static String ACTION_MESSAGE_EDITED_MESSAGE = "Message Edited";
  // ignore: non_constant_identifier_names
  static String ACTION_MESSAGE_DELETED_MESSAGE = "Message Deleted";
  // ignore: non_constant_identifier_names
  static String ACTION_MEMBER_ADDED_TO_GROUP = "%s added %s";
  // ignore: non_constant_identifier_names
  static String ACTION_MEMBER_SCOPE_CHANGED = "%s made %s %s";

  // Action Keys
  // ignore: non_constant_identifier_names
  static String KEY_BY = "by";
  // ignore: non_constant_identifier_names
  static String KEY_ON = "on";
  // ignore: non_constant_identifier_names
  static String KEY_FOR = "for";
  // ignore: non_constant_identifier_names
  static String KEY_ENTITY_TYPE = "entityType";
  // ignore: non_constant_identifier_names
  static String KEY_ENTITY = "entity";
  // ignore: non_constant_identifier_names
  static String KEY_ENTITY_USER = "user";
  // ignore: non_constant_identifier_names
  static String KEY_ENTITY_GROUP = "group";
  // ignore: non_constant_identifier_names
  static String KEY_ENTITY_MESSAGE = "message";
  // ignore: non_constant_identifier_names
  static String KEY_EXTRAS = "extras";
  // ignore: non_constant_identifier_names
  static String KEY_SCOPE = "scope";
  // ignore: non_constant_identifier_names
  static String KEY_OLD = "old";
  // ignore: non_constant_identifier_names
  static String KEY_NEW = "new";
  // ignore: non_constant_identifier_names
  static String ACTION_CREATED = "created";
  // ignore: non_constant_identifier_names
  static String ACTION_UPDATED = "updated";
  // ignore: non_constant_identifier_names
  static String ACTION_DELETED = "deleted";
  // ignore: non_constant_identifier_names
  static String ACTION_JOINED = "joined";
  // ignore: non_constant_identifier_names
  static String ACTION_LEFT = "left";
  // ignore: non_constant_identifier_names
  static String ACTION_KICKED = "kicked";
  // ignore: non_constant_identifier_names
  static String ACTION_BANNED = "banned";
  // ignore: non_constant_identifier_names
  static String ACTION_UNBANNED = "unbanned";
  // ignore: non_constant_identifier_names
  static String ACTION_SCOPE_CHANGED = "scopeChanged";
  // ignore: non_constant_identifier_names
  static String ACTION_MESSAGE_EDITED = "edited";
  // ignore: non_constant_identifier_names
  static String ACTION_MESSAGE_DELETED = "deleted";
  // ignore: non_constant_identifier_names
  static String ACTION_MEMBER_ADDED = "added";
  // ignore: non_constant_identifier_names
  static String ACTION_TYPE_USER = "user";
  // ignore: non_constant_identifier_names
  static String ACTION_TYPE_GROUP = "group";
  // ignore: non_constant_identifier_names
  static String ACTION_TYPE_GROUP_MEMBER = "groupMember";
  // ignore: non_constant_identifier_names
  static String ACTION_TYPE_MESSAGE = "message";
  // ignore: non_constant_identifier_names
  static String ACTION_TYPE_CALL = "call";

  // User keys
  // ignore: non_constant_identifier_names
  static String USER_KEY_UID = "uid";
  // ignore: non_constant_identifier_names
  static String USER_KEY_NAME = "name";
  // ignore: non_constant_identifier_names
  static String USER_KEY_AVATAR = "avatar";
  // ignore: non_constant_identifier_names
  static String USER_KEY_LINK = "link";
  // ignore: non_constant_identifier_names
  static String USER_KEY_ROLE = "role";
  // ignore: non_constant_identifier_names
  static String USER_KEY_METADATA = "metadata";
  // ignore: non_constant_identifier_names
  static String USER_KEY_CREDITS = "credits";
  // ignore: non_constant_identifier_names
  static String USER_KEY_STATUS = "status";
  // ignore: non_constant_identifier_names
  static String USER_KEY_STATUS_MESSAGE = "statusMessage";
  // ignore: non_constant_identifier_names
  static String USER_KEY_LAST_ACTIVE_AT = "lastActiveAt";
  // ignore: non_constant_identifier_names
  static String USER_KEY_HAS_BLOCKED_ME = "hasBlockedMe";
  // ignore: non_constant_identifier_names
  static String USER_KEY_BLOCKED_BY_ME = "blockedByMe";
  // ignore: non_constant_identifier_names
  static String USER_KEY_TAGS = "tags";
  // ignore: non_constant_identifier_names
  static String USER_KEY_WITH_TAGS = "withTags";

  // AppSettings
  // ignore: non_constant_identifier_names
  static String SUBSCRIPTION_TYPE_ALL_USERS = "ALL_USERS";
  // ignore: non_constant_identifier_names
  static String SUBSCRIPTION_TYPE_FRIENDS = "FRIENDS";
  // ignore: non_constant_identifier_names
  static String SUBSCRIPTION_TYPE_NONE = "NONE";
  // ignore: non_constant_identifier_names
  static String SUBSCRIPTION_TYPE_ROLES = "ROLES";

  // BlockedUserRequest
  // ignore: non_constant_identifier_names
  static String DIRECTION_BLOCKED_BY_ME = "blockedByMe";
  // ignore: non_constant_identifier_names
  static String DIRECTION_BOTH = "both";
  // ignore: non_constant_identifier_names
  static String DIRECTION_HAS_BLOCKED_ME = "hasBlockedMe";

  // BaseMessage
  // ignore: non_constant_identifier_names
  static String TABLE_CONVERSATIONS = "Conversations";

  // Group
  // ignore: non_constant_identifier_names
  static String COLUMN_CREATED_AT = "createdAt";
  // ignore: non_constant_identifier_names
  static String COLUMN_DESCRIPTION = "description";
  // ignore: non_constant_identifier_names
  static String COLUMN_GROUP_TYPE = "type";
  // ignore: non_constant_identifier_names
  static String COLUMN_GUID = "guid";
  // ignore: non_constant_identifier_names
  static String COLUMN_HAS_JOINED = "hasJoined";
  // ignore: non_constant_identifier_names
  static String COLUMN_ICON = "icon";
  // ignore: non_constant_identifier_names
  static String COLUMN_IDENTITY = "groupIdentity";
  // ignore: non_constant_identifier_names
  static String COLUMN_METADATA = "metadata";
  // ignore: non_constant_identifier_names
  static String COLUMN_NAME = "name";
  // ignore: non_constant_identifier_names
  static String COLUMN_OWNER = "owner";
  // ignore: non_constant_identifier_names
  static String COLUMN_PASSWORD = "password";
  // ignore: non_constant_identifier_names
  static String COLUMN_UPDATED_AT = "updatedAt";
  // ignore: non_constant_identifier_names
  static String TABLE_GROUPS = "Groups";

  // MessageReceipt
  // ignore: non_constant_identifier_names
  static String RECEIPT_TYPE_DELIVERED = "delivered";
  // ignore: non_constant_identifier_names
  static String RECEIPT_TYPE_READ = "read";
}
