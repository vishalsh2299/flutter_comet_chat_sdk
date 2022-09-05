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
  TextEditingController _controller = TextEditingController();
  User? _user;

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

    _cometChat.addCallListener(
      "abc",
    );

    _cometChat.callDetails().listen((event) {
      print("UNDER MAIN $event");
      setState(() {
        // message = event.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Comet Chat Plugin App'),
        ),
        body: Center(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "User ID"),
                controller: _controller,
              ),
              TextButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    _cometChat.login(
                      uid: _controller.text,
                      authKey: Constant.authKey,
                      // authToken: Constant.authToken,
                      callbackListener: CallbackListener(
                        onSuccess: (User user) {
                          print("User $user");
                          setState(() {
                            _user = user;
                          });
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
                  }
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
              ),
              // TextButton(
              //     onPressed: () {
              //       _cometChat.initiateCall(_sendTo.text);
              //     },
              //     child: const Text("Initiate call")),
              // TextButton(
              //   onPressed: () {
              //     _cometChat.acceptCall(_messageController.text);
              //   },
              //   child: const Text("Accept Call"),
              // ),
              // TextButton(
              //   onPressed: () {
              //     _cometChat.rejectCall(_messageController.text);
              //   },
              //   child: const Text("Reject Call"),
              // ),
              TextButton(
                onPressed: () {
                  _cometChat.startCall("12345", true, false);
                },
                child: const Text("START CALL"),
              ),
              if (_user != null) Text("Logged User: ${_user!.name}"),
            ],
          ),
        ),
      ),
    );
  }
}
