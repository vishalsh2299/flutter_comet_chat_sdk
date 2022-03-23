import 'dart:async';
import 'dart:convert';

/// Comet Chat utility package.
///
/// This is a preliminary API.
import 'package:flutter/services.dart';
import 'package:flutter_comet_chat_sdk/flutter_comet_chat_sdk.dart';

/// Entry point for the CometChat Dart.
class FlutterCometChatDart {
  static const MethodChannel channel =
      MethodChannel('plugins.flutter.io/comet_chat_dart');

  static const EventChannel loginEventTrigger =
      EventChannel('plugins.flutter.io/login_event_trigger');
  static const EventChannel loginEventListener =
      EventChannel("plugins.flutter.io/login_event_listener");

  static const EventChannel messageEventTrigger =
      EventChannel('plugins.flutter.io/message_event_trigger');
  static const EventChannel messageEventListener =
      EventChannel("plugins.flutter.io/message_event_listener");

  late StreamSubscription _loginEventsubscription;
  late StreamSubscription _messageEventsubscription;

  final Authentication _auth = Authentication();
  final Messaging _messaging = Messaging();

  cancelSubscription(StreamSubscription streamSubscription) {
    return () {
      streamSubscription.cancel();
    };
  }

  ///The init() method initializes the settings required for CometChat.
  ///The init() method takes the below parameters:
  /// * [appId] - Your CometChat App ID
  /// * [appRegion] - Your CometChat App Region
  init(String appId, AppSettings appSettings,
      CallbackListener callbackListener) async {
    assert(appId != '');
    assert(appSettings.region != '');

    dynamic res = await _auth.initialize(
      appId: appId,
      appSettings: appSettings,
    );

    if (res == true) {
      callbackListener.onSuccess(true);
    } else {
      callbackListener.onError(res);
    }
  }

  /// Once initialization is successful, This method Logs in to CometChat.
  /// Either **authKey** and **uid** is required or **authToken** for login
  /// * [uid] The UID of the user that you would like to login
  /// * [authkey] CometChat App Auth Key
  /// * [authToken] Auth Token of the user you would like to login
  login(
      {String? authKey,
      String? uid,
      String? authToken,
      required CallbackListener callbackListener}) {
    assert((uid != '' && authKey != '') || (authToken != ''));

    _auth.login(authKey: authKey, uid: uid, authToken: authToken);

    _loginEventsubscription = _auth.loginEventTrigger().listen((event) {
      if (event.containsKey(CometConstantsKeys.LOGIN_SUCCESS)) {
        var data = jsonDecode(event[CometConstantsKeys.LOGIN_SUCCESS]);
        callbackListener.onSuccess(User.fromJson(data));
      }
      if (event.containsKey(CometConstantsKeys.LOGIN_FAILURE)) {
        callbackListener.onError(event);
      }
    });

    cancelSubscription(_loginEventsubscription);
  }

  logout(CallbackListener callbackListener) {
    _auth.logout();

    _loginEventsubscription = _auth.loginEventTrigger().listen((event) {
      if (event.containsKey(CometConstantsKeys.LOGOUT_SUCCESS)) {
        callbackListener.onSuccess(event[CometConstantsKeys.LOGOUT_SUCCESS]);
      }
      if (event.containsKey(CometConstantsKeys.LOGOUT_FAILURE)) {
        callbackListener.onError(event[CometConstantsKeys.LOGOUT_FAILURE]);
      }
    });
    cancelSubscription(_loginEventsubscription);
  }

  /// Provides you with real-time updates for the login and logout events.
  /// To add the LoginListener, you need to use the addLoginListener() method provided by the SDK which takes a unique identifier for the listener and of the the LoginListener class itself.
  /// * [uniqueID] Unique listener id
  /// * [loginListener] Callback method that returns -
  /// 1. **loginSuccess** : returns User object on successful login
  /// 2. **loginFailure** : returns error on login failed
  /// 3. **logoutSuccess** : callback for successful logout
  /// 4. **logoutFailure** : callback for failed logout
  Future<void> addLoginListener(
      String uniqueID, LoginListener loginListener) async {
    assert(uniqueID != '');
    _auth.addLoginListener(uniqueID);

    _auth.loginEventListener().listen((event) {
      if (event.containsKey(CometConstantsKeys.LOGIN_FAILURE)) {
        loginListener.loginFailure(event);
      }
      if (event.containsKey(CometConstantsKeys.LOGIN_SUCCESS)) {
        var data = jsonDecode(event[CometConstantsKeys.LOGIN_SUCCESS]);
        loginListener.loginSuccess(User.fromJson(data));
      }
      if (event.containsKey(CometConstantsKeys.LOGOUT_FAILURE)) {
        loginListener.logoutFailure(event[CometConstantsKeys.LOGOUT_FAILURE]);
      }
      if (event.containsKey(CometConstantsKeys.LOGOUT_SUCCESS)) {
        loginListener.logoutSuccess(event[CometConstantsKeys.LOGOUT_SUCCESS]);
      }
    });
  }

  /// To send a text message to a single user or group
  /// * [textMessage] it is a TextMessage object that requires receiverID, messageText, receiverType
  /// * [callbackListener] this will give onSuccess and onError response
  /// 1. [onSuccess] : returns TextMessage object
  /// 2. [onError] : returns error if message is not sent
  Future<void> sendMessage(
      TextMessage textMessage, CallbackListener callbackListener) async {
    _messaging.sendMessage(textMessage);

    _messageEventsubscription =
        _messaging.messageEventTrigger().listen((event) {
      if (event.containsKey(CometConstantsKeys.TEXT_MESSAGE)) {
        // var data = jsonDecode(event[CometConstantsKeys.TEXT_MESSAGE]);
        callbackListener.onSuccess(TextMessage.fromJson(
            Map<dynamic, dynamic>.from(
                event[CometConstantsKeys.TEXT_MESSAGE])));
      }
      if (event.containsKey(CometConstantsKeys.TEXT_MESSAGE_SENDING_FAILED)) {
        callbackListener.onError(event);
      }
    });

    cancelSubscription(_messageEventsubscription);
  }

  static Exception convertException(PlatformException err) {
    return ErrorDetails(
        errorCode: err.code, errorDescription: err.message ?? "");
  }
}
