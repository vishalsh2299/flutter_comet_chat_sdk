import 'package:flutter/material.dart';
import 'package:flutter_comet_chat_sdk/flutter_comet_chat_sdk.dart';
import 'package:flutter_comet_chat_sdk_example/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cometChat = FlutterCometChatDart();

  @override
  void initState() {
    super.initState();

    AppSettings appSettings = (AppSettingsBuilder()
          ..subscribePresenceForAllUsers()
          ..setRegion("US"))
        .build();

    _cometChat.init(
      Constant.appID,
      appSettings,
      CallbackListener(
        onSuccess: (dynamic value) {
          print("SUCCESSFULLY INITIALIZED $value");
        },
        onError: (dynamic error) {
          print("FAILED TO INITIALIZE $error");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                _cometChat.login(
                  uid: "superhero2",
                  authKey: Constant.authKey,
                  // authToken: Constant.authToken,
                  callbackListener: CallbackListener(
                    onSuccess: (User user) {
                      print("User $user");
                    },
                    onError: (e) {
                      print("Error $e");
                    },
                  ),
                );

                _cometChat.addLoginListener(
                  "superhero2",
                  LoginListener(
                    loginSuccess: (User user) {
                      print("LOGIN SUCCESS LISTENER $user");
                    },
                    loginFailure: (dynamic value) {
                      print("LOGIN FAILURE LISTENER");
                    },
                    logoutSuccess: (dynamic value) {
                      print("LOGOUT SUCCESS LISTENER");
                    },
                    logoutFailure: (dynamic value) {
                      print("LOGOUT FAILURE LISTENER");
                    },
                  ),
                );
              },
              child: const Text("LOGIN"),
            ),
            TextButton(
              onPressed: () {
                _cometChat.logout(
                  CallbackListener(
                    onSuccess: (String value) {
                      print("Value $value");
                    },
                    onError: (e) {
                      print("Error $e");
                    },
                  ),
                );
              },
              child: const Text("LOGOUT"),
            )
          ],
        ),
      ),
    );
  }
}
